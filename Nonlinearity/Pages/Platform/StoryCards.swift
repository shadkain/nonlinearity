//
//  StoryCards.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 19/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

struct Section {
    var title: String
    var cardsInSection: [StoryCardView]
}

class StoryCard {
    private var storyCards: [Section] = []
    
    init() {
        setStoryCards()
    }
    
    func GetItemsInSectionCount(section: Int) -> Int{
        return storyCards[section].cardsInSection.count
    }
    
    func GetSectionsCount() -> Int {
        return storyCards.count
    }
    
    func GetCardViewBySectionAndIndex(section: Int, index: Int) -> StoryCardView {
        return storyCards[section].cardsInSection[index]
    }
    
    func GetTitle(section: Int) -> String {
        return storyCards[section].title
    }
}

extension StoryCard {
    private func setStoryCards() {
        let sv = StoryCardView(frame: .zero)

        sv.image = UIImage(named: "book")
        sv.nameLable.text = "Захватывающий дух"
        
        let sv2 = StoryCardView(frame: .zero)

        sv2.image = UIImage(named: "book")
        sv2.nameLable.text = "Захватывающий дух"
        
        let sv3 = StoryCardView(frame: .zero)

        sv3.image = UIImage(named: "book")
        sv3.nameLable.text = "Захватывающий дух"
        
        let svRated = StoryCardView(frame: .zero)

        svRated.image = UIImage(named: "unicorn")
        svRated.nameLable.text = "Путь за рогом"
        svRated.SetRate()
        
        let svRated1 = StoryCardView(frame: .zero)

        svRated1.image = UIImage(named: "unicorn")
        svRated1.nameLable.text = "Путь за рогом"
        svRated1.SetRate()
        
        let svRated2 = StoryCardView(frame: .zero)

        svRated2.image = UIImage(named: "unicorn")
        svRated2.nameLable.text = "Путь за рогом"
        svRated2.SetRate()

        let svFirstRated = StoryCardView(frame: .zero)

        svFirstRated.image = UIImage(named: "wolf")
        svFirstRated.nameLable.text = "Сказки об оборотнях"
        svFirstRated.SetFirstRate()
        
        let svFirstRated2 = StoryCardView(frame: .zero)

        svFirstRated2.image = UIImage(named: "wolf")
        svFirstRated2.nameLable.text = "Сказки об оборотнях"
        svFirstRated2.SetFirstRate()

        storyCards.append(contentsOf: [
            .init(
                title: "Сейчас популярно",
                cardsInSection: [sv, svRated, sv3, svFirstRated2]
            ),
            .init(
                title: "Короткие истории",
                cardsInSection: [svFirstRated]
                ),
            .init(
                title: "Новинки",
                cardsInSection: [svRated1]
            ),
            .init(
                title: "Еще одна секция",
                cardsInSection: [sv2, svRated2]
            )
        ])
    }
}
