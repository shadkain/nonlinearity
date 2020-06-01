//
//  BaseMessageCell+MarginConstraints.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension ChatBaseMessageCell {
    struct MarginConstraints {
        var top: NSLayoutConstraint!
        var bottom: NSLayoutConstraint!
        
        func setToZero() {
            top?.constant = 0
            bottom?.constant = 0
        }
    }
    
    var marginTop: CGFloat {
        get { margins.top.constant }
        set { margins.top.constant = newValue }
    }
    var marginBottom: CGFloat {
        get { -margins.bottom.constant }
        set { margins.bottom.constant = -newValue }
    }
    
    static var marginPatterns: [ChatMessageCellLocation:(top: CGFloat, bottom: CGFloat)] = [:]
}
