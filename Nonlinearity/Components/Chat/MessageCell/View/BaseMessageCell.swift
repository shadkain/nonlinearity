//
//  BaseCell.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 04.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ChatBaseMessageCell: UITableViewCellComponent {
    var margins = MarginConstraints()
    var presenter: ChatMessageCellPresenterProtocol!
    
    var maxMessageWidth: CGFloat {
        get { messageView.maxWidth }
        set { messageView.maxWidth = newValue }
    }
    
    var messageView: ChatMessageView {
        fatalError("messageView: ChatMessageView has not been implemented")
    }
    
    override func setup() {
        backgroundColor = .none
        selectionStyle = .none
        
        [messageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
    override func constraint() {
        margins.top = messageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        margins.bottom = messageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        NSLayoutConstraint.activate([margins.top, margins.bottom])
    }
}
