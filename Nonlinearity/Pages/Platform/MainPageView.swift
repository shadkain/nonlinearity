//
//  MainPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 19/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
import UIKit

class MainPageView: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let child = BubbleViewCollection()
        view.addSubview(child.view)
        addChild(child)
        child.didMove(toParent: parent)
    }
}
