//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

final class MessageView: UIViewComponent {
    private let messageLabel = UILabel()
    private let timeLabel = UILabel()
    var maxWidth: CGFloat {
        didSet { self.setNeedsLayout() }
    }
    
    var viewModel: MessageViewModel! {
        didSet {
            viewModel.senderDidChange = { [unowned self] viewModel in
                switch viewModel.sender {
                case .me:
                    self.layer.backgroundColor = const.color.meBg.cgColor
                case .companion:
                    self.layer.backgroundColor = const.color.companionBg.cgColor
                }
            }
            
            viewModel.messageDidChange = { [unowned self] viewModel in
                self.messageLabel.text = viewModel.message
                self.setNeedsLayout()
            }
            
            viewModel.timeDidChange = { [unowned self] viewModel in
                self.timeLabel.text = viewModel.time.toString()
                self.setNeedsLayout()
            }
            
            viewModel.forceUpdate()
        }
    }
    
    override init(frame: CGRect) {
        maxWidth = frame.width
        super.init(frame: frame)
    }
    
    convenience init(fromModel model: MessageModel, withMaxWidth maxWidth: CGFloat) {
        self.init(frame: .init(x: 0, y: 0, width: maxWidth, height: 0))
        defer {
            viewModel = .init(model: model)
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
        
        [messageLabel, timeLabel].forEach { addSubview($0) }
    }
    
    override func layoutSubviews() {
        let messageTextBreakpoint = maxWidth - (2*const.space.commonH + (timeLabel.text?.width(usingFont: timeLabel.font) ?? 0))
        if messageLabel.text?.width(usingFont: messageLabel.font) ?? 0 > messageTextBreakpoint {
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
            .maxWidth(frame.width - 2*const.space.commonH)
            .sizeToFit(.widthFlexible)
        
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
