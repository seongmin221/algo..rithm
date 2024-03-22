//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/21/24.
//

import Foundation

struct Queue<T> {
    private var elements: [T?] = []
    private var head: Int = 0
    
    var isEmpty: Bool { elements.isEmpty }
    
    init(elements: [T?] = [], head: Int = 0) {
        self.elements = elements
        self.head = head
    }
}

extension Queue {
    mutating func enqueue(arr: [T]) {
        self.elements += arr
    }
    
    mutating func dequeue() -> T? {
        guard head < elements.count, let element = elements[head] else { return nil }
        elements[head] = nil
        head += 1
        
        return element
    }
}



func solution(_ n: Int, _ edges: [[Int]]) -> Int {
    
    var tree: [Int: [Int]] = [:]
    for i in 1...n { tree[i] = [] }
    for edge in edges {
        tree[edge[0]]!.append(edge[1])
        tree[edge[1]]!.append(edge[0])
    }
    
    
    func findFarthestLeaves(from root: Int) -> (leaves: [Int], dist: Int) {
        var leaves: [Int] = []
        var maxDist: Int = 0
        
        var visitQueue: Queue<Int> = .init(elements: [root])
        var distQueue: Queue<Int> = .init(elements: [0])
        var visited: Set<Int> = []
        
        while true {
            guard let node = visitQueue.dequeue(),
                  let dist = distQueue.dequeue()
            else { break }
            
            if visited.contains(node) { continue }
            visited.insert(node)
            
            if tree[node]!.count == 1 && visited.contains(tree[node]![0]) { // leaf
                if maxDist < dist {
                    maxDist = dist
                    leaves = [node]
                }
                else if maxDist == dist {
                    leaves.append(node)
                }
            }
            else {
                visitQueue.enqueue(arr: tree[node]!)
                distQueue.enqueue(arr: .init(repeating: dist + 1, count: tree[node]!.count))
            }
        }
        
        return (leaves, maxDist)
    }
    
    
    let (leaves, _) = findFarthestLeaves(from: 1)
    let (endPoints, diameter) = findFarthestLeaves(from: leaves.first!)
    
    if endPoints.count >= 2 { return diameter }
    else {
        if leaves.count >= 2 { return diameter }
        else { return diameter - 1 }
    }
}


//print(solution(5, [[1,5],[2,5],[3,5],[4,5]]))
