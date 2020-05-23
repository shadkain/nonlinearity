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
        view.bottomView.presenter = presenter.bottomPresenter
        
        self.view = view
        view.presenter = presenter
    }
}

protocol ChatScreenPresenterProtocol {
    var messagesCount: Int { get }
    
    func show()
    func messageType(for: Int) -> ChatMessageType
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, for: Int)
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
    
    func messageType(for index: Int) -> ChatMessageType {
        switch model.role(for: index)! {
        case .firstPerson:
            return .right
        case .secondPerson:
            return model.isGroup ? .leftAuthored : .leftUnauthored
        }
    }
    
    var messagesCount: Int {
        model.cursor + 1
    }
    
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, for index: Int) {
        if let presenter = cell.presenter as? ChatMessageCellPresenter {
            presenter.model = model.message(at: index)
        } else {
            _ = ChatMessageCellConfigurator(view: cell, model: model.message(at: index), type: messageType(for: index))
        }
        
        showCell(cell, for: index)
    }
    
    private func showCell(_ cell: ChatMessageCellProtocol, for index: Int) {
        if index == 0 {
            cell.presenter.show(at: .first)
        } else if model.lastInChain(by: index) || model.cursor == index {
            cell.presenter.show(at: .last)
        } else {
            cell.presenter.show(at: .regular)
        }
    }
}
