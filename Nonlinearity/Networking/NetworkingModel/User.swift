//
//  User.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int64?
    var username: String
    var password: String?
    var avatar: String?
    
    var FavCategories: FavouritesCategories?
}

struct FavouritesCategories: Codable {

    var drama: Int64
    var romance: Int64
    var comedy: Int64
    var horror: Int64
    var detective: Int64
    var fantasy: Int64
    var action: Int64
    var realism: Int64
}
