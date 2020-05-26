//
//  RightCell+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatRightMessageCellProtocol: ChatMessageCellProtocol {
    var unauthoredMessageViewProtocol: ChatMessageUnauthoredViewProtocol { get }
}

extension ChatRightMessageCell: ChatRightMessageCellProtocol {
    var unauthoredMessageViewProtocol: ChatMessageUnauthoredViewProtocol {
        unauthoredMessageView
    }
}
