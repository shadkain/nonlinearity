//
//  Story.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct Story: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let image: String?
    let storyPath: String?
    let author: String?
    let genres: [String]
    let editorChoice: Bool?
    let rating: Float64?
    let views: Int?
}

struct StoryModel: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let image: String?
    let storyPath: String?
    let author: String?
    let genres: [String]?
    let editorChoice: Bool?
    let rating: Float64?
    let views: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
        case storyPath
        case author
        case genres
        case editorChoice
        case rating
        case views
            
    }
        
//    let publicationDate: Tim
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Int.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    description = try container.decode(String.self, forKey: .description)
    image = try container.decode(String.self, forKey: .image)
    storyPath = try container.decode(String.self, forKey: .storyPath)
    author = try container.decode(String.self, forKey: .author)
    genres = try? container.decode([String].self, forKey: .genres)
    editorChoice = try container.decode(Bool.self, forKey: .editorChoice)
    rating = try container.decode(Float64.self, forKey: .rating)
    views = try container.decode(Int.self, forKey: .views)
  }
}
