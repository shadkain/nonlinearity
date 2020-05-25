//
//  UIGradientView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UIGradientView: UIViewComponent {
    private let gradientLayer = CAGradientLayer()
    
    var startPoint: CGPoint {
        get {
            gradientLayer.startPoint
        }
        set {
            gradientLayer.startPoint = newValue
        }
    }
    var endPoint: CGPoint {
        get {
            gradientLayer.endPoint
        }
        set {
            gradientLayer.endPoint = newValue
        }
    }
    var gradientCornerRadius: CGFloat {
        get {
            gradientLayer.cornerRadius
        }
        set {
            gradientLayer.cornerRadius = newValue
        }
    }
    
    func setGradientColors(_ colors: [UIColor]) {
        var cgColors = [CGColor]()
        colors.forEach {
            cgColors.append($0.cgColor)
        }
        
        gradientLayer.colors = cgColors
    }
    
    override func setup() {
        layer.addSublayer(gradientLayer)
    }
    
    override func layout() {
        gradientLayer.frame = bounds
    }
}
