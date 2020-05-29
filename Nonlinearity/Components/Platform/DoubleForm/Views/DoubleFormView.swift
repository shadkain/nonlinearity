//
//  AuthFormView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class DoubleFormView: UIViewComponent {
    let topTextRect = UIView()
    let topTextField = UITextField()
    let bottomTextRect = UIView()
    let bottomTextField = UITextField()
    let separatorView = UIView()
    
    var presenter: DoubleFormPresenterProtocol!
    
    override func setup() {
        self.backgroundColor = .init(hex: 0x575757)
        layer.cornerRadius = 17
        
        separatorView.backgroundColor = .init(hex: 0x7F7F7F)
        
        [topTextField, bottomTextField].forEach {
            $0.font = .systemFont(ofSize: 18, weight: .black)
            $0.textAlignment = .left
            $0.textColor = .init(hex: 0xF1F1F1)
            $0.autocapitalizationType = .none
            $0.delegate = self
        }
        
        [topTextRect, topTextField, bottomTextRect, bottomTextField, separatorView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            separatorView.leftAnchor.constraint(equalTo: leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: rightAnchor),
            separatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
            
            topTextRect.leftAnchor.constraint(equalTo: leftAnchor),
            topTextRect.topAnchor.constraint(equalTo: topAnchor),
            topTextRect.rightAnchor.constraint(equalTo: rightAnchor),
            topTextRect.bottomAnchor.constraint(equalTo: separatorView.topAnchor),
            
            topTextField.leftAnchor.constraint(equalTo: topTextRect.leftAnchor, constant: 30),
            topTextField.rightAnchor.constraint(equalTo: topTextRect.rightAnchor, constant: -30),
            topTextField.centerYAnchor.constraint(equalTo: topTextRect.centerYAnchor, constant: 2),
            
            bottomTextRect.leftAnchor.constraint(equalTo: leftAnchor),
            bottomTextRect.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            bottomTextRect.rightAnchor.constraint(equalTo: rightAnchor),
            bottomTextRect.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            bottomTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            bottomTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            bottomTextField.centerYAnchor.constraint(equalTo: bottomTextRect.centerYAnchor, constant: 0),
        ])
    }
}
