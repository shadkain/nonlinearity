//
//  BottomPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatBottomPresenterProtocol {
    func show()
    func didTapNextButton()
}

final class ChatBottomPresenter: ChatBottomPresenterProtocol {
    unowned var view: ChatBottomViewProtocol!
    var model: ChatBottom
    
    init(model: ChatBottom, view: ChatBottomViewProtocol) {
        self.view = view
        self.model = model
        
        view.set(appearance: DarkChatBottomViewAppearance())
    }
    
    func show() {
        
    }
    
    func didTapNextButton() {
        model.nextButtonAction?()
        print("did tap next")
    }
}
