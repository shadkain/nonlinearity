//
//  AuthScreenViewController.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 28.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class AuthScreenViewController: UIScreenViewController {
    let screenView = AuthScreenView()
    override var requiredScreenView: UIScreenView { screenView }
}
