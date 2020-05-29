//
//  AuthFormView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol DoubleFormViewProtocol: class {
    var presenter: DoubleFormPresenterProtocol! { get set }
    
    func setSecure(_: Bool, field: DoubleFormField)
    func setPlaceholder(text: String, field: DoubleFormField)
    func setActiveField(_ field: DoubleFormField)
    func dismissKeyboard()
}

extension DoubleFormView: DoubleFormViewProtocol {
    func setSecure(_ secure: Bool, field: DoubleFormField) {
        let textField = self.textFieldOfType(field)
        textField.isSecureTextEntry = secure
    }

    func setPlaceholder(text: String, field: DoubleFormField) {
        let textField = self.textFieldOfType(field)
        textField.attributedPlaceholder = .init(string: text, attributes: [.foregroundColor: UIColor(hex: 0x807F7F)])
    }
    
    func setActiveField(_ field: DoubleFormField) {
        textFieldOfType(field).becomeFirstResponder()
    }
    
    func dismissKeyboard() {
        endEditing(true)
    }
    
    func textFieldOfType(_ field: DoubleFormField) -> UITextField {
        switch field {
        case .top:
            return topTextField
        case .bottom:
            return bottomTextField
        }
    }
    
    func textFieldType(_ field: UITextField) -> DoubleFormField {
        field === topTextField ? .top : .bottom
    }
}
