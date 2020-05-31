//
//  EndPointType.swift
//  Nonlinearity
//
//  Created by Андронов Дмитрий on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation
protocol EndPointType {
    var baseURL: URL {get}
    var path : String {get}
    var httpMethod: HTTPMethod {get}
    var task: HTTPTask {get}
    var headers: HTTPHeaders? {get}
}
