//
//  BottomViewAppearance.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatFooterViewAppearance {
    var nextButtonImageName: String { get }
}

struct DarkChatFooterViewAppearance: ChatFooterViewAppearance {
    var nextButtonImageName: String {
        "next-arrow-dark"
    }
}
