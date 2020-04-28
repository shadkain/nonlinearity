//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol MessageView: UIView {
    var appearance: MessageAppearance { get }
    var maxWidth: CGFloat { get set }
    
    func set(role: MessageRole?)
}

extension MessageView {
    func set(role: MessageRole?) {
        backgroundColor = role?.color(for: appearance) ?? nil
    }
}

enum MessageRole {
    case firstPerson, secondPerson
    
    func color(for appearance: MessageAppearance) -> UIColor {
        switch self {
        case .firstPerson:
            return appearance.firstPersonViewColor
        case .secondPerson:
            return appearance.secondPersonViewColor
        }
    }
}
