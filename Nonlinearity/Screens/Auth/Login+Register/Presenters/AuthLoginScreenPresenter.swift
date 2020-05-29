//
//  AuthLoginScreenPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class AuthLoginScreenPresenter {
    unowned let view: AuthScreenViewProtocol
    
    var formPresenter: DoubleFormPresenter!
    
    init(view: AuthScreenViewProtocol) {
        self.view = view
    }
    
    func setupView() {
        formPresenter?.setupView()
    }
}
