//
//  MessageCellProtocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageCellProtocol: class {
    var presenter: ChatMessageCellPresenterProtocol! { get set }
    
    func setLocation(_ location: ChatMessageCellLocation)
}

extension ChatBaseMessageCell: ChatMessageCellProtocol {
    func setLocation(_ location: ChatMessageCellLocation) {
        if let (top, bottom) = Self.marginPatterns[location] {
            marginTop = top
            marginBottom = bottom
        }
    }
}
