//
//  MessageCellPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatMessageCellPresenterProtocol: class {
    func show(as location: ChatMessageCellLocation, showingAvatar: Bool)
}

protocol ChatMessageCellPresenter: ChatMessageCellPresenterProtocol {
    var model: ChatMessage { get set }
    var messagePresenter: ChatMessagePresenter! { get }
}

extension ChatMessageCellPresenter {
    var model: ChatMessage {
        get { messagePresenter.model }
        set { messagePresenter.model = newValue }
    }
}
