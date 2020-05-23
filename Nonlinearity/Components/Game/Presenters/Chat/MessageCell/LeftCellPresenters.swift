//
//  LeftCellPresenters.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatLeftUnauthoredMessageCellPresenter: ChatBaseLeftMessageCellPresenter {
    var unauthoredPresenter: ChatMessageUnauthoredPresenter!
    
    override var messagePresenter: ChatMessagePresenter! {
        unauthoredPresenter
    }
}

final class ChatLeftAuthoredMessageCellPresenter: ChatBaseLeftMessageCellPresenter {
    var authoredPresenter: ChatMessageAuthoredPresenter!
    
    override var messagePresenter: ChatMessagePresenter! {
        authoredPresenter
    }
}
