//
//  ChatScreenPresenter+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatScreenPresenterProtocol {
    var messagesCount: Int { get }
    
    func messageType(at: Int) -> ChatMessageType
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, at: Int)
}

extension ChatScreenPresenter: ChatScreenPresenterProtocol, ChatHeaderPresenterProtocol, ChatFooterPresenterProtocol {
    var messagesCount: Int {
        model.cursor+1
    }
    
    func messageType(at index: Int) -> ChatMessageType {
        switch try! model.messageRole(at: index) {
        case .firstPerson:
            return .right
        case .secondPerson:
            return try! model.messageIsFirst(at: index) ? .leftAuthored : .leftUnauthored
        }
    }
    
    func cellWillBeInserted(_ cell: ChatMessageCellProtocol, at index: Int) {
        if cell.presenter == nil {
        }
        
        if let presenter = cell.presenter as? ChatMessageCellPresenter {
            presenter.model = try! model.message(at: index)
        } else {
            _ = ChatMessageCellConfigurator(view: cell, model: try! model.message(at: index), type: messageType(at: index))
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
    
    func didTapBackButton() {
        print("did tap back")
    }
    
    func didTapNextButton() {
        guard view.isScrolledToBottom else {
            view.scrollToBottom()
            return
        }
        guard model.stepForward() else {
            return
        }
        
        view.reload()
        
        view.headerViewProtocol.setSmallText("\(model.percentage)%")
    }
}
