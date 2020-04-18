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
    var maxWidth: CGFloat { get set }
    func configure(with message: Message, location: Message.Location)
}

extension Message {
    class UnnamedView: UIViewComponent, MessageView {
        fileprivate let messageLabel = UILabel()
        private let timeLabel = UILabel()
        private var widthConstraint: NSLayoutConstraint!
        private var changingConstraints: [NSLayoutConstraint] = []
        
        var maxWidth: CGFloat {
            get { widthConstraint.constant }
            set { widthConstraint.constant = newValue }
        }
        
        override func setup() {
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
            
            widthConstraint = widthAnchor.constraint(lessThanOrEqualToConstant: frame.width)
            [messageLabel, timeLabel].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                self.addSubview($0)
            }
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
            
            update()
        }
        
        override func constraint() {
            constraintMessageLabel()
            
            NSLayoutConstraint.activate([
                timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -const.space.commonH),
                timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -const.space.timeToBottom),
                widthConstraint,
            ])
        }
        
        fileprivate func constraintMessageLabel() {
            NSLayoutConstraint.activate([
                messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: const.space.commonH),
                messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: const.space.messageToVBounds),
            ])
        }
        
        func update() {
            deactivateChangingConstraints()
            
            let messageTextBreakpoint = maxWidth - (2*const.space.commonH + const.size.timeWidth)
            messageLabel.textWidth < messageTextBreakpoint ?
                constraintSingleLine() : constraintMultiLine()

            activateChangingConstraints()
        }
        
        private func constraintSingleLine() {
            changingConstraints.append(contentsOf: [
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -const.space.messageToVBounds),
                timeLabel.leadingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: const.space.commonH),
            ])
        }
        
        private func constraintMultiLine() {
            changingConstraints.append(contentsOf: [
                messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor)
            ])
            
            let lastLineWidth = messageLabel.lastLineWidth(withMaxWidth: maxWidth - 2*const.space.commonH)
            lastLineWidth < messageLabel.bounds.width - const.space.timeSameLineH ?
                constraintTimeSameLine() : constraintTimeSeparateLine()
        }
        
        private func constraintTimeSameLine() {
            changingConstraints.append(contentsOf: [
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -const.space.messageToVBounds),
            ])
        }
        
        private func constraintTimeSeparateLine() {
            changingConstraints.append(contentsOf: [
                timeLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: const.space.timeToMessageV)
            ])
        }
        
        private func activateChangingConstraints() {
            NSLayoutConstraint.activate(changingConstraints)
        }
        
        private func deactivateChangingConstraints() {
            NSLayoutConstraint.deactivate(changingConstraints)
            changingConstraints.removeAll()
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
                .marginBottom(const.space.nameToMessageV)
                .sizeToFit(.content)

            super.layout()
        }
    }
}
