//
//  DownloadsPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class DownloadsPageView: SimpleCollectionCardsViewController {
    
    var downloadsStoryCard = StoryCardCollection(type: .downloads)
    
    override func setTitle() {
        labelView.text = "Загрузки"
    }
    
    override func addCollection() {
        cardsAdapter.storyCard = downloadsStoryCard
    }
}
