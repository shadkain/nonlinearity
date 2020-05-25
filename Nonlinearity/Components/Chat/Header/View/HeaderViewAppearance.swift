//
//  HeaderViewAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatHeaderViewAppearance {
    var backgroundColor: UIColor { get }
    var backButtonImageName: String { get }
    var nameTextColor: UIColor { get }
    var nameFont: UIFont { get }
    var networkStatusTextColor: UIColor { get }
    var networkStatusFont: UIFont { get }
}

extension ChatHeaderViewAppearance {
    var nameFont: UIFont {
        .systemFont(ofSize: 16, weight: .semibold)
    }
    var networkStatusFont: UIFont {
        .systemFont(ofSize: 13, weight: .regular)
    }
}

struct DarkChatHeaderViewAppearance: ChatHeaderViewAppearance {
    var backgroundColor: UIColor {
        .hex(rgb: 0x252525)
    }
    var backButtonImageName: String {
        "back-arrow-dark"
    }
    var nameTextColor: UIColor {
        .hex(rgb: 0xE1E3E6)
    }
    var networkStatusTextColor: UIColor {
        .hex(rgb: 0xAEAEAE)
    }
}
