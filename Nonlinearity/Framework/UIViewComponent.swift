//
//  UIViewComponent.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 07.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UIViewComponent: UIView {    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        constraint()
    }
    
    func setup() {}
    func constraint() {}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func layout() {}
}
