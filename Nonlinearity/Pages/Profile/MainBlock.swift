//
//  MainBlock.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//


import UIKit

class MainBlock: UIView {
    private let avatarBlock = UIImageView(image: UIImage(named: "profileAvatar.jpeg"))
    private let titleBlock = UILabel(frame: CGRect(x: 37, y: 368, width: 302, height: 28))
    private let descBlock = UILabel(frame: CGRect(x: 37, y: 403, width: 302, height: 36))
    private let offerBlock = UILabel(frame: CGRect(x: 26, y: 458, width: 325, height: 36))
    private let circleSystem = CircleCategories()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAvatar() -> Void {
        self.avatarBlock.frame = CGRect(x: 125, y: 120, width: 126, height: 126)
        self.avatarBlock.layer.cornerRadius = (avatarBlock.image?.size.width)! / 3.2
        self.avatarBlock.clipsToBounds = true
        self.avatarBlock.layer.borderColor = UIColor.white.cgColor
        self.avatarBlock.layer.borderWidth = 4
        return
    }

    private func setupTitle() -> Void {
        self.titleBlock.font = UIFont.boldSystemFont(ofSize: 20)
        self.titleBlock.text = "Ваш титул 'Франкештейн'"
        self.titleBlock.textAlignment = .center
        self.titleBlock.textColor = UIColor(netHex: 0x7297CE)
    }
    
    private func setupDesc() -> Void {
        self.descBlock.lineBreakMode = .byWordWrapping
        self.descBlock.numberOfLines = 0
        self.descBlock.font = UIFont.systemFont(ofSize: 15)
        self.descBlock.text = "В последнее время вы увлекаетесь ужасами и фантастикой"
        self.descBlock.textAlignment = .center
        self.descBlock.textColor = UIColor.white
    }
    
    private func setupOffer() -> Void {
        self.offerBlock.font = UIFont.systemFont(ofSize: 15)
        self.offerBlock.text = "Предлагаем посмотреть подборку историй по вашим интересам"
        self.offerBlock.textAlignment = .center
        self.offerBlock.textColor = UIColor.white
        self.offerBlock.lineBreakMode = .byWordWrapping
        self.offerBlock.numberOfLines = 0
    }
    
    private func setup() -> Void {
        setupAvatar()
        setupTitle()
        setupDesc()
        setupOffer()
        
        self.addSubview(avatarBlock)
        self.addSubview(titleBlock)
        self.addSubview(descBlock)
        self.addSubview(offerBlock)
        self.addSubview(circleSystem)
        return
    }
}

