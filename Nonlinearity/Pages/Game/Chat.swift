//
//  ChatModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 15.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

class Author {
    var name: String
    var surname: String?
    
    init(name: String, surname: String?) {
        self.name = name
        self.surname = surname
    }
    
    func nameString() -> String {
        guard let surname = surname else {
            return name
        }
        
        return "\(name) \(surname)"
    }
}

struct Message {
    var author: Author
    var text: String
    var time: Time
}

extension Message {
    struct Time {
        var hours: Int8
        var minutes: Int8
        
        func toString() -> String {
            return (hours < 10 ? "0" : "") + "\(hours):" + (minutes < 10 ? "0" : "") + "\(minutes)"
        }
    }
    
    enum Location {
        case left, right
    }
}

class Chat {
    var protagonist: Author!
    var authors: [Author] = []
    var messages: [Message] = []
    
    init() {
        messages.append(contentsOf: [
            .init(
                author: .init(name: "Аня", surname: "Самсонова"),
                text: "Задолбал!",
                time: .init(hours: 22, minutes: 18)
            ),
            .init(
                author: .init(name: "Пума", surname: "Тимончик"),
                text: "Иди в попу, ты меня уже задолбал!!! Реально!",
                time: .init(hours: 22, minutes: 20)
            )
        ])
    }
    
    enum MessageType {
        case left, right
    }
    
    func messageLocation(forIndex index: Int) -> Message.Location {
        return messages[index].author === protagonist ? .right : .left
    }
}

