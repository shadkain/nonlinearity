//
//  ChatScreenPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatScreenPresenter {
    func show()
}

extension Chat {
    final class ScreenPresenter: ChatScreenPresenter {
        unowned let view: ChatScreenView
        var model: Chat
        let headerPresenter: ChatHeaderPresenter
        
        init(model: Chat, view: ChatScreenView) {
            self.view = view
            self.model = model
            
            headerPresenter = .init(model: .init(companion: model.companions[0],
                                                 networkStatus: .offline), view: view.headerView)
        }
        
        func show() {
            headerPresenter.show()
        }
    }
}
