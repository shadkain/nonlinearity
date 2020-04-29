//
//  HeaderModel.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 29.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

extension Chat {
    struct Header {
        var companion: Author
        var networkStatus: NetworkStatus
    }
}

extension Chat.Header {
    enum NetworkStatus {
        case online, offline
        
        var string: String {
            switch self {
            case .online:
                return "в сети"
            case .offline:
                return "не в сети"
            }
        }
    }
}
