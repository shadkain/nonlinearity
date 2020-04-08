//
//  ModelView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 08.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct MessageModel {
    enum Sender {
        case me
        case companion
    }
    struct Time {
        var hours: Int8
        var minutes: Int8
        
        func toString() -> String {
            return "\(hours):\(minutes)"
        }
    }
    
    var sender: Sender
    var message: String
    var time: Time
}

final class MessageViewModel {
    var sender: MessageModel.Sender {
        get { model.sender }
        set { model.sender = newValue; senderDidChange?(self) }
    }
    var message: String {
        get { model.message }
        set { model.message = newValue; messageDidChange?(self) }
    }
    var time: MessageModel.Time {
        get { model.time }
        set { model.time = newValue; timeDidChange?(self) }
    }
    
    var senderDidChange: ((MessageViewModel) -> Void)?
    var messageDidChange: ((MessageViewModel) -> Void)?
    var timeDidChange: ((MessageViewModel) -> Void)?
    
    private var model: MessageModel
    
    init(model: MessageModel) {
        self.model = model
    }
    
    func forceUpdate() {
        [senderDidChange, messageDidChange, timeDidChange].forEach { $0?(self) }
    }
}
