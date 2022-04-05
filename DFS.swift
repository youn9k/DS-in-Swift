//
//  DFS.swift
//  algo
//
//  Created by YoungK on 2022/04/05.
//

import Foundation

var testGraph: [String : [String]] = [
    "A" : ["B", "C"],
    "B" : ["A", "D", "E"],
    "C" : ["A", "F"],
    "D" : ["B"],
    "E" : ["B"],
    "F" : ["C"],
]

// 인접 리스트 방식 graph
func DFS<T>(graph: [T : [T]],  first: T) -> [T] {
    var visitedQueue: [T] = []
    var needVisitStack: [T] = [first]
    
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }
        visitedQueue.append(node)
        needVisitStack.append(contentsOf: graph[node] ?? [])
    }
    
    return visitedQueue
}

print(DFS(graph: testGraph, first: "A"))// ["A", "C", "F", "B", "E", "D"] 
