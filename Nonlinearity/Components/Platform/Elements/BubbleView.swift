//
//  BubbleView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 09/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

class BubbleView: UIViewComponent {
    var titleLable = UILabel()
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            imageView.image
        }
    }
    
    private let imageView = UIImageView()
    private let imageViewContainer =
        UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    
    override func setup() {
        frame.size = CGSize(width: 85, height: 100)
        
        imageViewContainer.backgroundColor = .hex(rgb: 0x191919)
        imageViewContainer.layer.cornerRadius = 32
        imageViewContainer.layer.borderWidth = 2
        imageViewContainer.layer.borderColor = UIColor.hex(rgb: 0xC35EB9).cgColor
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLable.font = .systemFont(ofSize: 12)
        titleLable.textAlignment = .center
        titleLable.textColor = .hex(rgb: 0xAEAEAE)
        titleLable.numberOfLines = 1
        
        [imageViewContainer, titleLable].forEach { addSubview($0) }
        
        imageViewContainer.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageViewContainer.pin
            .top(10)
            .hCenter()
        
        imageView.pin.all(8)
        
        titleLable.pin
            .below(of: imageView)
            .horizontally()
            .bottom()
        
    }
}
