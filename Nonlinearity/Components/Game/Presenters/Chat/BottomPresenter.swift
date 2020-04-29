//
//  BottomPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatBottomPresenterProtocol {
    func show()
    func didTapNextArrow()
}

final class ChatBottomPresenter: ChatBottomPresenterProtocol {
    unowned var view: ChatBottomViewProtocol!
    
    func show() {
        
    }
    
    func didTapNextArrow() {
        
    }
}
