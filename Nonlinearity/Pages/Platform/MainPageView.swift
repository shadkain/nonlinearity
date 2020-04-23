//
//  MainPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class MainPageView: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        let child = TableCardView()
        view.addSubview(child.view)
        addChild(child)
        child.didMove(toParent: parent)
    }
}
