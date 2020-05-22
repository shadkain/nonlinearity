//
//  StoryCardCollection.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum TypeOfPage: Int {
    case downloads = 0, inProgress
}

class StoryCardCollection {
    
    private var cards: [Card] = []
    
    init(type: TypeOfPage) {
        switch type {
        case .downloads:
            setStoryCardsDownloads()
        case .inProgress:
            setStoryCardsInProgress()
        }
    }
    
    func getItemsCount() -> Int {
        return cards.count
    }
    
    func getCardByIndex(index: Int) -> Card {
        return cards[index]
    }
    
}

extension StoryCardCollection {
    private func setStoryCardsDownloads() {
        cards = genCardsDownloads()
    }
    
    private func genCardsDownloads() -> [Card] {
        var cards: [Card] = []

        for i in 1...10 {
            var newTitle: String = ""
            var newImageName: String = ""
            
            var newIsRated: Bool = false
            var newIsFirstRated: Bool = false
            
            var newIsListenable: Bool = false
            var newIsPlayable: Bool = false
            
            if (i % 3 == 2) {
                newImageName = "book"
                newTitle = "Захватывающий дух"
            } else if (i % 3 == 0) {
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
    
    private func setStoryCardsInProgress() {
        cards = genCardsInProgress()
    }
    
    private func genCardsInProgress() -> [Card] {
        var cards: [Card] = []

        for i in 1...5 {
            var newTitle: String = ""
            var newImageName: String = ""
            
            var newIsRated: Bool = false
            var newIsFirstRated: Bool = false
            
            var newIsListenable: Bool = false
            var newIsPlayable: Bool = false
            
            if (i % 3 == 1) {
                newImageName = "book"
                newTitle = "Захватывающий дух"
            } else if (i % 3 == 2) {
                newImageName = "unicorn"
                newTitle = "Путь за рогом"
                newIsListenable = true
            } else {
                newImageName = "wolf"
                newTitle = "Сказки об оборотнях"
                newIsPlayable = true
            }
            if (i % 4 == 1) {
                newIsRated = true
            } else if (i % 4 == 3) {
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
