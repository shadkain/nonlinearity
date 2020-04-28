//
//  AuthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class MessageAuthoredPresenter: MessagePresenterProtocol {
    let unauthored: MessageUnauthoredPresenter
    unowned var view: MessageAuthoredViewProtocol
    var model: Message {
        get { unauthored.model }
        set { unauthored.model = newValue }
    }
    
    init(model: Message, view: MessageAuthoredViewProtocol) {
        self.unauthored = .init(model: model, view: view.unauthored)
        self.view = view
        
        view.set(appearance: DarkMessageAppearance())
    }
    
    func show(as role: MessageRole?) {
        view.set(author: model.author.concatNameString())
        view.set(role: role)
        
        unauthored.show(as: .none)
    }
}
