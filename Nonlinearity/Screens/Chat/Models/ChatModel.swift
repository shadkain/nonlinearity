//
//  ChatModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

enum ChatError: Error {
    case indexOutOfRange
}

enum ChatMessageRole {
    case firstPerson, secondPerson
}

final class ChatModel {
    let title: String
    private let firstPerson: ChatAuthor
    private let companions: [ChatAuthor]
    private let flow: [ChatMessage]
    private(set) var cursor: Int
    
    init(title: String, firstPerson: ChatAuthor, companions: [ChatAuthor], flow: [ChatMessage], cursor: Int = 0) {
        self.title = title
        self.firstPerson = firstPerson
        self.companions = companions
        self.flow = flow
        self.cursor = cursor
    }
    
    func step(by offset: Int) {
        cursor += offset
        
        if cursor < 0 {
            cursor = 0
        } else if cursor > flow.count - 1 {
            cursor = flow.count - 1
        }
    }
    
    var percentage: Int {
        return 100 * (cursor+1) / flow.count
    }
    
    func stepForward() -> Bool {
        guard cursor+1 < flow.count else {
            return false
        }
        
        cursor += 1
        return true
    }
    
    func message(at index: Int) throws -> ChatMessage {
        try validateIndex(index)
        return flow[index]
    }
    
    func messageRole(at index: Int) throws -> ChatMessageRole {
        try validateIndex(index)
        return flow[index].author === firstPerson ? .firstPerson : .secondPerson
    }
    
    func messageIsFirst(at index: Int) throws -> Bool {
        try validateIndex(index)
        return index == 0 || flow[index-1].author !== flow[index].author
    }
    
    func messageIsLast(at index: Int) throws -> Bool {
        try validateIndex(index)
        return index == flow.count-1 || flow[index].author !== flow[index+1].author
    }
    
    private func validateIndex(_ index: Int) throws {
        guard index >= 0 && index < flow.count else {
            throw ChatError.indexOutOfRange
        }
    }
}
