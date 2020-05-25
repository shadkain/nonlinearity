//
//  BaseLeftCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatBaseLeftMessageCellProtocol: ChatMessageCellProtocol {
    var showAvatar: Bool { get set }
    func set(avatarLetters: String)
    func setAvatarBgColor(first: Int, second: Int?)
}

class ChatBaseLeftMessageCell: ChatBaseMessageCell {
    let avatarView = LetterAvatarView()
    
    var showAvatar: Bool {
        get { !avatarView.isHidden }
        set { avatarView.isHidden = !newValue }
    }
    
    override func setup() {
        super.setup()
        
        avatarView.gradientCornerRadius = sizes.avatarSide / 2
        
        [avatarView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    override func constraint() {
        super.constraint()
        
        NSLayoutConstraint.activate([
            avatarView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: spacing.commonH),
            avatarView.bottomAnchor.constraint(equalTo: messageView.bottomAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: sizes.avatarSide),
            avatarView.heightAnchor.constraint(equalToConstant: sizes.avatarSide),
            messageView.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: spacing.commonH),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        showAvatar = true
    }
}

extension ChatBaseLeftMessageCell: ChatBaseLeftMessageCellProtocol {
    func set(avatarLetters: String) {
        avatarView.lettersLabel.text = avatarLetters
    }
    
    func setAvatarBgColor(first: Int, second: Int?) {
        avatarView.setGradientColors([.hex(rgb: first), .hex(rgb: second!)])
    }
}
