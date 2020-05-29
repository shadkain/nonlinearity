//
//  ChangePasswordFormModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct ChangePasswordFormModel: DoubleFormModelProtocol {
    var topField: String = ""
    var bottomField: String = ""
    
    func fieldIsSecure(_ field: DoubleFormField) -> Bool { true }
    func fieldPlaceholder(_ field: DoubleFormField) -> String {
        switch field {
        case .top:
            return "Старый пароль"
        case .bottom:
            return "Новый пароль"
        }
    }
}
