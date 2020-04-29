//
//  HeaderPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

protocol ChatHeaderPresenterProtocol {
    func show()
    func didTapBackArrow()
}

final class ChatHeaderPresenter: ChatHeaderPresenterProtocol {
    unowned var view: ChatHeaderViewProtocol
    var model: Chat.Header
    
    init(model: Chat.Header, view: ChatHeaderViewProtocol) {
        self.view = view
        self.model = model
        
        view.set(appearance: DarkChatHeaderViewAppearance())
    }
    
    func show() {
        view.set(name: model.companion.concatNameString())
        view.set(networkStatus: model.networkStatus.string)
    }
    
    func didTapBackArrow() {
        print("tapped")
    }
}
