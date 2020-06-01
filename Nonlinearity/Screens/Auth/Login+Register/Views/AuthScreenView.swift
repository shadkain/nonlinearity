//
//  AuthScreenView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class AuthScreenView: UIScreenView {
    let colorRect = UIView()
    let loginErrorLabel = UILabel()
    let passwordErrorLabel = UILabel()
    let authFormView = DoubleFormView()
    let backButtonView = UIImageView()
    let submitButtonView = UILabel()
    
    var presenter: AuthScreenPresenterProtocol!
    
    override func setup() {
        self.backgroundColor = .init(hex: 0x191919)
        colorRect.backgroundColor = .init(hex: 0x252525)
        
        [loginErrorLabel, passwordErrorLabel].forEach {
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textAlignment = .left
            $0.textColor = .init(hex: 0xCE7272)
        }
        
        backButtonView.image = .init(imageLiteralResourceName: "back-arrow-dark")
        
        submitButtonView.font = .systemFont(ofSize: 18, weight: .black)
        submitButtonView.textAlignment = .center
        submitButtonView.textColor = .init(hex: 0xF1F1F1)
        submitButtonView.text = "Войти"
        submitButtonView.layer.backgroundColor = UIColor(hex: 0x575757).cgColor
        submitButtonView.layer.cornerRadius = 17
        submitButtonView.isUserInteractionEnabled = true
        
        
        [colorRect, authFormView, loginErrorLabel, passwordErrorLabel, backButtonView, submitButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            colorRect.leftAnchor.constraint(equalTo: leftAnchor),
            colorRect.topAnchor.constraint(equalTo: topAnchor),
            colorRect.rightAnchor.constraint(equalTo: rightAnchor),
            colorRect.heightAnchor.constraint(equalToConstant: 412),
            
            // AuthForm
            authFormView.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            authFormView.heightAnchor.constraint(equalToConstant: 102),
            authFormView.centerXAnchor.constraint(equalTo: centerXAnchor),
            authFormView.widthAnchor.constraint(equalToConstant: 328),
            
            loginErrorLabel.leftAnchor.constraint(equalTo: authFormView.topTextField.leftAnchor),
            loginErrorLabel.rightAnchor.constraint(equalTo: authFormView.topTextField.rightAnchor),
            loginErrorLabel.bottomAnchor.constraint(equalTo: authFormView.topAnchor, constant: -11),
            
            passwordErrorLabel.leftAnchor.constraint(equalTo: authFormView.bottomTextField.leftAnchor),
            passwordErrorLabel.rightAnchor.constraint(equalTo: authFormView.bottomTextField.rightAnchor),
            passwordErrorLabel.topAnchor.constraint(equalTo: authFormView.bottomAnchor, constant: 11),
            
            backButtonView.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            backButtonView.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            
            submitButtonView.leftAnchor.constraint(equalTo: colorRect.leftAnchor, constant: 24),
            submitButtonView.rightAnchor.constraint(equalTo: colorRect.rightAnchor, constant: -24),
            submitButtonView.centerYAnchor.constraint(equalTo: colorRect.bottomAnchor),
            submitButtonView.heightAnchor.constraint(equalToConstant: 51),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
}
