//
//  StoryImageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class StoryImageView: UIViewComponent {
    var image: UIImage? {
        set {
            imageView.image = newValue
        }
        get {
            imageView.image
        }
    }
    
    private let imageView = UIImageView()
    
    private let starMainView = UIImageView()
    private let starLeftView = UIImageView()
    private let starRightView = UIImageView()
    
    private var isRated: Bool = false
    private var isFirstRated: Bool = false
    
    override func setup() {
        
        imageView.layer.cornerRadius = 17
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
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
    
    override func constraint() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension StoryImageView {
    
    func setRate() {
        isRated = true
        configureRates()
    }
    
    func setFirstRate() {
        isFirstRated = true
        configureRates()
    }
    
    private func configureRates() {
        
        starMainView.isHidden = false
        
        NSLayoutConstraint.activate([
            starMainView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            starMainView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            starMainView.widthAnchor.constraint(equalToConstant: 60.135),
            starMainView.heightAnchor.constraint(equalToConstant: 57.27)
        ])
        
        if isFirstRated {
            starLeftView.isHidden = false
            starRightView.isHidden = false

            NSLayoutConstraint.activate([
                starLeftView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                starLeftView.trailingAnchor.constraint(equalTo: starMainView.leadingAnchor, constant: 13),
                starLeftView.widthAnchor.constraint(equalToConstant: 28.635),
                starLeftView.heightAnchor.constraint(equalToConstant: 28.2),
                
                starRightView.bottomAnchor.constraint(equalTo: starMainView.topAnchor, constant: 18),
                starRightView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
                starRightView.widthAnchor.constraint(equalToConstant: 40.215),
                starRightView.heightAnchor.constraint(equalToConstant: 38.295),
            ])
        }
    }
}
