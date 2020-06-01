//
//  UIScreenView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 27.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UIScreenView: UIView {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup() {}
    func constraint() {}
}
