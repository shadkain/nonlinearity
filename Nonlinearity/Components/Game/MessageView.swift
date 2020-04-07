//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

class MessageView: UIView {
    let messageLabel = UILabel()
    let timeLabel = UILabel()
    
    convenience init(g: Int) {
        self.init(frame: .init(x: 50, y: 50, width: 200, height: 50))
        layer.cornerRadius = 17
        layer.backgroundColor = UIColor.hex(rgb: 0x454545).cgColor
        messageLabel.text = "Hello FUCKING WORLD!"
        messageLabel.font = .systemFont(ofSize: 17)
        messageLabel.textColor = .hex(rgb: 0x000000)
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 0
        
        addSubview(messageLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        messageLabel.pin.maxWidth(100).sizeToFit(.width)
        
        pin.wrapContent()
        
        messageLabel.pin
            .left(12)
            .top(7)
    }
}
