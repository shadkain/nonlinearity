//
//  ViewController.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 01/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var footBarVC = FootBarVC()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
//
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setNeedsStatusBarAppearanceUpdate()
        self.view.addSubview(footBarVC.view)
        
        
//        self.footbar.profile.addTarget(self, action: #selector(didTapProfile), for: .touchUpInside)
        
//         Do any additional setup after loading the view.
    }
    
//    @objc func didTapProfile () -> Void {
//        let profileVC = ProfileView()
//        profileVC.modalPresentationStyle = .fullScreen
//        print("tap Profile")
//        self.present(profileVC, animated: true, completion: nil)
//    }
//
}


