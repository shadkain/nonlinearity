//
//  ChatStorage.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 24.05.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import CoreData

class ChatStorage {
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext = AppDelegate.shared.managedObjectContext) {
        self.context = context
    }
    
    func get(byId id: Int) throws -> CDChat? {
        let request: NSFetchRequest<CDChat> = CDChat.fetchRequest()
        request.predicate = .init(format: "id == %d", id)
        
        guard let results = try? context.fetch(request),
            results.count > 0 else { return nil }
        
        return results[0]
    }
    
    func create(_ block: (CDChat) -> Void) throws {
        block(.init(context: context))
        
        try context.save()
    }
    
    func delete(byId id: Int) {
        let request: NSFetchRequest<CDChat> = CDChat.fetchRequest()
        request.predicate = .init(format: "id == %d", id)
        
        guard let results = try? context.fetch(request),
            results.count > 0 else {
                return
        }
        
        results.forEach {
            context.delete($0)
        }
        
        try? context.save()
    }
}
