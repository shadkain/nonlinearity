//
//  Constants.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 30.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension ChatMessageUnauthoredView {
    enum spacing {
        static let commonH: CGFloat = 12
        static let msgToVBounds: CGFloat = 7
        static let timeToBottom: CGFloat = 6
        static let msgToTimeV: CGFloat = 4
    }
    
    enum fonts {
        static let message: UIFont = .systemFont(ofSize: 17, weight: .regular)
        static let time: UIFont = .systemFont(ofSize: 11, weight: .regular)
    }
    
    static let cornerRadius: CGFloat = 17
}

extension ChatMessageAuthoredView {
    enum spacing {
        static var commonH: CGFloat { ChatMessageUnauthoredView.spacing.commonH }
        static let authorToMsgV: CGFloat = 2
        static let authorToTop: CGFloat = 7
    }
    
    enum fonts {
        static let author: UIFont = .systemFont(ofSize: 13, weight: .regular)
    }
    
    static var cornerRadius: CGFloat { ChatMessageUnauthoredView.cornerRadius }
}
