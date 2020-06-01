//
//  Rubric.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct Rubric: Codable {
    let title: String
    let stories: [StoryModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case stories
    }
    
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      title = try container.decode(String.self, forKey: .title)
      stories = try container.decode([StoryModel].self, forKey: .stories)
    }
    
}
