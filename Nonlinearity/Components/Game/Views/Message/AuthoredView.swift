//
//  AuthoredView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

protocol ChatMessageAuthoredViewProtocol: class {
    var unauthoredView: ChatMessageUnauthoredViewProtocol { get }
    
    func set(author: String)
    func set(role: Chat.Message.Role?)
    func set(appearance: ChatMessageAppearance)
}

final class ChatMessageAuthoredView: UIViewComponent {
    let unauthoredSubview = ChatMessageUnauthoredView()
    let authorLabel = UILabel()
    private(set) var appearance: ChatMessageAppearance!
    
    override func setup() {
        authorLabel.textAlignment = .left
        authorLabel.numberOfLines = 1
        
        [unauthoredSubview, authorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        let viewConstraint = rightAnchor.constraint(greaterThanOrEqualTo: authorLabel.rightAnchor, constant: 12)
        viewConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: unauthoredSubview.leftAnchor),
            topAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -7),
            rightAnchor.constraint(equalTo: unauthoredSubview.rightAnchor),
            bottomAnchor.constraint(equalTo: unauthoredSubview.bottomAnchor),
            unauthoredSubview.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            unauthoredSubview.messageLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 2),
            authorLabel.leadingAnchor.constraint(equalTo: unauthoredSubview.messageLabel.leadingAnchor),
            viewConstraint,
        ])
    }
}

extension ChatMessageAuthoredView: ChatMessageView, ChatMessageAuthoredViewProtocol {
    var maxWidth: CGFloat {
        get { unauthoredSubview.maxWidth }
        set { unauthoredSubview.maxWidth = newValue }
    }
    
    var unauthoredView: ChatMessageUnauthoredViewProtocol {
        unauthoredSubview
    }
    
    func set(author: String) {
        authorLabel.text = author
    }
    
    func set(appearance: ChatMessageAppearance) {
        self.appearance = appearance
        
        layer.cornerRadius = appearance.viewCornerRadius
        
        authorLabel.font = appearance.authorFont
        authorLabel.textColor = appearance.authorTextColor
    }
}
