//
//  BaseLeftCellPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

class ChatBaseLeftMessageCellPresenter: ChatMessageCellPresenter {
    unowned let view: ChatBaseLeftMessageCellProtocol
    
    var messagePresenter: ChatMessagePresenter! {
        fatalError("messagePresenter: ChatMessagePresenter has not been implemented")
    }
    
    init(view: ChatBaseLeftMessageCellProtocol) {
        self.view = view
    }
    
    func show(at vLocation: ChatMessageCellVLocation) {
        messagePresenter.show(as: .secondPerson)
        view.set(vLocation: vLocation)
        view.setAvatarBgColor(first: model.author.colors.first.rawValue, second: model.author.colors.second?.rawValue)
        updateVLocation(vLocation)
    }
    
    func updateVLocation(_ vLocation: ChatMessageCellVLocation) {
        if vLocation == .last {
            view.showAvatar = true
            view.set(avatarLetters: model.author.lettersString())
        } else {
            view.showAvatar = false
        }
    }
}
