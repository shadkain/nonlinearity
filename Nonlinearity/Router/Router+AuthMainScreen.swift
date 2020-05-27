//
//  Router+AuthMainScreen.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

extension Router: AuthMainRouter {
    func route(to route: AuthMainRoutes) {
        switch route {
        case .login:
            print("route to login")
        case .register:
            print("route to register")
        }
    }
}
