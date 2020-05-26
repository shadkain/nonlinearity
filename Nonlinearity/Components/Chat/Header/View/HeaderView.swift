//
//  HeaderView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatHeaderView: UIViewComponent {
    let backButtonView = UIImageView()
    let bigLabel = UILabel()
    let smallLabel = UILabel()
    
    var presenter: ChatHeaderPresenterProtocol!
    
    override func setup() {
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackButton)))
        
        bigLabel.textAlignment = .center
        bigLabel.font = fonts.bigLabel
        
        smallLabel.textAlignment = .center
        smallLabel.font = fonts.smallLabel
        
        [backButtonView, bigLabel, smallLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            backButtonView.leftAnchor.constraint(equalTo: leftAnchor, constant: spacing.backButtonHV),
            backButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing.backButtonHV),
            smallLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            smallLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing.smallToBottom),
            bigLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bigLabel.bottomAnchor.constraint(equalTo: smallLabel.topAnchor, constant: -spacing.bigToSmallV),
        ])
    }
    
    @objc private func didTapBackButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapBackButton()
    }
}

