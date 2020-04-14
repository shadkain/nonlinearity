//
//  RSequnceView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 10.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit
import PinLayout

extension Message {
    struct RSequence {
        lazy var messages: [Message] = []
    }
    
    final class RSequenceViewModel: BaseSequenceViewModel {
        override func push(message: Message) {
            model.messages.append(message)
            super.push(message: message)
        }
        
        private var model: RSequence
        
        init(model: RSequence = .init()) {
            self.model = model
        }
    }
    
    final class RSequnceView: BaseSequenceView {
        override func initLayout(withView view: Message.View, maxWidth: CGFloat) {
            view.layout(withMaxWidth: maxWidth)
            view.pin
                .top()
                .right()
        }
        
        override func extendLayout(put newView: Message.View, under lastView: Message.View, maxWidth: CGFloat) {
            newView.layout(withMaxWidth: maxWidth)
            newView.pin
                .below(of: lastView, aligned: .right)
                .marginTop(5)
        }
        
        override func didLayout(on lastView: Message.View) {
            self.pin.wrapContent(.all)
        }
    }
}
