//
//  CircleSystem.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit


class CircleCategories: UIView {
    private let darkBlueCirlce = UIImageView(image: UIImage(named: "darkBlue.png"))
    private let darkBlueText = UITextView()
    
    private let yellowCircle = UIImageView(image: UIImage(named: "yellow.png"))
    private let yellowText = UITextView()
    
    private let redCircle = UIImageView(image: UIImage(named: "redCircle.png"))
    private let redText = UITextView()
    
    private let greenCircle = UIImageView(image: UIImage(named: "greenCircle.png"))
    private let greenText = UITextView()
    
    private let pinkCircle = UIImageView(image: UIImage(named: "pinkCircle.png"))
    private let lightBlueCircle = UIImageView(image: UIImage(named: "lightBlueCircle.png"))
    private let orangeCircle = UIImageView(image: UIImage(named: "orangeCircle.png"))
    private let purpleCircle = UIImageView(image: UIImage(named: "purpleCircle.png"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupDarkBlueCirle () -> Void {
        self.darkBlueCirlce.frame = CGRect(x: 142, y: 259, width: 98, height: 98)
        self.darkBlueText.frame = CGRect(x: 0, y: 36 , width: 98 , height: 50)
        self.darkBlueText.text = "ФАНТАСТИКА"
        self.darkBlueText.textAlignment = .center
        self.darkBlueText.textColor = UIColor.white
        self.darkBlueText.backgroundColor = .clear
        self.darkBlueCirlce.addSubview(darkBlueText)
        return
    }
    
    
    private func setupRedCircle () -> Void {
          self.redCircle.frame = CGRect(x: 248, y: 62, width: 62, height: 62)
          self.redText.frame = CGRect(x: 0, y: 17 , width: 62 , height: 35)
          self.redText.font =  UIFont.systemFont(ofSize: 11)
          self.redText.text = "ДРАМА"
          self.redText.textAlignment = .center
          self.redText.textColor = UIColor.white
          self.redText.backgroundColor = .clear
          self.redCircle.addSubview(redText)
          return
    }
    
    
    private func setupYellowCircle () -> Void {
        self.yellowCircle.frame = CGRect(x: 50, y: 44, width: 92, height: 92)
        self.yellowText.frame = CGRect(x: 0, y: 32 , width: 92 , height: 50)
        self.yellowText.text = "УЖАСЫ"
        self.yellowText.textAlignment = .center
        self.yellowText.textColor = UIColor.white
        self.yellowText.backgroundColor = .clear
        self.yellowCircle.addSubview(yellowText)
        return
    }
    
    private func setupGreenCircle () -> Void {
          self.greenCircle.frame = CGRect(x: 33, y: 150, width: 62, height: 62)
          self.greenText.frame = CGRect(x: 0, y: 17 , width: 62 , height: 35)
          self.greenText.font =  UIFont.systemFont(ofSize: 11)
          self.greenText.text = "ЭКШЕН"
          self.greenText.textAlignment = .center
          self.greenText.textColor = UIColor.white
          self.greenText.backgroundColor = .clear
          self.greenCircle.addSubview(greenText)
          return
    }
    
    private func setupRemainingsCircles() -> Void {
        self.pinkCircle.frame = CGRect(x: 293, y: 162, width: 42, height: 42)
        self.lightBlueCircle.frame = CGRect(x: 76, y: 252, width: 42, height: 42)
        self.orangeCircle.frame = CGRect(x: 178, y: 49, width: 25, height: 25)
        self.purpleCircle.frame = CGRect(x: 268, y: 262, width: 25, height: 25)
    }
    
    private func setup() -> Void {
        self.setupDarkBlueCirle()
        self.setupYellowCircle()
        self.setupRedCircle()
        self.setupGreenCircle()
        setupRemainingsCircles()
        
        self.addSubview(darkBlueCirlce)
        self.addSubview(yellowCircle)
        self.addSubview(redCircle)
        self.addSubview(greenCircle)
        self.addSubview(pinkCircle)
        self.addSubview(lightBlueCircle)
        self.addSubview(orangeCircle)
        self.addSubview(purpleCircle)
    }
}


