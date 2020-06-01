//
//  LeftCells+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatLeftUnauthoredMessageCellProtocol: ChatLeftMessageCellProtocol {
    var unauthoredMessageViewProtocol: ChatMessageUnauthoredViewProtocol { get }
}

extension ChatLeftUnauthoredMessageCell: ChatLeftUnauthoredMessageCellProtocol {
    var unauthoredMessageViewProtocol: ChatMessageUnauthoredViewProtocol {
        unauthoredMessageView
    }
}

protocol ChatLeftAuthoredMessageCellProtocol: ChatLeftMessageCellProtocol {
    var authoredMessageViewProtocol: ChatMessageAuthoredViewProtocol { get }
}

extension ChatLeftAuthoredMessageCell: ChatLeftAuthoredMessageCellProtocol {
    var authoredMessageViewProtocol: ChatMessageAuthoredViewProtocol {
        authoredMessageView
    }
}
