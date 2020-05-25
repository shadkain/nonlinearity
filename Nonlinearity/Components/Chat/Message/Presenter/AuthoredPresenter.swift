//
//  AuthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatMessageAuthoredPresenter: ChatMessagePresenter {
    unowned let view: ChatMessageAuthoredViewProtocol
    var model: ChatMessage {
        get { unauthoredPresenter.model }
        set { unauthoredPresenter.model = newValue }
    }
    
    // MARK: subpresenters
    var unauthoredPresenter: ChatMessageUnauthoredPresenter!
    
    init(view: ChatMessageAuthoredViewProtocol) {
        self.view = view
        view.set(appearance: DarkChatMessageAppearance())
    }
    
    func show(as role: ChatMessageRole?) {
        view.set(author: model.author.fullName)
        view.set(role: role)
        view.setTextColors(first: model.author.colors.first.rawValue, second: model.author.colors.second?.rawValue)
        
        unauthoredPresenter.show(as: .none)
    }
}
