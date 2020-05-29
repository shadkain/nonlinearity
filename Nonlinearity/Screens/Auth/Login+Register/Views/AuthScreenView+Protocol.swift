//
//  AuthScreenView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol AuthScreenViewProtocol: class {
    var authFormViewProtocol: DoubleFormViewProtocol { get }
}

extension AuthScreenView: AuthScreenViewProtocol {
    var authFormViewProtocol: DoubleFormViewProtocol { authFormView }
}
