//
//  ChatService.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

class ChatService {
    var authorColorDict: [String:ChatAuthor.Color] = [
        "red": .red,
        "orange": .orange,
        "yellow": .yellow,
        "yellow-green": .yellowGreen,
        "light-green": .lightGreen,
        "pink": .pink,
        "purple": .purple,
        "blue": .blue,
        "light-blue": .lightBlue,
        "cyan": .cyan,
        "dark-red": .darkRed,
        "dark-orange": .darkOrange,
        "dark-yellow": .darkYellow,
        "dark-yellow-green": .darkYellowGreen,
        "dark-light-green": .darkLightGreen,
        "dark-pink": .darkPink,
        "dark-purple": .darkPurple,
        "dark-blue": .darkBlue,
        "dark-light-blue": .darkLightBlue,
        "dark-cyan": .darkCyan,
    ]
    
    func transform(from json: ChatJSON) -> ChatModel {
        var firstPerson: ChatAuthor!
        var companions = [ChatAuthor]()
        var authorDict = [String:ChatAuthor]()
        json.authors.forEach {
            let firstColor = authorColorDict[$0.colors.first]!
            let secondColor = authorColorDict[$0.colors.second ?? ""]
            let author = ChatAuthor(name: $0.name, surname: $0.surname, colors: .init(first: firstColor, second: secondColor))
            authorDict[$0.id] = author
            
            if $0.id != json.firstPerson {
                companions.append(author)
            } else {
                firstPerson = author
            }
        }
        
        var flow = [ChatMessage]()
        json.flow.forEach {
            let author = authorDict[$0.authorId]!
            let timeArr = $0.time.split(separator: ":")
            let time = ChatMessage.Time(hours: Int8(timeArr[0])!, minutes: Int8(timeArr[1])!)
            
            flow.append(.init(author: author, text: $0.text, time: time))
        }
     
        return .init(flow: flow, cursor: flow.count-1, firstPerson: firstPerson, companions: companions)
    }
}
