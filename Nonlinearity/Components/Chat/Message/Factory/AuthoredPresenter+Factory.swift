//
//  AuthoredPresenter+Factory.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

extension ChatMessageAuthoredPresenter {
    enum Factory {
        static func make(model: ChatMessage, view: ChatMessageAuthoredView) -> ChatMessageAuthoredPresenter {
            let presenter = Factory.make(view: view)
            presenter.model = model
            
            return presenter
        }
        
        static func make(view: ChatMessageAuthoredView) -> ChatMessageAuthoredPresenter {
            let presenter = ChatMessageAuthoredPresenter(view: view)
            presenter.unauthoredPresenter = .init(view: view.unauthoredView)
            
            return presenter
        }
    }
}
