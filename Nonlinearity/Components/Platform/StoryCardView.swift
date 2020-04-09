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
        
        imageView.layer.cornerRadius = 17
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        nameLable.textAlignment = .left
        nameLable.textColor = .hex(rgb: 0xE1E3E6)
        nameLable.numberOfLines = 2
        
        [imageView, nameLable].forEach { addSubview($0) }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.pin
            .left()
            .width(100%)
            .aspectRatio(3/4)
        
        nameLable.pin
            .below(of: imageView)
            .horizontally()
            .bottom()
        
        nameLable.font = .systemFont(ofSize: frame.width/9)
    }
}
