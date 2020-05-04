//
//  AuthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatMessageAuthoredPresenter: ChatMessagePresenter {
    unowned let view: ChatMessageAuthoredViewProtocol
    var model: Chat.Message {
        get { unauthoredPresenter.model }
        set { unauthoredPresenter.model = newValue }
    }
    
    // MARK: subpresenters
    var unauthoredPresenter: ChatMessageUnauthoredPresenter!
    
    init(view: ChatMessageAuthoredViewProtocol) {
        self.view = view
        view.set(appearance: DarkChatMessageAppearance())
    }
    
    func show(as role: Chat.Message.Role?) {
        view.set(author: model.author.concatNameString())
        view.set(role: role)
        
        unauthoredPresenter.show(as: .none)
    }
}
