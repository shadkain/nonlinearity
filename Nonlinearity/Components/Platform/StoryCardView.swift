//
//  StoryCardView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 03/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

struct StoryCardModel {
    var name: String?
    var image: UIImage?
}

class StoryCardViewModel {
    var model: StoryCardModel

    init(model: StoryCardModel) {
        self.model = model
    }
}

class StoryCardView: UIViewComponent {
    var nameLable = UILabel()
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            imageView.image
        }
    }
    
    private let imageView = UIImageView()
    
    
    override func setup() {
        
        imageView.layer.cornerRadius = 17.0
        //imageView.frame.size = CGSize(width: 100, height: imageView.frame.width * 4 / 3)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        nameLable.textAlignment = .left
        nameLable.font = .systemFont(ofSize: 17)
        nameLable.textColor = .red
        nameLable.numberOfLines = 2
        
        [imageView, nameLable].forEach { addSubview($0) }
       
        imageView.pin
            .top(5)
            .horizontally(5)
            .height(100)
        
        nameLable.pin
            .below(of: imageView)
            .margin(10)
            .horizontally(5)
            .bottom(5)
    }
}

