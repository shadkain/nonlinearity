//
//  AuthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatMessageAuthoredPresenter: ChatMessagePresenter {
    let unauthored: ChatMessageUnauthoredPresenter
    unowned var view: ChatMessageAuthoredView
    var model: Chat.Message {
        get { unauthored.model }
        set { unauthored.model = newValue }
    }
    
    init(model: Chat.Message, view: ChatMessageAuthoredView) {
        self.unauthored = .init(model: model, view: view.unauthoredSubview)
        self.view = view
        
        view.set(appearance: DarkChatMessageAppearance())
    }
    
    func show(as role: Chat.Message.Role?) {
        view.set(author: model.author.concatNameString())
        view.set(role: role)
        
        unauthored.show(as: .none)
    }
}
