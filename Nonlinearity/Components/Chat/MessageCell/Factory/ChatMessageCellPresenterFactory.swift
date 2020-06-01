//
//  ChatBaseMessagePresenter+Factory.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum ChatMessageCellPresenterFactory {
    static func make(model: ChatMessage, view: ChatMessageCellProtocol) -> ChatMessageCellPresenter {
        switch view {
        case let view as ChatRightMessageCellProtocol:
            return ChatRightMessageCellPresenter(model: model, view: view)
        case let view as ChatLeftUnauthoredMessageCellProtocol:
            return ChatLeftUnauthoredMessageCellPresenter(model: model, view: view)
        case let view as ChatLeftAuthoredMessageCellProtocol:
            return ChatLeftAuthoredMessageCellPresenter(model: model, view: view)
        default:
            fatalError("view: ChatMessageCellProtocol must be some of 3 derived protocols")
        }
    }
}
