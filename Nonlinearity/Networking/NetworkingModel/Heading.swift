//
//  Heading.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 01.06.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct Headings: Codable {
    let headings: [Rubric]
    
    enum CodingKeys: String, CodingKey {
        case headings
    }
    
    init(from decoder: Decoder) throws {
         let container = try decoder.container(keyedBy: CodingKeys.self)
         headings = try container.decode([Rubric].self, forKey: .headings)
       }
}

