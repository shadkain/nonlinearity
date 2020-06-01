//
//  ChatMessageLoader.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct ChatMessageLoader {
    func load(from array: [ChatMessageJSON], authorDict: [String:ChatAuthor]) -> [ChatMessage]? {
        var flow = [ChatMessage]()
        
        for messageJson in array {
            guard let author = authorDict[messageJson.authorId] else {
                printError("Unknown author id: \"\(messageJson.authorId)\"")
                return nil
            }
            guard let time = createTime(from: messageJson.time) else {
                return nil
            }
            
            flow.append(.init(author: author, text: messageJson.text, time: time))
        }
        
        return flow
    }
    
    private func createTime(from string: String) -> ChatMessage.Time? {
        let timeArr = string.split(separator: ":")
        guard timeArr.count == 2,
            let hours = Int8(timeArr[0]),
            let minutes = Int8(timeArr[1]) else {
                printError("Invalid time format: \"\(string)\"")
                return nil
        }
        guard hours < 23,
            minutes < 60 else {
                printError("Invalid time values: \"\(string)\"")
                return nil
        }
        
        return .init(hours: hours, minutes: minutes)
    }
    
    private func printError(_ message: String) {
        print("*** ERROR (ChatMessageLoader): \(message)")
    }
}
