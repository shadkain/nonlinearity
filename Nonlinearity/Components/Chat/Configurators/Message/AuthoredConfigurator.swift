//
//  AuthoredConfigurator.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 02.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct ChatMessageAuthoredConfigurator {
    let view: ChatMessageAuthoredView
    let presenter: ChatMessageAuthoredPresenter
    
    init(model: ChatMessage, view: ChatMessageAuthoredView) {
        presenter = .init(view: view)
        presenter.unauthoredPresenter = .init(model: model, view: view.unauthoredView)
        
        self.view = view
    }
}
