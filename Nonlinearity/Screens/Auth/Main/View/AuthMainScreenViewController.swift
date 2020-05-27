//
//  AuthMainScreenController.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 27.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class AuthMainScreenViewController: UIScreenViewController {
    let screenView = AuthMainScreenView()
    override var requiredScreenView: UIScreenView { screenView }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
}
