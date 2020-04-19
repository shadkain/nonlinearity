//
//  MessageCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 15.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class RightMessageCell: UITableViewCellComponent {
    let messageView: MessageView = Message.UnnamedView()
    
    var maxWidth: CGFloat {
        get { messageView.maxWidth }
        set { messageView.maxWidth = newValue }
    }
    
    func configure(with message: Message) {
        messageView.configure(with: message, location: .right)
    }
    
    override func setup() {
        backgroundColor = .none
        selectionStyle = .none
        
        messageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageView)
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            messageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            messageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            messageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

//final class LeftMessageCell: UITableViewCellComponent {
//    let messageView: MessageView = Message.UnnamedView()
//}
