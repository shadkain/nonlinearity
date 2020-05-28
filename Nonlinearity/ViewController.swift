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
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            self.setNeedsStatusBarAppearanceUpdate()
            self.view.addSubview(footBarVC.view)
    }
}
