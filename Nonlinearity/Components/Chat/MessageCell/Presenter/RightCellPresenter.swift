//
//  RightCellPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatRightMessageCellPresenter: ChatMessageCellPresenter {
    unowned let view: ChatRightMessageCellProtocol
    
    var unauthoredPresenter: ChatMessageUnauthoredPresenter
    
    var messagePresenter: ChatMessagePresenter! {
        unauthoredPresenter
    }
    
    init(model: ChatMessage, view: ChatRightMessageCellProtocol) {
        self.view = view
        self.unauthoredPresenter = .init(model: model, view: view.unauthoredMessageViewProtocol)
    }
    
    func show(as location: ChatMessageCellLocation, showingAvatar: Bool) {
        view.setLocation(location)
        
        messagePresenter.show(as: .firstPerson)
    }
}
