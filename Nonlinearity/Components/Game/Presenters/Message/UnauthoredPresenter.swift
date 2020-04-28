//
//  UnauthoredPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class MessageUnauthoredPresenter: MessagePresenterProtocol {
    unowned var view: MessageUnauthoredViewProtocol
    var model: Message
    
    init(model: Message, view: MessageUnauthoredViewProtocol) {
        self.view = view
        self.model = model
        
        view.set(appearance: DarkMessageAppearance())
    }
    
    func show(as role: MessageRole?) {
        view.set(message: model.text)
        view.set(time: model.time.time24)
        view.set(role: role)
        view.rebuild()
    }
}
