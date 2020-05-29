//
//  AuthFormPresenterProtocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol DoubleFormPresenterProtocol {
    func textFieldShouldReturn(_ field: DoubleFormField)
    func textFieldDidEndEditing(_ field: DoubleFormField, withText text: String)
}

extension DoubleFormPresenter: DoubleFormPresenterProtocol {
    func textFieldShouldReturn(_ field: DoubleFormField) {
        switch field {
        case .top:
            view.setActiveField(.bottom)
        case .bottom:
            willSubmit = true
            view.dismissKeyboard()
        }
    }
    
    func textFieldDidEndEditing(_ field: DoubleFormField, withText text: String) {
        switch field {
        case .top:
            model.topField = text
        case .bottom:
            model.bottomField = text
        }
        
        if willSubmit {
            onSubmit?()
            willSubmit = false
        }
    }
}
