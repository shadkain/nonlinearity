//
//  MessageCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 15.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol MessageCell: UITableViewCell {
    var maxWidth: CGFloat { get set }
    var marginTop: CGFloat { get set }
    var marginBottom: CGFloat { get set }
    
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
    var marginTop: CGFloat {
        get { topConstraint.constant }
        set { topConstraint.constant = newValue }
    }
    var marginBottom: CGFloat {
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        marginTop = 0
        marginBottom = 0
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

class LeftMessageCell: BaseMessageCell, MessageCell {
    private let avatarView = UIView()
    private let avatarLetters = UILabel()
    
    var showAvatar: Bool {
        get { avatarView.isHidden }
        set { avatarView.isHidden = !newValue }
    }
    
    func configure(with message: Message) {
        messageView.configure(with: message, location: .left)
        avatarLetters.text = message.author.lettersString()
    }
    
    override func setup() {
        super.setup()
        
        createMessageView()
        messageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(messageView)
        
        avatarView.backgroundColor = .hex(rgb: 0xCE7272)
        avatarView.layer.cornerRadius = 17
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarView)
        
        avatarLetters.font = .systemFont(ofSize: 14, weight: .semibold)
        avatarLetters.textAlignment = .center
        avatarLetters.textColor = .hex(rgb: 0xFFFBFB)
        avatarLetters.translatesAutoresizingMaskIntoConstraints = false
        avatarView.addSubview(avatarLetters)
    }
    
    fileprivate func createMessageView() {
        messageView = Message.UnnamedView()
    }
    
    override func constraint() {
        super.constraint()
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            avatarView.bottomAnchor.constraint(equalTo: messageView.bottomAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 34),
            avatarView.heightAnchor.constraint(equalToConstant: 34),
            avatarLetters.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLetters.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            messageView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        showAvatar = true
    }
}

final class LeftGroupMessageCell: LeftMessageCell {
    override func createMessageView() {
        messageView = Message.NamedView()
    }
}
