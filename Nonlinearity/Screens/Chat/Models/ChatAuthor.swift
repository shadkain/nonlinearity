//
//  ChatAuthor.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 22.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

final class ChatAuthor {
    var name: String
    var surname: String?
    var colors: Colors
    
    init(name: String, surname: String?, colors: Colors) {
        self.name = name
        self.surname = surname
        self.colors = colors
    }
    
    var fullName: String {
        guard let surname = surname else {
            return name
        }
        
        return "\(name) \(surname)"
    }
    
    var initials: String {
        guard let surname = surname else {
            return "\(name.first!)"
        }
        
        return "\(name.first!)\(surname.first!)"
    }
}

extension ChatAuthor {
    struct Colors {
        var first: Color
        var second: Color
    }
}
