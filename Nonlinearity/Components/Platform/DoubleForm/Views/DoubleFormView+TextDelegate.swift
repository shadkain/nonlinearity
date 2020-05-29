//
//  AuthFormView+TextDelegate.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension DoubleFormView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.textFieldShouldReturn(textFieldType(textField))
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        presenter?.textFieldDidEndEditing(textFieldType(textField), withText: textField.text ?? "")
    }
}
