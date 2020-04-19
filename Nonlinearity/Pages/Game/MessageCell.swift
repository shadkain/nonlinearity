//
//  MessageCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 15.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol MessageCell {
    var maxWidth: CGFloat { get set }
    var topMargin: CGFloat { get set }
    var bottomMargin: CGFloat { get set }
    
    func configure(with message: Message)
}

class BaseMessageCell: UITableViewCellComponent {
    fileprivate var messageView: MessageView!
    private var topConstraint = NSLayoutConstraint()
    private var bottomConstraint = NSLayoutConstraint()
    
    var maxWidth: CGFloat {
        get { messageView.maxWidth }
        set { messageView.maxWidth = newValue }
    }
    var topMargin: CGFloat {
        get { topConstraint.constant }
        set { topConstraint.constant = newValue }
    }
    var bottomMargin: CGFloat {
        get { -bottomConstraint.constant }
        set { bottomConstraint.constant = -newValue }
    }
    
    override func setup() {
        backgroundColor = .none
        selectionStyle = .none
    }
    
    override func constraint() {
        topConstraint = messageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        bottomConstraint = messageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint])
    }
}

final class RightMessageCell: BaseMessageCell, MessageCell {
    func configure(with message: Message) {
        messageView.configure(with: message, location: .right)
    }
    
    override func setup() {
        super.setup()
        
        messageView = Message.UnnamedView()
        messageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageView)
    }
    
    override func constraint() {
        super.constraint()
        
        NSLayoutConstraint.activate([
            messageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}

final class LeftMessageCell: BaseMessageCell, MessageCell {
    private let avatarView = UIView()
    
    var showAvatar: Bool {
        get { avatarView.isHidden }
        set { avatarView.isHidden = newValue }
    }
    
    func configure(with message: Message) {
        messageView.configure(with: message, location: .left)
    }
    
    override func setup() {
        super.setup()
        
        messageView = Message.UnnamedView()
        messageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageView)
        
        avatarView.backgroundColor = .hex(rgb: 0x303030)
        avatarView.layer.cornerRadius = 17
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarView)
    }
    
    override func constraint() {
        super.constraint()
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarView.bottomAnchor.constraint(equalTo: messageView.bottomAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 34),
            avatarView.heightAnchor.constraint(equalToConstant: 34),
            messageView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8)
        ])
    }
}
