//
//  BottomPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatFooterPresenterProtocol {
    func show()
    func didTapNextButton()
}

final class ChatBottomPresenter: ChatFooterPresenterProtocol {
    unowned var view: ChatFooterViewProtocol!
    var model: ChatBottom
    
    init(model: ChatBottom, view: ChatFooterViewProtocol) {
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
