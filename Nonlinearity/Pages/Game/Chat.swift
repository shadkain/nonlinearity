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
                text: "Привет",
                time: .init(hours: 22, minutes: 18)),
            .init(author: she,
                text: "Можешь сегодня к 6 ко мне приехать? Остаться можешь у меня, а завтра с утра уедешь.. С братом я поговорю.. Ну или завтра утром приехать..",
                time: .init(hours: 15, minutes: 22)),
            .init(author: she,
                text: "Можешь?",
                time: .init(hours: 15, minutes: 22)),
            .init(author: me,
                text: "Это зачем?",
                time: .init(hours: 15, minutes: 23)),
            .init(author: she,
                text: "Просто",
                time: .init(hours: 15, minutes: 23)),
            .init(author: me,
                text: "Нет, ты мне объясни. Я то могу приехать",
                time: .init(hours: 15, minutes: 25)),
            .init(author: she,
                text: "Просто.. Погуляем.. Так будет проще понять, насколько мы нужны друг другу.. По крайней мере мне..",
                time: .init(hours: 15, minutes: 26)),
            .init(author: me,
                text: "Лан. Я еду. Ок",
                time: .init(hours: 15, minutes: 29)),
            .init(author: she,
                text: "Когда? К скольким?",
                time: .init(hours: 15, minutes: 29)),
            .init(author: me,
                text: "Только без Наташи",
                time: .init(hours: 15, minutes: 30)),
            .init(author: she,
                text: "Вдвоем",
                time: .init(hours: 15, minutes: 29)),
            .init(author: me,
                text: "К 18:00",
                time: .init(hours: 15, minutes: 31)),
            .init(author: she,
                text: "На ночь, да?",
                time: .init(hours: 15, minutes: 31)),
            .init(author: she,
                text: "Только утром родители приедут.. К 12 надо будет полюбому смотаться",
                time: .init(hours: 15, minutes: 32)),
            .init(author: she,
                text: "Ок?",
                time: .init(hours: 15, minutes: 33)),
            .init(author: me,
                text: "Так точно",
                time: .init(hours: 15, minutes: 33)),
        ])
    }
    
    enum MessageType {
        case left, right
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

