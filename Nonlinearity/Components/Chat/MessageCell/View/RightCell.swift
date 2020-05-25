//
//  RightCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatRightMessageCell: ChatBaseMessageCell {
    let unauthoredMessageView = ChatMessageUnauthoredView()
    
    override var messageView: ChatMessageView {
        unauthoredMessageView
    }
    
    override func constraint() {
        super.constraint()
        
        NSLayoutConstraint.activate([
            messageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -spacing.commonH),
        ])
    }
}
