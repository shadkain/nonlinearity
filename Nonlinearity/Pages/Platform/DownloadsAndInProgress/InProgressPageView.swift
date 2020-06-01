//
//  InProgressPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class InProgressPageView: SimpleCollectionCardsViewController {
    
    var inProgressStoryCard = StoryCardCollection(type: .inProgress)

    override func setTitle() {
        labelView.text = "Продолжить"
    }
    
    override func addCollection() {
        cardsAdapter.storyCard = inProgressStoryCard
    }
    
}
