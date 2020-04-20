//
//  UpperBlock.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//


import UIKit

final class UpperBlock: UIView {
    private let nicknameBlock = UILabel()
    private let settingsBlock = UIButton()
    private let settingsImage = UIImageView()
    private let nickname : String
    
    init(frame: CGRect, nickname: String) {
        self.nickname = nickname
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupNickname() -> Void {
        self.nicknameBlock.font =  UIFont.systemFont(ofSize: 24)
        self.nicknameBlock.text = self.nickname
        self.nicknameBlock.textAlignment = .center
        self.nicknameBlock.textColor = .white
        self.nicknameBlock.backgroundColor = UIColor(netHex:0x252525)
        return
    }
    
    private func setupSettingsBlock() -> Void {
        let size = 28
        self.settingsBlock.frame = CGRect(x: Int(UIScreen.main.bounds.width) - 40, y: 52, width: size, height: size)
        self.settingsImage.image = UIImage(systemName: "gear")
        self.settingsImage.frame = CGRect(x: 0, y: 0, width: size, height: size)
        self.settingsBlock.addSubview(settingsImage)
        self.settingsBlock.tintColor = .white
        return
    }
 
    private func setup() -> Void {
        self.backgroundColor = UIColor(netHex:0x252525)
        self.setupNickname()
        self.setupSettingsBlock()
        self.addSubview(nicknameBlock)
        self.addSubview(settingsBlock)
        constraint()
        return
    }
    
    private func constraint() {
        self.nicknameBlock.translatesAutoresizingMaskIntoConstraints = false
        self.nicknameBlock.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.nicknameBlock.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive=true
        self.nicknameBlock.heightAnchor.constraint(equalToConstant: 28).isActive = true
    }
}

