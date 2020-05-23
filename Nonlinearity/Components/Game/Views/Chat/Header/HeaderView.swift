//
//  HeaderView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatHeaderViewProtocol: class {
    func set(name: String)
    func set(networkStatus: String)
    func set(appearance: ChatHeaderViewAppearance)
}

final class ChatHeaderView: UIViewComponent {
    let backButtonView = UIImageView()
    let nameLabel = UILabel()
    let networkStatusLabel = UILabel()
    
    var presenter: ChatHeaderPresenterProtocol!
    
    override func setup() {
        backButtonView.isUserInteractionEnabled = true
        backButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackButton)))
        
        nameLabel.textAlignment = .center
        networkStatusLabel.textAlignment = .center
        
        [backButtonView, nameLabel, networkStatusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            backButtonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            backButtonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            networkStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            networkStatusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: networkStatusLabel.topAnchor, constant: -1),
        ])
    }
    
    @objc private func didTapBackButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapBackButton()
    }
}

extension ChatHeaderView: ChatHeaderViewProtocol {
    func set(name: String) {
        nameLabel.text = name
    }
    
    func set(networkStatus: String) {
        networkStatusLabel.text = networkStatus
    }
    
    func set(appearance: ChatHeaderViewAppearance) {
        backgroundColor = appearance.backgroundColor
        
        backButtonView.image = .init(imageLiteralResourceName: appearance.backButtonImageName)
        
        nameLabel.font = appearance.nameFont
        nameLabel.textColor = appearance.nameTextColor
        
        networkStatusLabel.font = appearance.networkStatusFont
        networkStatusLabel.textColor = appearance.networkStatusTextColor
    }
}
