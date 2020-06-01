//
//  ButtonView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class ButtonView: UIButton {
    override func endTracking(_ touch: UITouch?,
                              with event: UIEvent?) {

        super .endTracking(touch, with: event)

        UIView.animateKeyframes(withDuration: 0.4,
                                delay: 0.0,
                                options: [.beginFromCurrentState,
                                          .allowUserInteraction],
                                animations: {
            self.backgroundColor = self.backgroundColor?.withAlphaComponent(self.isHighlighted ? 0.3 : 1)
        })
    }
}


