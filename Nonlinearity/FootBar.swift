//
//  Foodbar.swift
//  nolinearity
//
//  Created by Андронов Дмитрий on 19.04.2020.
//  Copyright © 2020 Andronov Dima. All rights reserved.
//

import UIKit

class Footbar: UIStackView {
    let screenSize = UIScreen.main.bounds
    let history = UIButton()
    let search = UIButton()
    let myDesk = UIButton()
    let downloads = UIButton()
    let profile = UIButton()
    
    private let historyIV = UIImageView(image: UIImage(named: "history.png"))
    private let searchIV = UIImageView(image: UIImage(named: "search.png"))
    private let myDeskIV = UIImageView(image: UIImage(named: "play.png"))
    private let downloadsIV = UIImageView(image: UIImage(named: "downloads.png"))
    private let profileIV = UIImageView(image: UIImage(systemName: "person.fill"))
    
    
    
    let elemSize = 37
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup () -> Void {
        self.axis = .horizontal
        self.frame = CGRect(x: 0, y: screenSize.height - 81  , width:screenSize.width, height: 81)
        self.backgroundColor = UIColor(netHex:0x252525)
        self.distribution = .fillEqually
        self.alignment = .fill
        
        self.setupElements()
        
        self.addArrangedSubview(history)
        self.addArrangedSubview(search)
        self.addArrangedSubview(myDesk)
        self.addArrangedSubview(downloads)
        self.addArrangedSubview(profile)
    }
    
    func setupElements() -> Void {
        self.setupHistory()
        self.setupSearch()
        self.setupMydesk()
        self.setupDownloads()
        self.setupProfile()
        
        self.constraint()
        
        return
    }
    
    func setupProfile () -> Void {
        self.profile.addSubview(profileIV)
        self.profile.tintColor = UIColor(netHex: 0xC35EB9)
        self.profile.backgroundColor = UIColor.black
        return
    }
    
    func setupHistory () -> Void {
        self.history.addSubview(historyIV)
        self.history.tintColor = UIColor(netHex: 0xC35EB9)
        self.history.backgroundColor = UIColor(netHex:0x252525)
        return
    }

    func setupSearch () -> Void {
        self.search.addSubview(searchIV)
        self.search.tintColor = .gray
        self.search.backgroundColor = UIColor(netHex:0x252525)
        return
    }
    
    func setupDownloads () -> Void {
        self.downloads.addSubview(downloadsIV)
        self.downloads.tintColor = .gray
        self.downloads.backgroundColor = UIColor(netHex:0x252525)
        return
    }
    
    func setupMydesk () -> Void {
        self.myDesk.addSubview(myDeskIV)
        self.myDesk.tintColor = .gray
        self.myDesk.backgroundColor = UIColor(netHex:0x252525)
        return
    }
    
    
    func constraint() -> Void {
        self.historyIV.translatesAutoresizingMaskIntoConstraints = false
        self.historyIV.centerXAnchor.constraint(equalTo: self.history.centerXAnchor).isActive = true
        self.historyIV.centerYAnchor.constraint(equalTo: self.history.centerYAnchor).isActive=true
        self.historyIV.heightAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        self.historyIV.widthAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        
        self.searchIV.translatesAutoresizingMaskIntoConstraints = false
        self.searchIV.centerXAnchor.constraint(equalTo: self.search.centerXAnchor).isActive = true
        self.searchIV.centerYAnchor.constraint(equalTo: self.search.centerYAnchor).isActive=true
        self.searchIV.heightAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        self.searchIV.widthAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        
        self.myDeskIV.translatesAutoresizingMaskIntoConstraints = false
        self.myDeskIV.centerXAnchor.constraint(equalTo: self.myDesk.centerXAnchor).isActive = true
        self.myDeskIV.centerYAnchor.constraint(equalTo: self.myDesk.centerYAnchor).isActive=true
        self.myDeskIV.heightAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        self.myDeskIV.widthAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        
        self.downloadsIV.translatesAutoresizingMaskIntoConstraints = false
        self.downloadsIV.centerXAnchor.constraint(equalTo: self.downloads.centerXAnchor).isActive = true
        self.downloadsIV.centerYAnchor.constraint(equalTo: self.downloads.centerYAnchor).isActive=true
        self.downloadsIV.heightAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        self.downloadsIV.widthAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        
        self.profileIV.translatesAutoresizingMaskIntoConstraints = false
        self.profileIV.centerXAnchor.constraint(equalTo: self.profile.centerXAnchor).isActive = true
        self.profileIV.centerYAnchor.constraint(equalTo: self.profile.centerYAnchor).isActive=true
        self.profileIV.heightAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
        self.profileIV.widthAnchor.constraint(equalToConstant: CGFloat(elemSize)).isActive = true
    }
    
}
