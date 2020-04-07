//
//  ViewController.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 01/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD
    var mv: MessageView!
=======
    
    override func loadView() {
        //
    }
>>>>>>> 148cbd376523e1f0e7b249cc1378a6b62b4f4954

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mv = MessageView(g: 7)
        view.addSubview(mv)
    }


}

