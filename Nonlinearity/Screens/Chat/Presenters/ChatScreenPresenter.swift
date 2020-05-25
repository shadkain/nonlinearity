//
//  ChatScreenPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct ChatScreenConfigurator {
    let view: ChatScreenView
    let presenter: ChatScreenPresenter
    
    init(model: ChatModel, view: ChatScreenView) {
        presenter = .init(model: model, view: view)
        
        presenter.headerPresenter = .init(model: .init(companion: model.companions[0], networkStatus: .offline), view: view.headerView)
        view.headerView.presenter = presenter.headerPresenter
        
        presenter.bottomPresenter = .init(model: .init(), view: view.bottomView)
        presenter.bottomPresenter.model.nextButtonAction = { [unowned presenter] in
            presenter.step()
        }
        
        view.bottomView.presenter = presenter.bottomPresenter
        
        self.view = view
        view.presenter = presenter
    }
}

protocol ChatScreenPresenterProtocol {
    var messagesCount: Int { get }
    
    func show()
    func messageType(forIndex: Int) -> ChatMessageType
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, forIndex: Int)
}

enum ChatMessageType {
    case right, leftUnauthored, leftAuthored
}

final class ChatScreenPresenter: ChatScreenPresenterProtocol {
    unowned let view: ChatScreenViewProtocol
    var model: ChatModel
    
    // MARK: - Subpresenters
    var headerPresenter: ChatHeaderPresenter!
    var bottomPresenter: ChatBottomPresenter!
    
    init(model: ChatModel, view: ChatScreenViewProtocol) {
        self.view = view
        self.model = model
    }
    
    func show() {
        headerPresenter.show()
        bottomPresenter.show()
    }
    
    func messageType(forIndex index: Int) -> ChatMessageType {
        switch try! model.messageRole(at: index) {
        case .firstPerson:
            return .right
        case .secondPerson:
            return try! model.messageIsFirst(at: index) ? .leftAuthored : .leftUnauthored
        }
    }
    
    var messagesCount: Int {
        model.cursor+1
    }
    
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, forIndex index: Int) {
        if let presenter = cell.presenter as? ChatMessageCellPresenter {
            presenter.model = try! model.message(at: index)
        } else {
            _ = ChatMessageCellConfigurator(view: cell, model: try! model.message(at: index), type: messageType(forIndex: index))
        }
        
        showCell(cell, for: index)
    }
    
    private func showCell(_ cell: ChatMessageCellProtocol, for index: Int) {
        if index == 0 {
            cell.presenter.show(at: .first)
        } else if try! model.messageIsLast(at: index) || model.cursor == index {
            cell.presenter.show(at: .last)
        } else {
            cell.presenter.show(at: .regular)
        }
    }
    
    func step() {
        guard view.isScrolledToBottom,
            model.stepForward() else {
                view.scrollToBottom()
                return
        }
        
        view.reload()
        
        headerPresenter.view.setSmallText("\(model.percentage)%")
    }
}
