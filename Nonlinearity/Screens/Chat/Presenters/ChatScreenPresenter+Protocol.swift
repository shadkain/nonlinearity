//
//  ChatScreenPresenter+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatScreenPresenterProtocol {
    var messagesCount: Int { get }
    
    func messageId(at: Int) -> String
    func showCell(_ cell: ChatMessageCellProtocol, at index: Int)
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
    
    func messageId(at index: Int) -> String {
        switch try! model.messageRole(at: index) {
        case .firstPerson:
            return view.rightMessageId
        case .secondPerson:
            return try! model.messageIsFirst(at: index) ? view.leftAuthoredMessageId : view.leftUnauthoredMessageId
        }
    }
    
    func showCell(_ cell: ChatMessageCellProtocol, at index: Int) {
        let messageModel = try! model.message(at: index)
        if cell.presenter == nil {
            cell.presenter = ChatMessageCellPresenterFactory.make(model: messageModel, view: cell)
        } else {
            (cell.presenter as! ChatMessageCellPresenter).model = messageModel
        }

        cell.presenter.show(as: messageLocation(at: index), showingAvatar: shouldShowAvatar(at: index))
    }
    
    private func messageLocation(at index: Int) -> ChatMessageCellLocation {
        if index == 0 {
            return .first
        } else if try! model.messageIsLast(at: index) || model.cursor == index {
            return .lastInChain
        } else {
            return .regular
        }
    }
    
    private func shouldShowAvatar(at index: Int) -> Bool {
        return try! model.messageIsLast(at: index) || model.cursor == index
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
            view.scrollToBottom()
            return
        }
        
        view.reload()
        
        view.headerViewProtocol.setSmallText("\(model.percentage)%")
    }
}
