//
//  BottomView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class BottomView: UIViewComponent {
    private let nextButtonView = UIImageView()
    
    override func setup() {
        nextButtonView.image = .init(imageLiteralResourceName: "next-arrow")
        
        [nextButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            nextButtonView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
