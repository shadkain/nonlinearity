//
//  Bubbles.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
import UIKit

struct Bubble {
    var title: String
    var imageName: String
}

class Bubbles {
    private var bubbles: [Bubble] = []
    private var bubbleViews: [BubbleView] = []
    
    init() {
        bubbles = setBubbles()
        setBubbleView()
    }
    
    func GetElementsCount() -> Int {
        return bubbleViews.count
    }
    
    func GetBubbleViewByIndex(index: Int) -> BubbleView {
        return bubbleViews[index]
    }
}

extension Bubbles {
    private func setBubbles() -> [Bubble] {
        var newBubbles: [Bubble] = []
        newBubbles.append(contentsOf: [
            .init(
                title: "Драма",
                imageName: "face-drama"
            ),
            .init(
                title: "Романтика",
                imageName: "face-romantic"
            ),
            .init(
                title: "Комедия",
                imageName: "face-comedy"
            ),
            .init(
                title: "Хоррор",
                imageName: "face-horror"
            ),
            .init(
                title: "Детектив",
                imageName: "face-horror"
            )
        ])
        
        return newBubbles
    }
    
    private func setBubbleView() {
        for bubble in bubbles {
            let bv = BubbleView(frame: .zero)
            
            bv.image = UIImage(named: bubble.imageName)
            bv.titleLable.text = bubble.title
            
            bubbleViews.append(bv)
        }
    }
}
