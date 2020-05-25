//
//  HeaderView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatHeaderViewProtocol: class {
    func setBigText(_ text: String)
    func setSmallText(_ text: String)
    func set(appearance: ChatHeaderViewAppearance)
}

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
            backButtonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            backButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            smallLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            smallLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            bigLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bigLabel.bottomAnchor.constraint(equalTo: smallLabel.topAnchor, constant: -1),
        ])
    }
    
    @objc private func didTapBackButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapBackButton()
    }
}

extension ChatHeaderView: ChatHeaderViewProtocol {
    func setBigText(_ text: String) {
        bigLabel.text = text
    }
    
    func setSmallText(_ text: String) {
        smallLabel.text = text
    }
    
    func set(appearance: ChatHeaderViewAppearance) {
        backgroundColor = appearance.backgroundColor
        
        backButtonView.image = .init(imageLiteralResourceName: appearance.backButtonImageName)
        
        bigLabel.font = appearance.nameFont
        bigLabel.textColor = appearance.nameTextColor
        
        smallLabel.font = appearance.networkStatusFont
        smallLabel.textColor = appearance.networkStatusTextColor
    }
}
