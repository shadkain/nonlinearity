//
//  AuthoredView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol MessageAuthoredViewProtocol: class {
    var unauthored: MessageUnauthoredViewProtocol { get }
    
    func set(author: String)
    func set(role: MessageRole?)
    func set(appearance: MessageAppearance)
}

final class MessageAuthoredView: UIViewComponent {
    let unauthoredView = MessageUnauthoredView()
    let authorLabel = UILabel()
    private var _appearance: MessageAppearance!
    
    override func setup() {
        authorLabel.textAlignment = .left
        authorLabel.numberOfLines = 1
        
        [unauthoredView, authorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        let viewConstraint = trailingAnchor.constraint(greaterThanOrEqualTo: authorLabel.trailingAnchor, constant: 12)
        viewConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: unauthoredView.leftAnchor),
            topAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -7),
            rightAnchor.constraint(equalTo: unauthoredView.rightAnchor),
            bottomAnchor.constraint(equalTo: unauthoredView.bottomAnchor),
            unauthoredView.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            unauthoredView.messageLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2),
            authorLabel.leadingAnchor.constraint(equalTo: unauthoredView.messageLabel.leadingAnchor),
            viewConstraint,
        ])
    }
}

extension MessageAuthoredView: MessageView {
    var appearance: MessageAppearance {
        _appearance
    }
    var maxWidth: CGFloat {
        get { unauthoredView.maxWidth }
        set { unauthoredView.maxWidth = newValue }
    }
}

extension MessageAuthoredView: MessageAuthoredViewProtocol {
    var unauthored: MessageUnauthoredViewProtocol {
        self.unauthoredView
    }
    
    func set(author: String) {
        authorLabel.text = author
    }
    
    func set(appearance: MessageAppearance) {
        _appearance = appearance
        
        layer.cornerRadius = appearance.viewCornerRadius
        
        authorLabel.font = appearance.authorFont
        authorLabel.textColor = appearance.authorTextColor
    }
}
