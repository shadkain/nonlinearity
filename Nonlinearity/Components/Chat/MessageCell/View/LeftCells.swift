//
//  LeftCells.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 02.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatLeftUnauthoredMessageCell: ChatBaseLeftMessageCell {
    let unauthoredMessageView = ChatMessageUnauthoredView()
    
    override var messageView: ChatMessageView {
        unauthoredMessageView
    }
}

final class ChatLeftAuthoredMessageCell: ChatBaseLeftMessageCell {
    let authoredMessageView = ChatMessageAuthoredView()
    
    override var messageView: ChatMessageView {
        authoredMessageView
    }
}
