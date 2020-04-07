//
//  ViewController.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 01/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let sv = StoryCardView(frame: .zero)
        
        sv.image = UIImage(named: "book")
        sv.nameLable.text = "Захватывающий дух"
        
        view.addSubview(sv)
        
        sv.pin
            .top(100)
            .horizontally(150)
            .height(300)
    }


}

