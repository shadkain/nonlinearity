//
//  Queue.swift
//  Nonlinearity
//
//  Created by Святослав Кряжев on 11.04.2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import Foundation

final class Queue<T> {
    private var head: Int = 0
    private var buffer: [T] = []
    
    var isEmpty: Bool { buffer.isEmpty }
    var count: Int { buffer.count - head }
    
    func push(_ element: T) {
        buffer.append(element)
    }
    
    func pop() -> T? {
        if buffer.isEmpty { return nil }
        
        let element = buffer[head]
        head += 1
        clearIfNeeded()
        
        
        return element
    }
    
    func clearIfNeeded() {
        if head >= buffer.count {
            buffer.removeAll()
            head = 0
        }
    }
    
    func forEachPop(_ body: (T) -> Void) {
        while !isEmpty {
            body(pop()!)
        }
    }
}


