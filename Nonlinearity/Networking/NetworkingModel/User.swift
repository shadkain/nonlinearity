//
//  User.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int64
    let username: String
    let password: String
    let avatar: String
}

struct FavouritesCategories: Codable {

    let drama: Int64
    let romance: Int64
    let comedy: Int64
    let horror: Int64
    let detective: Int64
    let fantasy: Int64
    let action: Int64
    let realism: Int64
}
