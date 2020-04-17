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
        guard let text = self.text as NSString? else { return nil }
        let font = self.font!
        let rect = self.frame
        
        let ctFont = CTFontCreateWithFontDescriptor(font.fontDescriptor, font.pointSize, nil)
        let attrText = NSMutableAttributedString(string: text as String)
        attrText.addAttribute(.init(rawValue: String(kCTFontAttributeName)), value: ctFont, range: NSMakeRange(0, attrText.length))

        let frameSetter = CTFramesetterCreateWithAttributedString(attrText as CFAttributedString)
        let path = CGMutablePath()
        path.addRect(.init(x: 0, y: 0, width: rect.size.width, height: .greatestFiniteMagnitude), transform: .identity)

        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        let lines = CTFrameGetLines(frame) as NSArray
        var linesArray = [String]()

        for line in lines {
            let lineRange = CTLineGetStringRange(line as! CTLine)
            let range = NSMakeRange(lineRange.location, lineRange.length)
            
            let lineString = text.substring(with: range)
            linesArray.append(lineString as String)
        }
        
        return linesArray
    }
    
    var lastLineWidth: CGFloat {
        guard let lines = breakLineUsingWordWrapping(),
            let lastLine = lines.last else {
                return .greatestFiniteMagnitude
        }
        
        return lastLine.width(usingFont: self.font)
    }
}
