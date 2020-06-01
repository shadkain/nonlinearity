//
//  BaseLeftCell+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatLeftMessageCellProtocol: ChatMessageCellProtocol {
    var showAvatar: Bool { get set }
    
    func setAvatarText(_ avatarText: String)
    func setAvatarColors(first: Int, second: Int)
}

extension ChatBaseLeftMessageCell: ChatLeftMessageCellProtocol {
    func setAvatarText(_ avatarText: String) {
        avatarView.lettersLabel.text = avatarText
    }
    
    func setAvatarColors(first: Int, second: Int) {
        avatarView.setGradientColors([.hex(rgb: first), .hex(rgb: second)])
    }
}
