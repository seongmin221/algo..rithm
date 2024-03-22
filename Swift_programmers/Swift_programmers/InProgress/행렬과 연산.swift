//
//  행렬과 연산.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

class Deque {
    var front: [Int] = []
    var back: [Int] = []
    
    init(front: [Int], back: [Int]) {
        self.front = front
        self.back = back
    }
    
    var count: Int { front.count + back.count }
    var isEmpty: Bool { front.isEmpty && back.isEmpty }
}

extension Deque {
    func insertFront(_ e: Int) { front.append(e) }
    
    func insertBack(_ e: Int) { back.append(e) }
    
    func popFront() -> Int? {
        if let element = front.popLast() { return element }
        else { return back.removeFirst() }
    }
    
    func popLast() -> Int? {
        if let element = back.popLast() { return element }
        else { return front.removeFirst() }
    }
}

func solution(_ rc: [[Int]], _ operations: [String]) -> [[Int]] {
    
    let width: Int = rc.count
    let height: Int = rc.first!.count
    
    
    return []
}
