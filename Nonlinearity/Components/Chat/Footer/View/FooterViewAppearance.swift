//
//  BottomViewAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatBottomViewAppearance {
    var nextButtonImageName: String { get }
}

struct DarkChatBottomViewAppearance: ChatBottomViewAppearance {
    var nextButtonImageName: String {
        "next-arrow-dark"
    }
}
