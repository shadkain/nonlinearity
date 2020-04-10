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
    var isRated: Bool = false
    var isFirstRated: Bool = false
    
    private let imageView = UIImageView()
    
    private let starMainView = UIImageView()
    private let starLeftView = UIImageView()
    private let starRightView = UIImageView()
    
    override func setup() {
        
        imageView.layer.cornerRadius = 17
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        nameLable.textAlignment = .left
        nameLable.textColor = .hex(rgb: 0xE1E3E6)
        nameLable.numberOfLines = 2
        
        [imageView, nameLable].forEach { addSubview($0) }
        
        starMainView.bounds = CGRect(x: 0, y: 0, width: 40.09, height: 38.18)
        starLeftView.bounds = CGRect(x: 0, y: 0, width: 19.09, height: 18.18)
        starRightView.bounds = CGRect(x: 0, y: 0, width: 26.81, height: 25.53)
        
        starMainView.image = UIImage(named: "star-main")
        starLeftView.image = UIImage(named: "star-left")
        starRightView.image = UIImage(named: "star-right")
        starRightView.clipsToBounds = false
        
        [starMainView, starLeftView, starRightView].forEach {
            addSubview($0)
            $0.isHidden = true
        }
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
        
        if isRated || isFirstRated {
            starMainView.isHidden = false
            
            starMainView.pin
            .above(of: nameLable)
            .right()
            
            if isFirstRated {
                starLeftView.isHidden = false
                starLeftView.pin
                    .above(of: nameLable)
                    .before(of: starMainView)
                    .marginRight(-10)
                
                starRightView.isHidden = false
                starRightView.pin
                    .above(of: starMainView)
                    .marginBottom(-12)
                    .right()
                    .marginRight(-10)
            }
        }
    }
}
