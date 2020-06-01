//
//  ChatScreenViewController.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatScreenViewController: UIScreenViewController {
    let screenView = ChatScreenView()
    override var requiredScreenView: UIScreenView { screenView }
    
    override var prefersStatusBarHidden: Bool { true }
}
