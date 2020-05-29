//
//  DoubleFormModelProtocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum DoubleFormField {
    case top, bottom
}

protocol DoubleFormModelProtocol {
    var topField: String { get set }
    var bottomField: String { get set }
    
    func fieldIsSecure(_ field: DoubleFormField) -> Bool
    func fieldPlaceholder(_ field: DoubleFormField) -> String
}
