//
//  ChatAuthorLoader.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct ChatAuthorLoader {
    typealias Result = (firstPerson: ChatAuthor, companions: [ChatAuthor])
    
    private(set) var authorDict = [String:ChatAuthor]()
    
    private let colorLoader = ChatAuthorColorLoader()
    private var authorJsonArray = [ChatAuthorJSON]()
    private var firstPersonId: String!
    private var firstPerson: ChatAuthor!
    private var companions = [ChatAuthor]()
    
    mutating func load(from array: [ChatAuthorJSON], firstPersonId: String) -> Result? {
        authorJsonArray = array
        self.firstPersonId = firstPersonId
        
        for authorJson in array {
            guard let author = createAuthor(from: authorJson) else {
                return nil
            }
            
            distribute(author: author, id: authorJson.id)
        }
        guard firstPerson != nil else {
            printError("No author with firstPersonId: \"\(firstPersonId)\"")
            return nil
        }
        
        return (firstPerson, companions)
    }
    
    mutating func restore() {
        authorDict.removeAll()
        authorJsonArray.removeAll()
        firstPerson = nil
        companions.removeAll()
    }
    
    private mutating func createAuthor(from authorJson: ChatAuthorJSON) -> ChatAuthor? {
        guard authorDict[authorJson.id] == nil else {
            printError("Author id \"\(authorJson.id)\" is not unique")
            return nil
        }
        guard let colors = colorLoader.load(from: authorJson.colors) else {
            printError("Unable to obtain colors")
            return nil
        }
        
        let author = ChatAuthor(name: authorJson.name, surname: authorJson.surname, colors: colors)
        authorDict[authorJson.id] = author
        
        return author
    }
    
    private mutating func distribute(author: ChatAuthor, id: String) {
        if id != firstPersonId {
            companions.append(author)
        } else {
            firstPerson = author
        }
    }
    
    private func printError(_ message: String) {
        print("*** ERROR (ChatAuthorLoader): \(message)")
    }
}
