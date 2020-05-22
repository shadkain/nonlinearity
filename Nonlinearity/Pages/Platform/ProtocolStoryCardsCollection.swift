//
//  ProtocolStoryCardsCollection.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol StoryCardCollection {
    
    var cards: [Card] {get}
    
    init() {
        setStoryCards()
    }
    
    func getItemsCount() -> Int {
        return cards.count
    }
    
    func getCardByIndex(index: Int) -> Card {
        return cards[index]
}
