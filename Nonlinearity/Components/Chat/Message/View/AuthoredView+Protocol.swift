//
//  AuthoredView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageAuthoredViewProtocol: ChatMessageViewProtocol {
    var unauthoredViewProtocol: ChatMessageUnauthoredViewProtocol { get }
    
    func setAuthor(_ author: String)
    func setTextColors(first: Int, second: Int)
    func setBackgroundColor(_ color: Int)
    func clearBackgroundColor()
}

extension ChatMessageAuthoredView: ChatMessageAuthoredViewProtocol {
    var unauthoredViewProtocol: ChatMessageUnauthoredViewProtocol { unauthoredView }
    
    func setAuthor(_ author: String) {
        authorLabel.text = author
    }
    
    func setTextColors(first: Int, second: Int) {
        authorLabel.gradientColors = [.hex(rgb: first), .hex(rgb: second)]
    }
    
    func setBackgroundColor(_ color: Int) {
        backgroundColor = .hex(rgb: color)
    }
    
    func clearBackgroundColor() {
        backgroundColor = .clear
    }
}
