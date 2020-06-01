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
    struct Section {
        var title: String
        var cardsInSectionMain: [StoryModel]
        var cardsInSectionRead: [StoryModel]
        var cardsInSectionListen: [StoryModel]
        var cardsInSectionPlay: [StoryModel]
    }
}

class StoryCard {
    private var rubrics: [Rubric]?
    private var storyCards: [Section] = []
    private var sections: [String] = []
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    init() {
        networkManager.getRubrics() { (rubrics) in
            self.rubrics = rubrics
            return
        }
    }
    
    func getItemsInSectionCount(tab: TypeOfTab, section: Int) -> Int{
        return rubrics![section].stories.count
    }
    
    func getSectionsCount() -> Int {
        return rubrics!.count
    }
    
    func getCardBySectionAndIndex(tab: TypeOfTab, section: Int, index: Int)
        -> StoryModel {
            return rubrics![section].stories[index]
    }
    
    func getTitle(section: Int) -> String {
        return rubrics![section].title
    }
    
    func getID(section: Int, index: Int) -> Int {
        return rubrics![section].stories[index].id!
    }
    
    func getRandomID() -> Int {
        let max = rubrics![0].stories.count
        return Int.random(in: 1...max)
    }
}
