//
//  HeaderViewAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatHeaderViewAppearance {
    var backgroundColor: Int { get }
    var backButtonImageName: String { get }
    var bigTextColor: Int { get }
    var smallTextColor: Int { get }
}

struct DarkChatHeaderViewAppearance: ChatHeaderViewAppearance {
    var backgroundColor: Int { 0x252525 }
    var backButtonImageName: String { "back-arrow-dark" }
    var bigTextColor: Int { 0xE1E3E6 }
    var smallTextColor: Int { 0xAEAEAE }
}
