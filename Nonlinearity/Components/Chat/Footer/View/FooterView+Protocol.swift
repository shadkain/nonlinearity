//
//  FooterView+Protocol.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 26.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

protocol ChatFooterViewProtocol: class {
    var presenter: ChatFooterPresenterProtocol! { get set }
    func setAppearance(_ appearance: ChatFooterViewAppearance)
}

extension ChatFooterView: ChatFooterViewProtocol {
    func setAppearance(_ appearance: ChatFooterViewAppearance) {
        nextButtonView.image = .init(imageLiteralResourceName: appearance.nextButtonImageName)
    }
}
