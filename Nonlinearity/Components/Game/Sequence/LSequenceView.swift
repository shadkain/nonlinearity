//
//  LSequnceView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 11.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

extension Message {
    struct LSequence {
        lazy var messages: [Message] = []
        var imgPath: String?
    }
    
    class LSequenceViewModel: BaseSequenceViewModel {
        override func push(message: Message) {
            model.messages.append(message)
            super.push(message: message)
        }
        
        private var model: LSequence
        
        init(model: LSequence = .init()) {
            self.model = model
        }
    }
    
    final class LSequenceView: BaseSequenceView {
        private let avatarView = UIImageView()
        
        override func setup() {
            avatarView.image = .init(imageLiteralResourceName: "avatar")
            addSubview(avatarView)
        }
        
        override func initLayout(withView view: Message.View, maxWidth: CGFloat) {
            view.layout(withMaxWidth: maxWidth)
            view.pin
                .top()
                .left(42)
        }
        
        override func extendLayout(put newView: Message.View, under lastView: Message.View, maxWidth: CGFloat) {
            newView.layout(withMaxWidth: maxWidth)
            newView.pin
                .below(of: lastView, aligned: .left)
                .marginTop(5)
        }
        
        override func didLayout(on lastView: Message.View) {
            avatarView.pin
                .before(of: lastView, aligned: .bottom)
                .marginRight(8)
                .sizeToFit(.content)
            self.pin.wrapContent(.all)
        }
    }
}

