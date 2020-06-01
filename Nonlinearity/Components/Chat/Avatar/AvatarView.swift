//
//  AvatarView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class LetterAvatarView: UIGradientView {
    let lettersLabel = UILabel()
    
    override func setup() {
        super.setup()
        
        startPoint = .init(x: 1, y: 0)
        endPoint = .init(x: 0, y: 1)
        
        lettersLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        lettersLabel.textAlignment = .center
        lettersLabel.textColor = .hex(rgb: 0xFFFBFB)
        
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
