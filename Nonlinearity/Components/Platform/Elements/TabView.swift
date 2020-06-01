//
//  TabView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 27/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TabView: UIViewComponent{
    private var titleLable = UILabel()
    
    override func setup() {
        
        backgroundColor = .hex(rgb: 0x252525)
        
        titleLable.font = .boldSystemFont(ofSize: 16)
        titleLable.textAlignment = .center
        titleLable.textColor = .hex(rgb: 0x656565)
        titleLable.numberOfLines = 1
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLable)
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor),
       ])
    }
}

extension TabView {
    func setTitle(title: String) {
        titleLable.text = title
    }
    
    func activate() {
        titleLable.textColor = .hex(rgb: 0x8D4086)
        backgroundColor = .hex(rgb: 0x191919)
    }
    
    func deactivate() {
        titleLable.textColor = .hex(rgb: 0x656565)
        backgroundColor = .hex(rgb: 0x252525)
    }
}
