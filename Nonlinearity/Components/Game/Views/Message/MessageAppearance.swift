//
//  MessageAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol MessageAppearance {
    var firstPersonViewColor: UIColor { get }
    var secondPersonViewColor: UIColor { get }
    var viewCornerRadius: CGFloat { get }
    var authorTextColor: UIColor { get }
    var authorFont: UIFont { get }
    var messageTextColor: UIColor { get }
    var messageFont: UIFont { get }
    var timeTextColor: UIColor { get }
    var timeFont: UIFont { get }
}

extension MessageAppearance {
    var viewCornerRadius: CGFloat {
        17
    }
    var authorFont: UIFont {
        .systemFont(ofSize: 13, weight: .regular)
    }
    var messageFont: UIFont {
        .systemFont(ofSize: 17, weight: .regular)
    }
    var timeFont: UIFont {
        .systemFont(ofSize: 11, weight: .regular)
    }
}

struct DarkMessageAppearance: MessageAppearance {
    var firstPersonViewColor: UIColor {
        .hex(rgb: 0x454647)
    }
    var secondPersonViewColor: UIColor {
        .hex(rgb: 0x2C2D2E)
    }
    var authorTextColor: UIColor {
        .hex(rgb: 0xCE7272)
    }
    var messageTextColor: UIColor {
        .hex(rgb: 0xE1E3E6)
    }
    var timeTextColor: UIColor {
        .hex(rgb: 0xABAEB2)
    }
}
