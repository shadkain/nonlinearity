//
//  HeaderView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatHeaderViewProtocol: class {
    var presenter: ChatHeaderPresenterProtocol! { get set }
    func setBigText(_ text: String)
    func setSmallText(_ text: String)
    func setAppearance(_ appearance: ChatHeaderViewAppearance)
}

extension ChatHeaderView: ChatHeaderViewProtocol {
    func setBigText(_ text: String) {
        bigLabel.text = text
    }
    
    func setSmallText(_ text: String) {
        smallLabel.text = text
    }
    
    func setAppearance(_ appearance: ChatHeaderViewAppearance) {
        backgroundColor = .hex(rgb: appearance.backgroundColor)
        
        backButtonView.image = .init(imageLiteralResourceName: appearance.backButtonImageName)
        bigLabel.textColor = .init(hex: appearance.bigTextColor)
        smallLabel.textColor = .init(hex: appearance.smallTextColor)
    }
}

