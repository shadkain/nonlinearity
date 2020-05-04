//
//  MessagePresenter.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 24.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatMessagePresenter: class {
    func show(as role: Chat.Message.Role?)
}
