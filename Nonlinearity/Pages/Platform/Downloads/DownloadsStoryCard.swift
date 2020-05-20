//
//  DownloadsStoryCard.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct Card {
    var title: String
    var imageName: String
    
    var isRated: Bool
    var isFirstRated: Bool
    
    var isListenable: Bool
    var isPlayable: Bool
}

class DownloadsStoryCard {
    private var cards: [Card] = []
    
    init() {
        setStoryCards()
    }
    
    func getItemsCount() -> Int {
        return cards.count
    }
    
    func getCardByIndex(index: Int) -> Card {
        return cards[index]
    }
}

extension DownloadsStoryCard {
    private func setStoryCards() {
        
        cards = genCards()
    }
    
    private func genCards() -> [Card] {
        var cards: [Card] = []

        for i in 1...10 {
            var newTitle: String = ""
            var newImageName: String = ""
            
            var newIsRated: Bool = false
            var newIsFirstRated: Bool = false
            
            var newIsListenable: Bool = false
            var newIsPlayable: Bool = false
            
            if (i % 3 == 0) {
                newImageName = "book"
                newTitle = "Захватывающий дух"
            } else if (i % 3 == 1) {
                newImageName = "unicorn"
                newTitle = "Путь за рогом"
                newIsListenable = true
            } else {
                newImageName = "wolf"
                newTitle = "Сказки об оборотнях"
                newIsPlayable = true
            }
            if (i % 4 == 0) {
                newIsRated = true
            } else if (i % 4 == 2) {
                newIsFirstRated = true
            }
            
            cards.append(.init(
                title: newTitle,
                imageName: newImageName,
                isRated: newIsRated,
                isFirstRated: newIsFirstRated,
                isListenable: newIsListenable,
                isPlayable: newIsPlayable)
            )
            
        }

        return cards
    }
}
