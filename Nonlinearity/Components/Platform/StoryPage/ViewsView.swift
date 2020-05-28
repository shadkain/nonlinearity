//
//  ViewsView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ViewsView: UIViewComponent {
    private let eyeView = UIImageView()
    
    var text: Int {
        set {
            if newValue > 1000 {
                let doubleValue = Double(newValue)/1000
                let roundValue = round(doubleValue*10)/10
                textLabel.text = String(roundValue) + "k"
            } else {
                textLabel.text = String(newValue)
            }
        }
        get {
            Int(textLabel.text!)!
        }
    }
        
    private let textLabel = UILabel()
        
    override func setup() {
        
        eyeView.image = UIImage(named: "eye")
        
        textLabel.textAlignment = .left
        textLabel.textColor = .hex(rgb: 0x656565)
        textLabel.font = .systemFont(ofSize: 16)
        
        [eyeView, textLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            eyeView.topAnchor.constraint(equalTo: topAnchor, constant: 3.3),
            eyeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            eyeView.widthAnchor.constraint(equalToConstant: 32.5),
            eyeView.heightAnchor.constraint(equalToConstant: 23.4),
            
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: eyeView.trailingAnchor, constant: 5),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

