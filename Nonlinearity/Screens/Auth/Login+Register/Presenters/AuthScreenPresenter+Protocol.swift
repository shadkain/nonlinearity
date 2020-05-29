//
//  AuthScreenPresenter+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol AuthScreenPresenterProtocol {
    func submit()
}

extension AuthLoginScreenPresenter: AuthScreenPresenterProtocol {
    func submit() {
        print(formPresenter.model)
    }
}
