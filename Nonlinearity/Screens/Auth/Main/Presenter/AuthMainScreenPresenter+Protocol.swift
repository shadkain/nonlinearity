//
//  AuthMainScreenPresenter+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol AuthMainScreenPresenterProtocol {
    func didTapLoginButton()
    func didTapRegisterButton()
}

extension AuthMainScreenPresenter: AuthMainScreenPresenterProtocol {
    func didTapLoginButton() {
        router?.route(to: .login)
    }
    
    func didTapRegisterButton() {
        router?.route(to: .register)
    }
}