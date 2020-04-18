//
//  MessageCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 15.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class RightMessageCell: UITableViewCellComponent {
    let messageView: MessageView = Message.UnnamedView()
    
    override func setup() {
        backgroundColor = .none
        selectionStyle = .none
        
        contentView.addSubview(messageView)
    }
    
    override func layout() {
        contentView.pin
            .right(8)
            .wrapContent(.all)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return messageView.sizeThatFits(size)
    }
}
