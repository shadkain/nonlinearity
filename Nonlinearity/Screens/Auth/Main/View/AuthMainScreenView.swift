//
//  AuthMainScreen.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 27.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class AuthMainScreenView: UIScreenView {
    let colorRect = UIView()
    let logoView = UIImageView()
    let sublogoLabel = UILabel()
    let loginButton = UILabel()
    let registerButton = UILabel()
    
    var presenter: AuthMainScreenPresenterProtocol!
    
    override func setup() {
        self.backgroundColor = .init(hex: 0x191919)
        
        colorRect.backgroundColor = .init(hex: 0x252525)
        
        logoView.image = .init(imageLiteralResourceName: "auth-main-logo")
        logoView.contentMode = .scaleAspectFit
        
        sublogoLabel.font = .systemFont(ofSize: 15, weight: .medium)
        sublogoLabel.textAlignment = .center
        sublogoLabel.textColor = .init(hex: 0x949494)
        sublogoLabel.text = "линейные истории"
        
        loginButton.font = .systemFont(ofSize: 18, weight: .black)
        loginButton.textAlignment = .center
        loginButton.textColor = .init(hex: 0xF1F1F1)
        loginButton.text = "Войти"
        loginButton.layer.backgroundColor = UIColor(hex: 0x575757).cgColor
        loginButton.layer.cornerRadius = 17
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapLoginButton)))
        
        registerButton.font = .systemFont(ofSize: 18, weight: .black)
        registerButton.textAlignment = .center
        registerButton.textColor = .init(hex: 0xF1F1F1)
        registerButton.text = "Зарегистрироваться"
        registerButton.layer.backgroundColor = UIColor(hex: 0x8D4086).cgColor
        registerButton.layer.cornerRadius = 17
        registerButton.isUserInteractionEnabled = true
        registerButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapRegisterButton)))
        
        [colorRect, logoView, sublogoLabel, loginButton, registerButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            colorRect.leftAnchor.constraint(equalTo: leftAnchor),
            colorRect.topAnchor.constraint(equalTo: topAnchor),
            colorRect.rightAnchor.constraint(equalTo: rightAnchor),
            colorRect.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -192),
            
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: 185),
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sublogoLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 1),
            sublogoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginButton.centerYAnchor.constraint(equalTo: colorRect.bottomAnchor),
            loginButton.centerXAnchor.constraint(equalTo: colorRect.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 328),
            loginButton.heightAnchor.constraint(equalToConstant: 51),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12),
            registerButton.centerXAnchor.constraint(equalTo: colorRect.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 328),
            registerButton.heightAnchor.constraint(equalToConstant: 51),
        ])
    }
    
    @objc func didTapLoginButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapLoginButton()
    }
    
    @objc func didTapRegisterButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapRegisterButton()
    }
}
