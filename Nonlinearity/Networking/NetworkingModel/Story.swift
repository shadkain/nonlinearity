//
//  Story.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

struct Story: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let storyPath: String
    let author: String
    let genres: [String]
    let editorChoice: Bool
    let rating: Float64
    let views: Int
//    let publicationDate: Tim
}
