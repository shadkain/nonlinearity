//
//  HeaderView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

enum NetworkStatus {
    case online, offline
}

final class PersonalHeaderView: UIViewComponent {
    private let backArrowView = UIImageView()
    private let nameLabel = UILabel()
    private let networkStatusLabel = UILabel()
    private var companion: Author!
    private var networkStatus: NetworkStatus!
    
    func set(companion: Author) {
        nameLabel.text = companion.nameString()
    }
    
    func set(networkStatus: NetworkStatus) {
        switch networkStatus {
        case .online:
            networkStatusLabel.text = "в сети"
        case .offline:
            networkStatusLabel.text = "не в сети"
        }
    }
    
    func configure(companion: Author, networkStatus: NetworkStatus) {
        set(companion: companion)
        set(networkStatus: networkStatus)
    }
    
    override func setup() {
        backgroundColor = .hex(rgb: 0x252525)
        
        backArrowView.image = .init(imageLiteralResourceName: "back-arrow")
        
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.textColor = .hex(rgb: 0xE1E3E6)
        
        networkStatusLabel.font = .systemFont(ofSize: 13, weight: .regular)
        networkStatusLabel.textAlignment = .center
        networkStatusLabel.textColor = .hex(rgb: 0xAEAEAE)
        
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
}
