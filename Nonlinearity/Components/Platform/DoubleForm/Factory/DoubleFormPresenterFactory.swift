//
//  DoubleFormPresenterFactory.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum DoubleFormFactory {
    enum Kind {
        case auth, changePassword
    }
    
    static func make(view: DoubleFormView, kind: Kind) -> DoubleFormPresenter {
        var model: DoubleFormModelProtocol
        
        switch kind {
        case .auth:
            model = AuthFormModel(topField: "", bottomField: "")
        case .changePassword:
            model = ChangePasswordFormModel(topField: "", bottomField: "")
        }
        
        let presenter = DoubleFormPresenter(model: model, view: view)
        view.presenter = presenter
        
        return presenter
    }
    
    static func buildUp(view: DoubleFormView, kind: Kind) {
        _ = make(view: view, kind: kind)
    }
}
