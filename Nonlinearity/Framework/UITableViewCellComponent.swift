//
//  UITableViewComponent.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 14.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UITableViewCellComponent: UITableViewCell {
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup() {}
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func layout() {}
}
