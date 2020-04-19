//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

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
            
            updateChangingConstraints()
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
        
        private func updateChangingConstraints() {
            deactivateChangingConstraints()
            
            let messageTextBreakpoint = maxWidth - (2*const.space.commonH + timeLabel.textWidth)
            messageLabel.textWidth < messageTextBreakpoint ?
                constraintSingleLine() : constraintMultiLine()

            activateChangingConstraints()
        }
        
        private func constraintSingleLine() {
            changingConstraints.append(contentsOf: [
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -const.space.messageToVBounds),
                messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: -const.space.commonH),
            ])
        }
        
        private func constraintMultiLine() {
            let size = messageLabel.estimatedRect(withMaxWidth: maxWidth).size
            let lastLineWidth = messageLabel.lastLineWidth(withMaxWidth: maxWidth - 2*const.space.commonH)
            lastLineWidth < maxWidth - (timeLabel.textWidth + 3*const.space.commonH) ?
                constraintTimeSameLine(messageWidth: size.width, lastLineWidth: lastLineWidth) : constraintTimeSeparateLine()
        }
        
        private func constraintTimeSameLine(messageWidth: CGFloat, lastLineWidth: CGFloat) {
            let freeSpace = messageWidth - lastLineWidth
            let messageAndTimeConstraint = freeSpace < (timeLabel.textWidth + const.space.commonH) ?
                messageLabel.trailingAnchor.constraint(equalTo: timeLabel.leadingAnchor, constant: freeSpace - const.space.commonH) :
                messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor)
                
            changingConstraints.append(contentsOf: [
                messageAndTimeConstraint,
                messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -const.space.messageToVBounds),
            ])
        }
        
        private func constraintTimeSeparateLine() {
            changingConstraints.append(contentsOf: [
                messageLabel.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
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
            nameLabel.textColor = .hex(rgb: 0xCE7272)
            nameLabel.numberOfLines = 1
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(nameLabel)
        }
        
        override func constraintMessageLabel() {
            NSLayoutConstraint.activate([
                messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: const.space.commonH),
                messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: const.space.nameToMessageV),
                nameLabel.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor),
                nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: const.space.messageToVBounds),
            ])
        }
        
        override func configure(with message: Message, location: Message.Location) {
            nameLabel.text = message.author.nameString()
            
            super.configure(with: message, location: location)
        }
    }
}
