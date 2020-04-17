//
//  Const.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 07.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension Message {
    struct const {
        static let cornerRadius: CGFloat = 17
        
        struct color {
            static let bgRightLoc: UIColor = .hex(rgb: 0x454647)
            static let bgLeftLoc: UIColor = .hex(rgb: 0x2C2D2E)
            static let messageText: UIColor = .hex(rgb: 0xE1E3E6)
            static let timeText: UIColor = .hex(rgb: 0xABAEB2)
        }
        
        struct font {
            static let name: UIFont = .systemFont(ofSize: 13, weight: .regular)
            static let message: UIFont = .systemFont(ofSize: 17, weight: .regular)
            static let time: UIFont = .systemFont(ofSize: 11, weight: .regular)
        }
        
        struct space {
            static let commonH: CGFloat = 12
            static let messageToVBounds: CGFloat = 7
            static let timeToMessageV: CGFloat = 4
            static let timeToBottom: CGFloat = 6
            static let timeSameLineH: CGFloat = size.timeWidth + space.commonH
        }
        
        struct size {
            static let timeWidth: CGFloat = "00:00".width(usingFont: font.time)
        }
    }
}
