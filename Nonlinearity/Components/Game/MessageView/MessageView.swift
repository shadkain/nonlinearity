//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

protocol MessageView: UIView {
    func configure(with message: Message, location: Message.Location)
}

extension Message {
    class UnnamedView: UIViewComponent, MessageView {
        fileprivate let messageLabel = UILabel()
        private let timeLabel = UILabel()
        var maxWidth: CGFloat!
        
        override func setup() {
            maxWidth = frame.width
            layer.cornerRadius = 17
            
            messageLabel.font = const.font.message
            messageLabel.textAlignment = .left
            messageLabel.textColor = const.color.messageText
            messageLabel.lineBreakMode = .byWordWrapping
            messageLabel.numberOfLines = 0
            
            timeLabel.font = const.font.time
            timeLabel.textAlignment = .right
            timeLabel.textColor = const.color.timeText
            timeLabel.numberOfLines = 1
            
            [messageLabel, timeLabel].forEach { self.addSubview($0) }
        }
        
        func configure(with message: Message, location: Message.Location) {
            messageLabel.text = message.text
            timeLabel.text = message.time.toString()
            
            switch location {
            case .right:
                backgroundColor = const.color.bgRightLoc
            case .left:
                backgroundColor = const.color.bgLeftLoc
            }
        }
        
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            maxWidth = size.width
            
            layout()
            
            return bounds.size
        }
        
        override func layout() {
            let messageTextBreakpoint = maxWidth - (2*const.space.commonH + const.size.timeWidth)
            messageLabel.textWidth > messageTextBreakpoint ? multiLineLayout() : singleLineLayout()
        }
        
        private func singleLineLayout() {
            messageLabel.pin.sizeToFit(.content)
            
            self.pin.wrapContent(.vertically, padding: const.space.messageToVBounds)
            
            timeLabel.pin
                .after(of: messageLabel)
                .marginLeft(const.space.commonH)
                .bottom(const.space.timeToBottom)
                .sizeToFit(.content)
            
            self.pin.wrapContent(.horizontally, padding: const.space.commonH)
            
            timeLabel.pin.right(const.space.commonH)
        }
        
        private func multiLineLayout() {
            messageLabel.pin
                .maxWidth(maxWidth - 2*const.space.commonH)
                .sizeToFit(.widthFlexible)
            
            messageLabel.lastLineWidth < messageLabel.frame.width - const.space.timeSameLineH ?
                sameLineTimeLayout() : separateLineTimeLayout()
        }
        
        private func sameLineTimeLayout() {
            self.pin.wrapContent(.vertically, padding: const.space.messageToVBounds)
            
            timeLabel.pin
                .bottom(const.space.timeToBottom)
                .right(to: messageLabel.edge.right)
                .sizeToFit(.content)
            
            self.pin.wrapContent(.horizontally, padding: const.space.commonH)
        }
        
        private func separateLineTimeLayout() {
            timeLabel.pin
                .below(of: messageLabel, aligned: .right)
                .marginTop(const.space.timeToMessageV)
                .sizeToFit(.content)
            
            self.pin.wrapContent(padding: .init(
                top: const.space.messageToVBounds,
                left: const.space.commonH,
                bottom: const.space.timeToBottom,
                right: const.space.commonH)
            )
        }
    }
    
    final class NamedView: UnnamedView {
        private let nameLabel = UILabel()
        
        override func setup() {
            super.setup()
            
            nameLabel.font = const.font.name
            nameLabel.textAlignment = .left
            nameLabel.textColor = .hex(rgb: 0xC35EB9)
            nameLabel.numberOfLines = 1
            
            addSubview(nameLabel)
        }
        
        override func configure(with message: Message, location: Message.Location) {
            nameLabel.text = message.author.nameString()
            
            super.configure(with: message, location: location)
        }
        
        override func layout() {
            nameLabel.pin
                .above(of: messageLabel, aligned: .left)
                .marginBottom(2)
                .sizeToFit(.content)

            super.layout()
        }
    }
}
