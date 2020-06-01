//
//  ChatAuthorJSON.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct ChatAuthorJSON: Codable {
    var id: String
    var name: String
    var surname: String?
    var colors: Colors
    
    enum CodingKeys: String, CodingKey {
        case id = "author-id"
        case name, surname, colors
    }
}

extension ChatAuthorJSON {
    struct Colors: Codable {
        var first: String
        var second: String
    }
}
