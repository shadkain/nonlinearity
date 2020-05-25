//
//  MessageModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//


struct ChatMessage {
    var author: ChatAuthor
    var text: String
    var time: Time
}

extension ChatMessage {
    struct Time {
        var hours: Int8
        var minutes: Int8
        
        var time24: String {
            (hours < 10 ? "0" : "") + "\(hours):" + (minutes < 10 ? "0" : "") + "\(minutes)"
        }
    }
}
