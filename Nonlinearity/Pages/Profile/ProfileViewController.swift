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
    
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
//        networkManager.getStory(id: 1) {(story) in
//            print(story)
//            return
//        }
//
//        networkManager.getRubrics { (rubrics) in
//            print(rubrics)
//
//        }
        
//        var u = User()
//        u.username = "hifro"
//        u.password = "helloworld"
//
//        networkManager.login(user: u) { (state) in
//             print(state)
//        }
////
//        networkManager.getStoryDataJSON(storyPath: "test-story.json") { (data) in
//            let str = String(decoding: data!, as: UTF8.self)
//            print(str)
//        }
        

//                networkManager.getAvatarStoryData(avatarStoryPath: "defaultAvatar.png"){ (data) in
//                    print(data)
//                }
//
//        networkManager.getProfile {(user) in
//            print(user)
//        }
        
//        networkManager.logout{(state) in
//            print(state)
//        }
//
        
        self.view.addSubview(upperBlock)
        self.view.addSubview(mainBlock)
        
        
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
