//
//  FootBarVC.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit


class FootBarVC: UITabBarController {
    
    
    private let historyIV = UIImageView(image: UIImage(named: "history.png"))
    private let searchIV = UIImageView(image: UIImage(named: "search.png"))
    private let myDeskIV = UIImageView(image: UIImage(named: "play.png"))
    private let downloadsIV = UIImageView(image: UIImage(named: "downloads.png"))
    private let profileIV = UIImageView(image: UIImage(systemName: "person.fill"))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let historyVC = UIViewController()

        historyVC.tabBarItem = UITabBarItem(title: "History", image: historyIV.image, tag: 0)
        historyVC.view.backgroundColor = .yellow
        
        let searchVC = UIViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: searchIV.image, tag: 1)
        searchVC.view.backgroundColor = .red
        
        let myDeskVC = UIViewController()
        myDeskVC.tabBarItem = UITabBarItem(title: "Desk", image: myDeskIV.image, tag: 2)
        myDeskVC.view.backgroundColor = .red
        
        let downoadsVC = UIViewController()
        downoadsVC.tabBarItem = UITabBarItem(title: "Downoloads", image: downloadsIV.image, tag: 3)
        downoadsVC.view.backgroundColor = .white
              
        
       let profileVC = ProfileView()
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: profileIV.image, tag: 4)
        
  

        let tabBarList = [historyVC, searchVC, myDeskVC, downoadsVC, profileVC]
        viewControllers = tabBarList
        
    }
    
}
