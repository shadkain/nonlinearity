//
//  RightCellPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

final class ChatRightMessageCellPresenter: ChatMessageCellPresenter {
    unowned let view: ChatMessageCellProtocol
    
    var unauthoredPresenter: ChatMessageUnauthoredPresenter!
    
    var messagePresenter: ChatMessagePresenter! {
        unauthoredPresenter
    }
    
    init(view: ChatMessageCellProtocol) {
        self.view = view
    }
    
    func show(at vLocation: ChatMessageCellVLocation) {
        messagePresenter.show(as: .firstPerson)
        updateVLocation(vLocation)
    }
    
    func updateVLocation(_ vLocation: ChatMessageCellVLocation) {
        view.set(vLocation: vLocation)
    }
}
