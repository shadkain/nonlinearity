//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageView: UIView {
    var appearance: ChatMessageAppearance! { get }
    var maxWidth: CGFloat { get set }
    
    func set(role: Chat.Message.Role?)
}

extension ChatMessageView {
    func set(role: Chat.Message.Role?) {
        backgroundColor = role?.color(for: appearance) ?? nil
    }
}

extension Chat.Message {
    enum Role {
        case firstPerson, secondPerson
        
        func color(for appearance: ChatMessageAppearance) -> UIColor {
            switch self {
            case .firstPerson:
                return appearance.firstPersonViewColor
            case .secondPerson:
                return appearance.secondPersonViewColor
            }
        }
    }
}
