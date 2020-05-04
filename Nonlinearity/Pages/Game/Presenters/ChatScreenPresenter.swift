//
//  ChatScreenPresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

struct ChatScreenConfigurator {
    let view: ChatScreenView
    let presenter: ChatScreenPresenter
    
    init(model: Chat, view: ChatScreenView) {
        presenter = .init(model: model, view: view)
        
        presenter.headerPresenter = .init(model: .init(companion: model.companions[0], networkStatus: .offline), view: view.headerView)
        view.headerView.presenter = presenter.headerPresenter
        
        presenter.bottomPresenter = .init(model: .init(), view: view.bottomView)
        view.bottomView.presenter = presenter.bottomPresenter
        
        self.view = view
    }
}

protocol ChatScreenPresenterProtocol {
    func show()
}

final class ChatScreenPresenter: ChatScreenPresenterProtocol {
    unowned let view: ChatScreenViewProtocol
    var model: Chat
    
    // MARK: subpresenters
    var headerPresenter: ChatHeaderPresenter!
    var bottomPresenter: ChatBottomPresenter!
    
    init(model: Chat, view: ChatScreenViewProtocol) {
        self.view = view
        self.model = model
    }
    
    func show() {
        headerPresenter.show()
    }
}
