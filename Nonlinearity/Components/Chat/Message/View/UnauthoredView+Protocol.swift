//
//  UnauthoredView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageUnauthoredViewProtocol: ChatMessageViewProtocol {
    func setMessage(_ message: String)
    func setTime(_ time: String)
    func setAppearance(_ appearance: ChatMessageAppearance)
    
    func rebuild()
}

extension ChatMessageUnauthoredView: ChatMessageUnauthoredViewProtocol {
    func setMessage(_ message: String) {
        messageLabel.text = message
    }
    
    func setTime(_ time: String) {
        timeLabel.text = time
    }
    
    func setAppearance(_ appearance: ChatMessageAppearance) {
        messageLabel.textColor = .hex(rgb: appearance.messageTextColor)
        timeLabel.textColor = .hex(rgb: appearance.timeTextColor)
    }
    
    func setBackgroundColor(_ color: Int) {
        backgroundColor = .hex(rgb: color)
    }
    
    func clearBackgroundColor() {
        backgroundColor = .clear
    }
    
    func rebuild() {
        layoutDelegate.rebuildIfNeeded(messageLabel: messageLabel, timeLabel: timeLabel)
    }
}

