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
    
    init(view: ChatBottomViewProtocol) {
        self.view = view
        
        view.set(appearance: DarkChatBottomViewAppearance())
    }
    
    func show() {
        
    }
    
    func didTapNextButton() {
        print("did tap next")
    }
}
