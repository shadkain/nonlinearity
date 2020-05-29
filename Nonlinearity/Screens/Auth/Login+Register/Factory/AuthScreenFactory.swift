//
//  AuthScreenPresenterFactory.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum AuthScreenFactory {
    enum Kind {
        case login, register
    }
    
    static func make(view: AuthScreenView) -> AuthLoginScreenPresenter {
        let presenter = AuthLoginScreenPresenter(view: view)
        
        presenter.formPresenter = DoubleFormFactory.make(view: view.authFormView, kind: .auth)
        presenter.formPresenter.onSubmit = { [unowned presenter] in presenter.submit() }
        
        view.presenter = presenter
        
        return presenter
    }
    
    static func buildUp(view: AuthScreenView) {
        _ = make(view: view)
    }
}
