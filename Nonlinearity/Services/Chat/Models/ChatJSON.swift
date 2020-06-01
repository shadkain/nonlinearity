//
//  Story.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct ChatJSON: Codable {
    var authors: [ChatAuthorJSON]
    var firstPerson: String
    var flow: [ChatMessageJSON]
    
    enum CodingKeys: String, CodingKey {
        case firstPerson = "first-person"
        case authors, flow
    }
}

struct ChatMessageJSON: Codable {
    var authorId: String
    var text: String
    var time: String
    
    enum CodingKeys: String, CodingKey {
        case authorId = "author-id"
        case text, time
    }
}
