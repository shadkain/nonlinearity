//
//  String.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 07.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

extension String {
    func width(usingFont font: UIFont) -> CGFloat {
        let size = self.size(withAttributes: [.font: font])
        return size.width
    }
}
