//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

struct Message {
    enum Sender {
        case me
        case companion
    }
    struct Time {
        var hours: Int8
        var minutes: Int8
        
        func toString() -> String {
            return (hours < 10 ? "0" : "") + "\(hours):" + (minutes < 10 ? "0" : "") + "\(minutes)"
        }
    }
    
    var sender: Sender
    var message: String
    var time: Time
}

extension Message {
    final class View: UIViewComponent {
        private let messageLabel = UILabel()
        private let timeLabel = UILabel()
        private var maxWidth: CGFloat!
        
        init(from model: Message) {
            super.init(frame: .zero)
            
            messageLabel.text = model.message
            timeLabel.text = model.time.toString()
            switch model.sender {
            case .me:
                backgroundColor = const.color.meBg
            case .companion:
                backgroundColor = const.color.companionBg
            }
        }
        
        override func setup() {
            layer.cornerRadius = 17
            
            messageLabel.font = const.font.message
            messageLabel.textAlignment = .left
            messageLabel.textColor = const.color.messageText
            messageLabel.numberOfLines = 0
            
            timeLabel.font = const.font.time
            timeLabel.textAlignment = .right
            timeLabel.textColor = const.color.timeText
            timeLabel.numberOfLines = 1
            
            [messageLabel, timeLabel].forEach { self.addSubview($0) }
        }
        
        func layout(withMaxWidth maxWidth: CGFloat) {
            self.maxWidth = maxWidth
            let messageTextBreakpoint = maxWidth - (2*const.space.commonH + const.size.timeWidth)
            if messageLabel.textWidth > messageTextBreakpoint {
                multiLineLayout()
            } else {
                singleLineLayout()
            }
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
        }
        
        private func multiLineLayout() {
            messageLabel.pin
                .maxWidth(maxWidth - 2*const.space.commonH)
                .sizeToFit(.widthFlexible)
            
            guard let lastLineWidth = messageLabel.breakLineUsingWordWrapping()?.last?.width(usingFont: messageLabel.font),
                lastLineWidth < messageLabel.frame.width - const.space.timeNoExtraH else {
                return timeExtraLineLayout()
            }
            
            timeNoExtraLineLayout()
        }
        
        private func timeNoExtraLineLayout() {
            self.pin.wrapContent(.vertically, padding: const.space.messageToVBounds)
            
            timeLabel.pin
                .bottom(const.space.timeToBottom)
                .right(to: messageLabel.edge.right)
                .sizeToFit(.content)
            
            self.pin.wrapContent(.horizontally, padding: const.space.commonH)
        }
        
        private func timeExtraLineLayout() {
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
}
