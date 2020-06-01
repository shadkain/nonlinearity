//
//  BaseLeftCellPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

class ChatBaseLeftMessageCellPresenter: ChatMessageCellPresenter {
    unowned let view: ChatLeftMessageCellProtocol
    
    var messagePresenter: ChatMessagePresenter! {
        fatalError("messagePresenter: ChatMessagePresenter has not been implemented")
    }
    
    init(view: ChatLeftMessageCellProtocol) {
        self.view = view
    }
    
    func show(as location: ChatMessageCellLocation, showingAvatar: Bool) {
        messagePresenter.show(as: .secondPerson)
        
        view.setLocation(location)
        
        view.showAvatar = showingAvatar
        if showingAvatar {
            view.setAvatarColors(
                first: model.author.colors.first.rawValue,
                second: model.author.colors.second.rawValue
            )
            view.setAvatarText(model.author.initials)
        }
    }
}
