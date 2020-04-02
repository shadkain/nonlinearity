//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class MessageView: UIView {
    var messageLabel = UILabel()
    var timeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        layer.backgroundColor = UIColor.hex(rgb: 454647).cgColor
        layer.cornerRadius = 17.0

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textAlignment = .left
        messageLabel.font = .systemFont(ofSize: 17)
        messageLabel.textColor = .hex(rgb: 0xE1E3E6)
        addSubview(messageLabel)

        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textAlignment = .right
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .hex(rgb: 0xABAEB2)
        addSubview(timeLabel)
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            timeLabel.leadingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 11),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
        ])
    }
}
