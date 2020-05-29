//
//  AuthFormLoginPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class DoubleFormPresenter {
    unowned let view: DoubleFormViewProtocol
    var model: DoubleFormModelProtocol
    
    var onSubmit: (() -> Void)?
    var willSubmit: Bool = false
    
    init(model: DoubleFormModelProtocol, view: DoubleFormViewProtocol) {
        self.model = model
        self.view = view
    }
    
    func setupView() {
        view.setPlaceholder(text: model.fieldPlaceholder(.top), field: .top)
        view.setSecure(model.fieldIsSecure(.top), field: .top)
        
        view.setPlaceholder(text: model.fieldPlaceholder(.bottom), field: .bottom)
        view.setSecure(model.fieldIsSecure(.bottom), field: .bottom)
    }
}
