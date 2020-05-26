//
//  MessagePresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 24.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatMessagePresenter: class  {
    var model: ChatMessage { get set }
    func show(as role: ChatMessageRole?)
    func updateBackgroundColor(ofView: ChatMessageViewProtocol, with: ChatMessageAppearance, as: ChatMessageRole?)
}

extension ChatMessagePresenter {
    func updateBackgroundColor(ofView view: ChatMessageViewProtocol, with appearance: ChatMessageAppearance, as role: ChatMessageRole?) {
        switch role {
        case .firstPerson:
            view.setBackgroundColor(appearance.firstPersonBackgroundColor)
        case .secondPerson:
            view.setBackgroundColor(appearance.secondPersonBackgroundColor)
        case .none:
            view.clearBackgroundColor()
        }
    }
}
