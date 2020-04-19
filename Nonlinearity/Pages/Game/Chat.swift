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
        let me: Author = .init(name: "Ясон", surname: "Великий")
        let she: Author = .init(name: "Ксения", surname: "Безбашенная")
        
        protagonist = me
        
        messages.append(contentsOf: [
            .init(author: she,
                text: "Да кто тебя знает",
                time: .init(hours: 9, minutes: 21)),
            .init(author: she,
                text: "Просто любишь издеваться",
                time: .init(hours: 9, minutes: 21)),
            .init(author: she,
                text: "Любишь мучить",
                time: .init(hours: 9, minutes: 21)),
            .init(author: me,
                text: "Ноу",
                time: .init(hours: 9, minutes: 24)),
            .init(author: she,
                text: "Да",
                time: .init(hours: 9, minutes: 24)),
            .init(author: she,
                text: "А что ты сейчас делаешь?!",
                time: .init(hours: 9, minutes: 24)),
            .init(author: me,
                text: "Пью чай",
                time: .init(hours: 9, minutes: 24)),
            .init(author: she,
                text: "По отношению ко мне, я имею в виду",
                time: .init(hours: 9, minutes: 25)),
            .init(author: she,
                text: "Издеваешься",
                time: .init(hours: 9, minutes: 25)),
            .init(author: me,
                text: "Найн",
                time: .init(hours: 9, minutes: 28)),
            .init(author: she,
                text: "Да, Ясон",
                time: .init(hours: 9, minutes: 28)),
            .init(author: she,
                text: "Пожалей меня. Скажи уже прямо все",
                time: .init(hours: 9, minutes: 28)),
            .init(author: she,
                text: "Я не могу больше, мне тяжело",
                time: .init(hours: 9, minutes: 28)),
            .init(author: me,
                text: "Я не умею о.о",
                time: .init(hours: 9, minutes: 29)),
            .init(author: she,
                text: "Ну Ясон",
                time: .init(hours: 9, minutes: 29)),
            .init(author: me,
                text: "Ну что?",
                time: .init(hours: 9, minutes: 34)),
            .init(author: she,
                text: "Я тогда расплакалась, обнимая тебя. Я держалась всю дорогу. Наташу просила говорить, что у меня живот болит, хотя на самом деле, болела душа. Я потому я уже не смогла сдержаться. И поцеловав тебя, знаешь, как горько мне было? Этот горький горький вкус перебивал твой. Хотя я все таки и твой распробовала",
                time: .init(hours: 9, minutes: 34)),
            .init(author: me,
                text: "И какой мой?",
                time: .init(hours: 9, minutes: 34)),
            .init(author: she,
                text: "Я не знаю, как описать. Но мне понравилось.",
                time: .init(hours: 9, minutes: 35)),
            .init(author: she,
                text: "Когда ты ушел, а мы остались, у меня еще долго долго жгли руки, пока помнили твои.",
                time: .init(hours: 9, minutes: 35)),
            .init(author: she,
                text: "Не мучай",
                time: .init(hours: 9, minutes: 35)),
            .init(author: she,
                text: "Скажи прямо",
                time: .init(hours: 9, minutes: 35)),
        ])
    }
    
    func messageLocation(forIndex index: Int) -> Message.Location {
        return messages[index].author === protagonist ? .right : .left
    }
    
    func authorWillChange(afterIndex index: Int) -> Bool {
        if index >= messages.count - 1 {
            return true
        }
        
        return messages[index].author !== messages[index+1].author
    }
}

