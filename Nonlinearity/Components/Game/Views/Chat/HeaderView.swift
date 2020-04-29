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
    var presenter: ChatHeaderPresenter!
    let backArrowView = UIImageView()
    let nameLabel = UILabel()
    let networkStatusLabel = UILabel()
    
    override func setup() {
        backArrowView.isUserInteractionEnabled = true
        backArrowView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backArrowDidTap)))
        
        nameLabel.textAlignment = .center
        networkStatusLabel.textAlignment = .center
        
        [backArrowView, nameLabel, networkStatusLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            backArrowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            backArrowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            networkStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            networkStatusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: networkStatusLabel.topAnchor, constant: -1),
        ])
    }
    
    @objc private func backArrowDidTap(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapBackArrow()
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
        
        backArrowView.image = .init(imageLiteralResourceName: appearance.backArrowImageName)
        
        nameLabel.font = appearance.nameFont
        nameLabel.textColor = appearance.nameTextColor
        
        networkStatusLabel.font = appearance.networkStatusFont
        networkStatusLabel.textColor = appearance.networkStatusTextColor
    }
}
