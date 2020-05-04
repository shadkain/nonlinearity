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

    var marginTop: CGFloat {
        get { margins.top.constant }
        set { margins.top.constant = newValue }
    }
    var marginBottom: CGFloat {
        get { -margins.bottom.constant }
        set { margins.bottom.constant = -newValue }
    }
    var maxMessageWidth: CGFloat {
        get { messageView.maxWidth }
        set { messageView.maxWidth = newValue }
    }
    
    var messageView: ChatMessageView {
        fatalError("readonly computed property baseMessageView not implemented")
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        margins.setToZero()
    }
}

extension ChatBaseMessageCell {
    struct MarginConstraints {
        var top: NSLayoutConstraint!
        var bottom: NSLayoutConstraint!
        
        func setToZero() {
            top?.constant = 0
            bottom?.constant = 0
        }
    }
}
