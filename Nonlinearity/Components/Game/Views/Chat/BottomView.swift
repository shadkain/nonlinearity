//
//  BottomView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 20.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatBottomViewProtocol: class {
}

final class ChatBottomView: UIViewComponent {
    var presenter: ChatBottomPresenter!
    let nextButtonView = UIImageView()
    
    override func setup() {
        nextButtonView.isUserInteractionEnabled = true
        nextButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapNextArrow)))
        nextButtonView.image = .init(imageLiteralResourceName: "next-arrow")
        
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
    
    @objc private func didTapNextArrow(_ recognizer: UITapGestureRecognizer) {
        presenter?.didTapNextArrow()
    }
}
