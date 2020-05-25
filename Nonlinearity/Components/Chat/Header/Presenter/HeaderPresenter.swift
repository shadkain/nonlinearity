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
    func didTapBackButton()
}

final class ChatHeaderPresenter: ChatHeaderPresenterProtocol {
    unowned var view: ChatHeaderViewProtocol
    var model: ChatHeader
    
    init(model: ChatHeader, view: ChatHeaderViewProtocol) {
        self.view = view
        self.model = model
        
        view.set(appearance: DarkChatHeaderViewAppearance())
    }
    
    func show() {
        view.setBigText(model.companion.fullName)
        view.setSmallText(model.networkStatus.string)
    }
    
    func didTapBackButton() {
        model.backButtonAction?()
        print("did tap back")
    }
}
