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
    let stories: [Story]
}
