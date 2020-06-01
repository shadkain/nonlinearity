//
//  ChatAuthorColorLoader.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct ChatAuthorColorLoader {
    private static var colorDict: [String:ChatAuthor.Color] = [
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
    
    func load(from key: String) -> ChatAuthor.Color? {
        Self.colorDict[key]
    }
    
    func load(from colors: ChatAuthorJSON.Colors) -> ChatAuthor.Colors? {
        guard let first = load(from: colors.first) else {
            printError(for: colors.first)
            return nil
        }
        guard let second = load(from: colors.second) else {
            printError(for: colors.second)
            return nil
        }
        
        return .init(first: first, second: second)
    }
    
    private func printError(for color: String) {
        print("*** ERROR (ChatAuthorColorLoader): Invalid color: \"\(color)\"")
    }
}
