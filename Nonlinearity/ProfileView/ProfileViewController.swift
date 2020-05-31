//
//  ProfileViewController.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {
    // TODO GET REAl NICKNAME
    var upperBlock = UpperBlock(frame: CGRect(), nickname: "hifromnorway")
    
    var mainBlock = MainBlock(frame: CGRect(x: 0, y: 87, width: 375, height: 725))
//    var footbar = Footbar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        self.view.addSubview(upperBlock)
        self.view.addSubview(mainBlock)
//        self.view.addSubview(footbar)
        
//        self.footbar.history.addTarget(self, action: #selector(didTapHistory), for: .touchUpInside)
        
        constraint()
    
        
        return
    }
    
    private func constraint() {
        upperBlock.clipsToBounds = true
        self.upperBlock.translatesAutoresizingMaskIntoConstraints = false
        self.upperBlock.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.upperBlock.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.upperBlock.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.upperBlock.heightAnchor.constraint(equalToConstant: 87).isActive = true
    }
    
    @objc func didTapHistory () -> Void {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        print("tap History")
        self.present(viewController, animated: true, completion: nil)
    }
}
