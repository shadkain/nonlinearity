//
//  UIColor+hex.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 01.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension UIColor {
//    convenience init(hex: Int) {
//        self.init(
//            red: (hex >> 16) & 0xFF,
//            green: (hex >> 8) & 0xFF,
//            blue: hex & 0xFF
//        )
//    }
//    
//    convenience init(red: Int, green: Int, blue: Int) {
//        self.init(
//            red: CGFloat(red) / 255.0,
//            green: CGFloat(green) / 255.0,
//            blue: CGFloat(blue) / 255.0,
//            alpha: 1.0
//        )
//    }
    
    static func rgb(red: Int, green: Int, blue: Int) -> UIColor {
        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }
    
    static func hex(rgb: Int) -> UIColor {
        return .rgb(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
