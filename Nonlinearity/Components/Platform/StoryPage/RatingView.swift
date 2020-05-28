//
//  RatingView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class RatingView: UIViewComponent {
    private let starView = UIImageView()
    
    var text: Float64 {
        set {
            textLabel.text = String(newValue)
        }
        get {
            Float64(textLabel.text!)!
        }
    }
        
    private let textLabel = UILabel()
        
    override func setup() {
        
        starView.image = UIImage(named: "star-main")
        
        textLabel.textAlignment = .left
        textLabel.textColor = .hex(rgb: 0xDFC054)
        textLabel.font = .systemFont(ofSize: 16)
        
        [starView, textLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(equalTo: topAnchor),
            starView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starView.widthAnchor.constraint(equalToConstant: 31.5),
            starView.heightAnchor.constraint(equalToConstant: 30),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: starView.trailingAnchor, constant: 5),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
