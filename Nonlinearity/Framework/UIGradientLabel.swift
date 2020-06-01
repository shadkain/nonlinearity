//
//  UIGradientLabel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 23.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class UIGradientLabel: UILabel {
    var startPoint: CGPoint?
    var endPoint: CGPoint?
    
    var gradientColors: [UIColor]?
    
    private var colorComponents: [CGFloat]? {
        guard let gradientColors = gradientColors,
            gradientColors.count > 0 else {
            return nil
        }
        
        var colorComponents = [CGFloat]()
        
        gradientColors.forEach {
            var r = CGFloat(0)
            var g = CGFloat(0)
            var b = CGFloat(0)
            var a = CGFloat(0)
            
            $0.getRed(&r, green: &g, blue: &b, alpha: &a)
            colorComponents.append(contentsOf: [r, g, b, a])
        }
        
        
        return colorComponents
    }
    
    private func points(for rect: CGRect) -> (start: CGPoint, end: CGPoint) {
        return (
            start: .init(x: (startPoint?.x ?? 0) * rect.maxX, y: (startPoint?.y ?? 0) * rect.maxY),
            end: .init(x: (endPoint?.x ?? 1) * rect.maxX, y: (endPoint?.y ?? 1) * rect.maxY)
        )
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect)
        
        guard let ctx = UIGraphicsGetCurrentContext(),
            let mask = ctx.mask() else {
            return
        }
        defer { ctx.restoreGState() }
        
        ctx.saveGState()
        ctx.concatenate(.init(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: rect.height))
        ctx.clear(rect)
        ctx.clip(to: rect, mask: mask)
        
        if let colorComponents = colorComponents {
            let points = self.points(for: rect)

            ctx.concatenate(.init(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: rect.height))
            ctx.drawGradient(with: colorComponents, start: points.start, end: points.end)
        }
    }
}
