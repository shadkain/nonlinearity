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
        
        let historyVC = MainPageView()
        historyVC.tabBarItem = UITabBarItem(title: "Главная", image: historyIV.image, tag: 0)
        
//        let InProgressVC = InProgressPageView()
//        InProgressVC.tabBarItem = UITabBarItem(title: "In progress", image: myDeskIV.image, tag: 1)
    
//        let downoadsVC = DownloadsPageView()
//        downoadsVC.tabBarItem = UITabBarItem(title: "Downoloads", image: downloadsIV.image, tag: 2)
              
        
       let profileVC = ProfileView()
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: profileIV.image, tag: 1)
        
  

        let tabBarList = [historyVC, profileVC]
        viewControllers = tabBarList
        
    }
    
}
