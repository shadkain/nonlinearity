//
//  MessageView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageView: UIView {
    var maxWidth: CGFloat { get set }
}

protocol ChatMessageViewProtocol: class {
    func setBackgroundColor(_ color: Int)
    func clearBackgroundColor()
}
