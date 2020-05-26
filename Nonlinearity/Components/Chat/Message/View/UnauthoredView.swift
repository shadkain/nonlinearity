//
//  UnauthoredView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatMessageUnauthoredView: UIViewComponent, ChatMessageView {
    let messageLabel = UILabel()
    let timeLabel = UILabel()
    var appearance: ChatMessageAppearance!
    let layoutDelegate = LayoutDelegate()
    
    var maxWidth: CGFloat {
        get { layoutDelegate.widthConstraint.constant }
        set { layoutDelegate.widthConstraint.constant = newValue }
    }
   
    override func setup() {
        layer.cornerRadius = Self.cornerRadius
        
        messageLabel.font = fonts.message
        messageLabel.textAlignment = .left
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        
        timeLabel.font = fonts.time
        timeLabel.textAlignment = .right
        timeLabel.numberOfLines = 1
        
        layoutDelegate.set(block: { [unowned self] in self.constraintSingleLine() }, on: .singleLine)
        layoutDelegate.set(block: { [unowned self] in self.constraintMultiLineSame() }, on: .multiLineSame)
        layoutDelegate.set(block: { [unowned self] in self.constraintMultiLineSeparate() }, on: .multiLineSeparate)
        
        [messageLabel, timeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        layoutDelegate.widthConstraint = self.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width)
        
        NSLayoutConstraint.activate([
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: spacing.commonH),
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: spacing.msgToVBounds),
            timeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -spacing.commonH),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing.timeToBottom),
            layoutDelegate.widthConstraint,
        ])
    }
    
    private func constraintSingleLine() {
        layoutDelegate.changingConstraints.append(contentsOf: [
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing.msgToVBounds),
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -spacing.commonH),
        ])
    }
    
    private func constraintMultiLineSame() {
        let freeSpace = layoutDelegate.size.width - layoutDelegate.lastLineWidth
        let messageAndTimeConstraint = freeSpace < (timeLabel.textWidth + spacing.commonH) ?
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: freeSpace - spacing.commonH) :
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor)
        
        layoutDelegate.changingConstraints.append(contentsOf: [
            messageAndTimeConstraint,
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing.msgToVBounds),
        ])
    }
    
    private func constraintMultiLineSeparate() {
        layoutDelegate.changingConstraints.append(contentsOf: [
            messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: spacing.msgToTimeV),
        ])
    }
}
