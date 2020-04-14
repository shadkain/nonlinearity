//
//  CompanionMessageVStackView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 11.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

final class LeftMessageVStackView: MessageVStackView {
    let avatarView = UIImageView()
    
    override func setup() {
        avatarView.image = .init(imageLiteralResourceName: "avatar")
        addSubview(avatarView)
    }
    
    override func initLayout(withView view: MessageView, maxWidth: CGFloat) {
        print("init layout")
        view.layout(withMaxWidth: maxWidth)
        view.pin
            .top()
            .left(42)
    }
    
    override func extendLayout(put newView: MessageView, under lastView: MessageView, maxWidth: CGFloat) {
        print("extend layout")
        newView.layout(withMaxWidth: maxWidth)
        newView.pin
            .below(of: lastView, aligned: .left)
            .marginTop(5)
    }
    
    override func didLayout(on lastView: MessageView) {
        print("did layout")
        avatarView.pin
            .before(of: lastView, aligned: .bottom)
            .marginRight(8)
            .sizeToFit(.content)
        self.pin.wrapContent(.all)
    }
}
