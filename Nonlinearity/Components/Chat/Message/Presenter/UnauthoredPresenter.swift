//
//  UnauthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatMessageUnauthoredPresenter: ChatMessagePresenter {
    unowned let view: ChatMessageUnauthoredViewProtocol
    var model: ChatMessage
    
    init(model: ChatMessage, view: ChatMessageUnauthoredViewProtocol) {
        self.model = model
        self.view = view
        
        view.setAppearance(DarkChatMessageAppearance())
    }
    
    func show(as role: ChatMessageRole?) {
        updateBackgroundColor(ofView: view, with: DarkChatMessageAppearance(), as: role)
        
        view.setMessage(model.text)
        view.setTime(model.time.time24)
        view.rebuild()
    }
}
