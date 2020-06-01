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
    
    let unauthoredPresenter: ChatMessageUnauthoredPresenter
    
    init(model: ChatMessage, view: ChatMessageAuthoredViewProtocol) {
        self.view = view
        unauthoredPresenter = ChatMessageUnauthoredPresenter(model: model, view: view.unauthoredViewProtocol)
    }
    
    func show(as role: ChatMessageRole?) {
        updateBackgroundColor(ofView: view, with: DarkChatMessageAppearance(), as: role)
        
        view.setAuthor(model.author.fullName)
        view.setTextColors(
            first: model.author.colors.first.rawValue,
            second: model.author.colors.second.rawValue
        )
        
        unauthoredPresenter.show(as: .none)
    }
}
