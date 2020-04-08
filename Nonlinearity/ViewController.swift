//
//  ViewController.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 01/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mv: MessageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mv = .init(fromModel: .init(
            sender: .companion,
            message: "Hello, kitty! I'm your fan! Really!",
            time: .init(hours: 23, minutes: 14)
            ), withMaxWidth: 290)
        view.addSubview(mv)
    }
    
    override func viewDidLayoutSubviews() {
        mv.pin
            .left(8)
            .top(view.pin.safeArea.top + 100)
    }
    
}
