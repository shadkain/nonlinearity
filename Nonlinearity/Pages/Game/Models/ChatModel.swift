//
//  ChatModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

enum ChatMessageRole {
    case firstPerson, secondPerson
    
    func color(for appearance: ChatMessageAppearance) -> UIColor {
        switch self {
        case .firstPerson:
            return appearance.firstPersonViewColor
        case .secondPerson:
            return appearance.secondPersonViewColor
        }
    }
}

class ChatModel {
    private(set) var cursor: Int
    private var flow: [ChatMessage]
    private var firstPerson: ChatAuthor
    private(set) var companions: [ChatAuthor]
    
    var isGroup: Bool {
        return companions.count > 1
    }
    
    init(flow: [ChatMessage], cursor: Int = 0, firstPerson: ChatAuthor, companions: [ChatAuthor]) {
        self.flow = flow
        self.cursor = cursor
        self.firstPerson = firstPerson
        self.companions = companions
    }
    
    func message(at index: Int) -> ChatMessage! {
        guard isValidIndex(index) else {
            return nil
        }
        
        return flow[index]
    }
    
    func step(by offset: Int) {
        cursor += offset
        
        if cursor < 0 {
            cursor = 0
        } else if cursor > flow.count - 1 {
            cursor = flow.count - 1
        }
    }
    
    func role(for index: Int) -> ChatMessageRole! {
        guard isValidIndex(index) else {
            return nil
        }
        
        return flow[index].author === firstPerson ? .firstPerson : .secondPerson
    }
    
    func lastInChain(by index: Int) -> Bool! {
        guard isValidIndex(index) else {
            return nil
        }
        
        return index == flow.count-1 || flow[index].author !== flow[index+1].author
    }
    
    private func isValidIndex(_ index: Int) -> Bool {
        index >= 0 && index < flow.count
    }
}
