//
//  DoubleStackQueue.swift
//  algo2
//
//  Created by YoungK on 2022/04/04.
//

import Foundation

struct DoubleStackQueue<T> {
    private var inBox: [T] = []
    private var outBox: [T] = []
    
    init() { }
    
    init(_ array: [T]) {
        self.init()
        self.inBox = array
    }
    
    var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    var count: Int {
        return inBox.count + outBox.count
    }
    
    var first: T? {
        if outBox.isEmpty {
            return inBox.first
        } else {
            return outBox.last
        }
    }
    
    var last: T? {
        if inBox.isEmpty {
            return outBox.first
        } else {
            return inBox.last
        }
    }
    
    mutating func enqueue(_ element: T) {
        inBox.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outBox.isEmpty {
            self.outBox = self.inBox.reversed()
            inBox.removeAll()
        }
        return outBox.popLast()
    }
}
