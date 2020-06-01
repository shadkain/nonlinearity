//
//  UIScreenViewController.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 27.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UIScreenViewController: UIViewController {
    var requiredScreenView: UIScreenView {
        fatalError("screenView: UIScreenView has not been implemented")
    }
    
    override func loadView() {
        view = requiredScreenView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requiredScreenView.setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requiredScreenView.constraint()
    }
}
