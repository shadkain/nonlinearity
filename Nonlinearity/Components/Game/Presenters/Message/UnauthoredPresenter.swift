//
//  UnauthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatMessageUnauthoredPresenter: ChatMessagePresenter {
    unowned var view: ChatMessageUnauthoredViewProtocol
    var model: Chat.Message
    
    init(model: Chat.Message, view: ChatMessageUnauthoredViewProtocol) {
        self.view = view
        self.model = model
        
        view.set(appearance: DarkChatMessageAppearance())
    }
    
    func show(as role: Chat.Message.Role?) {
        view.set(message: model.text)
        view.set(time: model.time.time24)
        view.set(role: role)
        view.rebuild()
    }
}
