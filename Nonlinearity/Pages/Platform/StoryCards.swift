//
//  StoryCards.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

enum TypeOfTab: Int {
    case main = 0, read, listen, play
}

extension StoryCard {
    struct Card {
        var title: String
        var imageName: String
        
        var isRated: Bool
        var isFirstRated: Bool
        
        var isListenable: Bool
        var isPlayable: Bool
    }

    struct Section {
        var title: String
        var cardsInSectionMain: [Card]
        var cardsInSectionRead: [Card]
        var cardsInSectionListen: [Card]
        var cardsInSectionPlay: [Card]
    }
}

class StoryCard {
    private var storyCards: [Section] = []
    private var sections: [String] = []
    
    init() {
        setStoryCards()
    }
    
    func getItemsInSectionCount(tab: TypeOfTab, section: Int) -> Int{
        switch tab {
        case .main:
            return storyCards[section].cardsInSectionMain.count
        case .read:
            return storyCards[section].cardsInSectionRead.count
        case .listen:
            return storyCards[section].cardsInSectionListen.count
        case .play:
            return storyCards[section].cardsInSectionPlay.count
        }
    }
    
    func getSectionsCount() -> Int {
        return storyCards.count
    }
    
    func getCardBySectionAndIndex(tab: TypeOfTab, section: Int, index: Int)
        -> Card {
            switch tab {
            case .main:
                return storyCards[section].cardsInSectionMain[index]
            case .read:
                return storyCards[section].cardsInSectionRead[index]
            case .listen:
                return storyCards[section].cardsInSectionListen[index]
            case .play:
                return storyCards[section].cardsInSectionPlay[index]
            }
    }
    
    func getTitle(section: Int) -> String {
        return storyCards[section].title
    }
}


extension StoryCard {
    private func setStoryCards() {
        
        let cards: [Card] = genCards()
        initArraySections()
        appendCards(data: cards)
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
    
    private func initArraySections() {
        
        sections.append(contentsOf: [
            "Сейчас популярно",
            "Короткие истории",
            "Новинки",
            "Еще одна секция"
        ])
    }
    
    private func appendCards(data: [Card]) {
        for section in sections {
            var cardsMain: [Card] = []
            var cardsRead: [Card] = []
            var cardsListen: [Card] = []
            var cardsPlay: [Card] = []
            
            for item in data {
                cardsMain.append(item)
                if item.isListenable {
                    cardsListen.append(item)
                }
                if item.isPlayable {
                    cardsPlay.append(item)
                }
                if !item.isListenable && !item.isPlayable {
                    cardsRead.append(item)
                }
            }
            
            storyCards.append(.init(
                title: section,
                cardsInSectionMain: cardsMain,
                cardsInSectionRead: cardsRead,
                cardsInSectionListen: cardsListen,
                cardsInSectionPlay: cardsPlay))
        }
    }
}
