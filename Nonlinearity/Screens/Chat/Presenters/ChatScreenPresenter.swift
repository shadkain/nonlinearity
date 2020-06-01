//
//  ChatScreenPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

enum ChatMessageType {
    case right, leftUnauthored, leftAuthored
}

enum ChatMessageCellLocation {
    case first, regular, lastInChain
}

final class ChatScreenPresenter {
    unowned let view: ChatScreenViewProtocol
    var model: ChatModel
    
    init(model: ChatModel, view: ChatScreenViewProtocol) {
        self.model = model
        self.view = view
        
        connect()
        setup()
    }
    
    private func connect() {
        view.headerViewProtocol.presenter = self
        view.footerViewProtocol.presenter = self
        view.presenter = self
    }
    
    private func setup() {
        view.headerViewProtocol.setAppearance(DarkChatHeaderViewAppearance())
        view.footerViewProtocol.setAppearance(DarkChatFooterViewAppearance())
    }
    
    func show() {
        view.headerViewProtocol.setBigText(model.title)
        view.headerViewProtocol.setSmallText("\(model.percentage)%")
    }
}
