//
//  AvatarView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class LetterAvatarView: UIViewComponent {
    let lettersLabel = UILabel()
    
    override func setup() {
        lettersLabel.textAlignment = .center
        
        [lettersLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            lettersLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            lettersLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
