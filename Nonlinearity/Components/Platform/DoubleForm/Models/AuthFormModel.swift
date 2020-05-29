//
//  AuthFormModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct AuthFormModel: DoubleFormModelProtocol {
    var topField: String = ""
    var bottomField: String = ""
    
    func fieldIsSecure(_ field: DoubleFormField) -> Bool {
        switch field {
        case .top:
            return false
        case .bottom:
            return true
        }
    }
    
    func fieldPlaceholder(_ field: DoubleFormField) -> String {
        switch field {
        case .top:
            return "Логин"
        case .bottom:
            return "Пароль"
        }
    }
}
