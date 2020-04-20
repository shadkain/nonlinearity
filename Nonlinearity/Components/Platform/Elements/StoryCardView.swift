//
//  StoryCardView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 03/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

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
    private var isRated: Bool = false
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
        nameLable.font = .systemFont(ofSize: 12)
        
        [imageView, nameLable].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0) }
        
        starMainView.image = UIImage(named: "star-main")
        starLeftView.image = UIImage(named: "star-left")
        starRightView.image = UIImage(named: "star-right")
        starRightView.clipsToBounds = false
        
        [starMainView, starLeftView, starRightView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            $0.isHidden = true
        }
    }
    
    func SetRate() {
        isRated = true
        configure()
    }
    
    func SetFirstRate() {
        isFirstRated = true
        configure()
    }
    
    private func configure() {
        
        starMainView.isHidden = false
        
        NSLayoutConstraint.activate([
            starMainView.bottomAnchor.constraint(equalTo: nameLable.topAnchor),
            starMainView.trailingAnchor.constraint(equalTo: nameLable.trailingAnchor),
            starMainView.widthAnchor.constraint(equalToConstant: 40.09),
            starMainView.heightAnchor.constraint(equalToConstant: 38.18)
        ])
        
        if isFirstRated {
            starLeftView.isHidden = false
            starRightView.isHidden = false

            NSLayoutConstraint.activate([
                starLeftView.bottomAnchor.constraint(equalTo: nameLable.topAnchor),
                starLeftView.trailingAnchor.constraint(equalTo: starMainView.leadingAnchor, constant: 10),
                starLeftView.widthAnchor.constraint(equalToConstant: 19.09),
                starLeftView.heightAnchor.constraint(equalToConstant: 18.18),
                
                starRightView.bottomAnchor.constraint(equalTo: starMainView.topAnchor, constant: 12),
                starRightView.trailingAnchor.constraint(equalTo: nameLable.trailingAnchor, constant: 10),
                starRightView.widthAnchor.constraint(equalToConstant: 26.81),
                starRightView.heightAnchor.constraint(equalToConstant: 25.53),
            ])
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 152),
            
            nameLable.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLable.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLable.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
}
