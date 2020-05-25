//
//  String+width.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 07.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension String {
    func width(usingFont font: UIFont) -> CGFloat {
        let size = self.size(withAttributes: [.font: font])
        return size.width
    }
    
    func boundingRect(usingFont font: UIFont, maxWidth: CGFloat) -> CGRect {
        let constraintRect = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        return self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
    }
    
    func breakLineUsingWordWrapping(usingFont font: UIFont, maxWidth: CGFloat) -> [String] {
        let text = self as NSString
        let rect = self.boundingRect(usingFont: font, maxWidth: maxWidth)
        
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
}
