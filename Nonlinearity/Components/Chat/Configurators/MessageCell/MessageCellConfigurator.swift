//
//  MessageCellConfigurator.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 21.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

//struct ChatMessageCellConfigurator {
//    init(view: ChatMessageCellProtocol, model: ChatMessage, type: ChatMessageType) {
//        switch type {
//        case .right:
//            let view = view as! ChatRightMessageCell
//            let presenter = ChatRightMessageCellPresenter(view: view)
//            presenter.unauthoredPresenter = ChatMessageUnauthoredPresenter(model: model, view: view.unauthoredMessageView)
//            view.presenter = presenter
//        case .leftUnauthored:
//            let view = view as! ChatLeftUnauthoredMessageCell
//            let presenter = ChatLeftUnauthoredMessageCellPresenter(view: view)
//            presenter.unauthoredPresenter = ChatMessageUnauthoredPresenter(model: model, view: view.unauthoredMessageView)
//            view.presenter = presenter
//        case .leftAuthored:
//            let view = view as! ChatLeftAuthoredMessageCell
//            let presenter = ChatLeftAuthoredMessageCellPresenter(view: view)
//            presenter.authoredPresenter = ChatMessageAuthoredPresenter(model: model, view: view.authoredMessageView)
//            view.presenter = presenter
//        }
//    }
//}
