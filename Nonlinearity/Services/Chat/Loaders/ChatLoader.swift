//
//  ChatLoader.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct ChatLoader {
    func load(from json: ChatJSON) -> ChatModel? {
        var authorLoader = ChatAuthorLoader()
        guard let authors = authorLoader.load(from: json.authors, firstPersonId: json.firstPerson),
            let flow = ChatMessageLoader().load(from: json.flow, authorDict: authorLoader.authorDict) else {
                print("*** ERROR (ChatLoader): Unable to load chat")
                return nil
        }
     
        return .init(title: "Сумеречная зона", firstPerson: authors.firstPerson, companions: authors.companions, flow: flow, cursor: -1)
    }
}
