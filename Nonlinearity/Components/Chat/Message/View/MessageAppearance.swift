//
//  MessageAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageAppearance {
    var firstPersonBackgroundColor: Int { get }
    var secondPersonBackgroundColor: Int { get }
    var messageTextColor: Int { get }
    var timeTextColor: Int { get }
}

struct DarkChatMessageAppearance: ChatMessageAppearance {
    var firstPersonBackgroundColor: Int { 0x454647 }
    var secondPersonBackgroundColor: Int { 0x2C2D2E }
    var messageTextColor: Int { 0xE1E3E6 }
    var timeTextColor: Int { 0xABAEB2 }
}
