//
//  Router+AuthMainRoutes.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum AuthMainRoutes {
    case login, register
}

protocol AuthMainRouter {
    func route(to: AuthMainRoutes)
}
