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
    
    func set(role: ChatMessageRole?)
}

extension ChatMessageView {
    func set(role: ChatMessageRole?) {
        backgroundColor = role?.color(for: appearance) ?? nil
    }
}
