//
//  CDChat+CoreDataProperties.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//
//

import Foundation
import CoreData


extension CDChat {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDChat> {
        return NSFetchRequest<CDChat>(entityName: "CDChat")
    }

    @NSManaged public var id: Int64
    @NSManaged public var jsonData: String
    @NSManaged public var title: String?

}
