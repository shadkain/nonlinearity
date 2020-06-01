//
//  LoginView.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 01.06.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
import UIKit

final class LoginView: UIView {
    private var errorLabel = UILabel(frame: CGRect(x: 30, y: 150, width: 300, height: 90))
    private let nickname = UITextField(frame: CGRect(x: 30, y: 250, width: 300, height: 40))
    private let password = UITextField(frame: CGRect(x: 30, y: 310, width: 300, height: 40))
    private let loginButton = UIButton(frame: CGRect(x: 50, y: 370, width: 250, height: 40))
    
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    weak var vc: ProfileView?
    
    var error: String

    override init(frame: CGRect) {
        self.error = ""
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setup() {
            nickname.placeholder = "Username"
            nickname.backgroundColor = UIColor.white
            nickname.textColor = UIColor.purple
            nickname.layer.cornerRadius = 9
            self.addSubview(nickname)
            
            password.placeholder = "password"
            password.layer.cornerRadius = 9
            password.isSecureTextEntry = true
            
            
            // Set UITextField background colour
            password.backgroundColor = UIColor.white
            
            // Set UITextField text color
            password.textColor = UIColor.purple
            
            
            // Add UITextField as a subview
            self.addSubview(password)
        
        
        loginButton.backgroundColor = .hex(rgb: 0x8D4086)
        loginButton.layer.cornerRadius = 17
        loginButton.setTitle("Войти", for: .normal)
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.addSubview(loginButton)
        
        if error != "" {
            self.errorLabel.font = UIFont.boldSystemFont(ofSize: 20)
            self.errorLabel.text = error
            self.errorLabel.textAlignment = .center
            self.errorLabel.textColor = .red
            self.errorLabel.numberOfLines = 0
            self.addSubview(errorLabel)
        }
        
    }
    
    @objc
    private func buttonAction(sender: UIButton!) {
     var u = User(username: "")
          u.username = nickname.text!
          u.password = password.text!
          
          print(u)
          networkManager.login(user: u) { (state) in
              if state == true {
                  DispatchQueue.main.async {
                      self.vc!.isLogin = true
                      self.vc!.reload()
                      print("success")
                  }
              } else {
                  self.error = "Неправильный логин или пароль"
                    DispatchQueue.main.async {
                        self.vc!.loginView.setup()
                        print("error")
                    }
              }
          }
     }
}
