//
//  UnauthoredView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageUnauthoredViewProtocol: class {
    func set(message: String)
    func set(time: String)
    func set(role: Chat.Message.Role?)
    func set(appearance: ChatMessageAppearance)
    func rebuild()
}

final class ChatMessageUnauthoredView: UIViewComponent {
    let messageLabel = UILabel()
    let timeLabel = UILabel()
    private(set) var appearance: ChatMessageAppearance!
    private var layout = Layout()
   
    override func setup() {
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        
        timeLabel.textAlignment = .right
        timeLabel.numberOfLines = 1
        
        layout.set(block: { [unowned self] in self.constraintSingleLine() }, on: .singleLine)
        layout.set(block: { [unowned self] in self.constraintMultiLineSame() }, on: .multiLineSame)
        layout.set(block: { [unowned self] in self.constraintMultiLineSeparate() }, on: .multiLineSeparate)
        
        [messageLabel, timeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        layout.widthConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width)
        
        NSLayoutConstraint.activate([
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            layout.widthConstraint,
        ])
    }
    
    private func constraintSingleLine() {
        layout.changingConstraints.append(contentsOf: [
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -12),
        ])
    }
    
    private func constraintMultiLineSame() {
        let freeSpace = layout.size.width - layout.lastLineWidth
        let messageAndTimeConstraint = freeSpace < (timeLabel.textWidth + 12) ?
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: freeSpace - 12) :
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor)
        
        layout.changingConstraints.append(contentsOf: [
            messageAndTimeConstraint,
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
        ])
    }
    
    private func constraintMultiLineSeparate() {
        layout.changingConstraints.append(contentsOf: [
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 4),
        ])
    }
}


extension ChatMessageUnauthoredView: ChatMessageView, ChatMessageUnauthoredViewProtocol {
    var maxWidth: CGFloat {
        get { layout.widthConstraint.constant }
        set { layout.widthConstraint.constant = newValue }
    }
    
    func set(message: String) {
        messageLabel.text = message
    }
    
    func set(time: String) {
        timeLabel.text = time
    }
    
    func set(appearance: ChatMessageAppearance) {
        self.appearance = appearance
        
        layer.cornerRadius = appearance.viewCornerRadius
        
        messageLabel.font = appearance.messageFont
        messageLabel.textColor = appearance.messageTextColor
        timeLabel.font = appearance.timeFont
        timeLabel.textColor = appearance.timeTextColor
    }
    
    func rebuild() {
        layout.rebuildIfNeeded(messageLabel: messageLabel, timeLabel: timeLabel, maxWidth: maxWidth)
    }
}
