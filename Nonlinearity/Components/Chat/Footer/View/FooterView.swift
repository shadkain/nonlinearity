//
//  BottomView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatFooterViewProtocol: class {
    func set(appearance: ChatBottomViewAppearance)
}

final class ChatFooterView: UIViewComponent {
    let nextButtonView = UIImageView()
    
    var presenter: ChatFooterPresenterProtocol!
    
    override func setup() {
        nextButtonView.isUserInteractionEnabled = true
        nextButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapNextButton)))
        
        [nextButtonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        NSLayoutConstraint.activate([
            nextButtonView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    @objc private func didTapNextButton(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapNextButton()
    }
}

extension ChatFooterView: ChatFooterViewProtocol {
    func set(appearance: ChatBottomViewAppearance) {
        nextButtonView.image = .init(imageLiteralResourceName: appearance.nextButtonImageName)
    }
}
