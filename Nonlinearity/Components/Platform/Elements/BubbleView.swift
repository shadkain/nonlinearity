//
//  BubbleView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 09/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

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
    private let imageViewContainer = UIView(frame: .zero)
    
    override func setup() {
        frame.size = CGSize(width: 85, height: 100)
        
        imageViewContainer.backgroundColor = .hex(rgb: 0x191919)
        imageViewContainer.layer.cornerRadius = 37
        imageViewContainer.layer.borderWidth = 2
        imageViewContainer.layer.borderColor = UIColor.hex(rgb: 0xC35EB9).cgColor
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        titleLable.font = .boldSystemFont(ofSize: 13)
        titleLable.textAlignment = .center
        titleLable.textColor = .hex(rgb: 0xAEAEAE)
        titleLable.numberOfLines = 1
        
        [imageViewContainer, titleLable].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            
        }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewContainer.addSubview(imageView)
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            imageViewContainer.topAnchor.constraint(equalTo: topAnchor),
            imageViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5.5),
            imageViewContainer.widthAnchor.constraint(equalToConstant: 74),
            imageViewContainer.heightAnchor.constraint(equalToConstant: 74),
            
            imageView.topAnchor.constraint(equalTo: imageViewContainer.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: imageViewContainer.leadingAnchor, constant: 10),
            imageView.widthAnchor.constraint(equalToConstant: 54),
            imageView.heightAnchor.constraint(equalToConstant: 54),

            titleLable.topAnchor.constraint(equalTo: imageViewContainer.bottomAnchor),
            titleLable.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor),
       ])
    }
}
