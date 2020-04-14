//
//  MyMessageGroupView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 10.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

final class RightMessageVStackView: MessageVStackView {
    override func initLayout(withView view: MessageView, maxWidth: CGFloat) {
        view.layout(withMaxWidth: maxWidth)
        view.pin
            .top()
            .right()
    }
    
    override func extendLayout(put newView: MessageView, under lastView: MessageView, maxWidth: CGFloat) {
        newView.layout(withMaxWidth: maxWidth)
        newView.pin
            .below(of: lastView, aligned: .right)
            .marginTop(5)
    }
    
    override func didLayout(on lastView: MessageView) {
        self.pin.wrapContent(.all)
    }
}
