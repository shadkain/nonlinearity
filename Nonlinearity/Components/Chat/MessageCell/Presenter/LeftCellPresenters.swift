//
//  LeftCellPresenters.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatLeftUnauthoredMessageCellPresenter: ChatBaseLeftMessageCellPresenter {
    let unauthoredPresenter: ChatMessageUnauthoredPresenter
    
    init(model: ChatMessage, view: ChatLeftUnauthoredMessageCellProtocol) {
        unauthoredPresenter = .init(model: model, view: view.unauthoredMessageViewProtocol)
        super.init(view: view)
    }
    
    override var messagePresenter: ChatMessagePresenter! {
        unauthoredPresenter
    }
}

final class ChatLeftAuthoredMessageCellPresenter: ChatBaseLeftMessageCellPresenter {
    let authoredPresenter: ChatMessageAuthoredPresenter
    
    init(model: ChatMessage, view: ChatLeftAuthoredMessageCellProtocol) {
        authoredPresenter = .init(model: model, view: view.authoredMessageViewProtocol)
        super.init(view: view)
    }
    
    override var messagePresenter: ChatMessagePresenter! {
        authoredPresenter
    }
}
