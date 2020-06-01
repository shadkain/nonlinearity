//
//  signup.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 01.06.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
import UIKit

final class SignUp: UIView {
    private let nickname = UITextField(frame: CGRect(x: 30, y: 250, width: 300, height: 40))
    private let password = UITextField(frame: CGRect(x: 30, y: 310, width: 300, height: 40))
    private let signupButton = UIButton(frame: CGRect(x: 50, y: 370, width: 250, height: 40))
    private var error: String?
    weak var vc: ProfileView?
    
    private let networkManager: NetworkManagerDescription = NetworkManager.shared

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setup() {
            nickname.placeholder = "Username"
            nickname.backgroundColor = UIColor.white
            nickname.textColor = UIColor.purple
            nickname.layer.cornerRadius = 9
            self.addSubview(nickname)
            
            // Set UITextField placeholder text
            password.placeholder = "password"
            password.layer.cornerRadius = 9
            password.isSecureTextEntry = true
            
            
            // Set UITextField background colour
            password.backgroundColor = UIColor.white
            
            // Set UITextField text color
            password.textColor = UIColor.purple
            
            
            // Add UITextField as a subview
            self.addSubview(password)
        
        
        signupButton.backgroundColor = .hex(rgb: 0x8D4086)
        signupButton.layer.cornerRadius = 17
        signupButton.setTitle("Зарегистрироваться", for: .normal)
        signupButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(signupButton)
        
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
        var u = User(username: "")
        u.username = nickname.text!
        u.password = password.text!
        
        print(u)
        networkManager.signup(user: u) { (state) in
            if state == true {
                DispatchQueue.main.async {
                    self.vc!.isSignUp = true
                    self.vc!.reload()
                    print("success")
                }
            } else {
                self.error = "Данный логин уже занят"
            }
        }
    }
}
