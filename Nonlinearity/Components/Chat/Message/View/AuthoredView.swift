//
//  AuthoredView.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 25.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit



final class ChatMessageAuthoredView: UIViewComponent, ChatMessageView {
    let unauthoredView = ChatMessageUnauthoredView()
    let authorLabel = UIGradientLabel()
    
    var maxWidth: CGFloat {
        get { unauthoredView.maxWidth }
        set { unauthoredView.maxWidth = newValue }
    }
    
    override func setup() {
        layer.cornerRadius = Self.cornerRadius
        
        authorLabel.font = fonts.author
        authorLabel.textAlignment = .left
        authorLabel.numberOfLines = 1
        
        authorLabel.startPoint = .init(x: 0.5, y: 0)
        authorLabel.endPoint = .init(x: 0.5, y: 1)
        
        [unauthoredView, authorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    override func constraint() {
        let viewConstraint = rightAnchor.constraint(greaterThanOrEqualTo: authorLabel.rightAnchor, constant: spacing.commonH)
        viewConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: unauthoredView.leftAnchor),
            topAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -spacing.authorToTop),
            rightAnchor.constraint(equalTo: unauthoredView.rightAnchor),
            bottomAnchor.constraint(equalTo: unauthoredView.bottomAnchor),
            unauthoredView.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing.commonH),
            unauthoredView.messageLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: spacing.authorToMsgV),
            authorLabel.leadingAnchor.constraint(equalTo: unauthoredView.messageLabel.leadingAnchor),
            viewConstraint,
        ])
    }
}
