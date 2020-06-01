//
//  CGContext+gradient.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension CGContext {
    func mask() -> CGImage? {
        guard let image = makeImage() else {
            print("*** WARNING (UIGradientLabel): Unable to create image from graphics context")
            return nil
        }
        
        return image
    }
    
    func drawGradient(with colorComponents: [CGFloat], start: CGPoint, end: CGPoint) {
        guard let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                        colorComponents: colorComponents,
                                        locations: nil,
                                        count: colorComponents.count / 4) else {
            print("*** WARNING (UIGradientLabel): Unable to create gradient from gradient colors")
            return
        }
        
        drawLinearGradient(gradient, start: start, end: end, options: CGGradientDrawingOptions(rawValue: 0))
    }
}
