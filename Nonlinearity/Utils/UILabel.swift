//
//  UILabel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 12.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension UILabel {
    var textWidth: CGFloat {
        text?.width(usingFont: font) ?? 0
    }
    
    func breakLineUsingWordWrapping() -> [String]? {
        return breakLineUsingWordWrapping(withMaxWidth: bounds.width)
    }
    
    func breakLineUsingWordWrapping(withMaxWidth maxWidth: CGFloat) -> [String]? {
        return self.text?.breakLineUsingWordWrapping(usingFont: font, maxWidth: bounds.width)
    }
    
    func lastLineWidth(withMaxWidth maxWidth: CGFloat) -> CGFloat {
        guard let lines = breakLineUsingWordWrapping(withMaxWidth: maxWidth),
            let lastLine = lines.last else {
                return .greatestFiniteMagnitude
        }
        
        return lastLine.width(usingFont: font)
    }
    
    var lastLineWidth: CGFloat {
        return lastLineWidth(withMaxWidth: bounds.width)
    }
}
