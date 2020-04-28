//
//  MessageModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct Message {
    var author: Author
    var text: String
    var time: Time
}

extension Message {
    struct Time {
        var hours: Int8
        var minutes: Int8
        
        var time24: String {
            (hours < 10 ? "0" : "") + "\(hours):" + (minutes < 10 ? "0" : "") + "\(minutes)"
        }
    }
    
    enum Location {
        case left, right
    }
}
