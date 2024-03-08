//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/8/24.
//

import Foundation

struct Node {
    let duration: Int
    let start: Int
}

struct MinHeap {
    var elements: [Node] = [.init(duration: -1, start: -1)]
    
    var count: Int { elements.count }
    var isEmpty: Bool { elements.count == 1 }
}

extension MinHeap {
    
    mutating func insert(node: Node) {
        // 아래에서 위로
        elements.append(node)
        var child = count - 1
        var parent = child / 2
        
        while elements[child].duration < elements[parent].duration {
            elements.swapAt(child, parent)
            child = parent
            parent = child / 2
        }
    }
    
    mutating func pop() -> Node {
        elements.swapAt(1, count - 1)
        let minimum = elements.removeLast()
        
        var parent = 1
        while true {
            var lc = parent * 2
            var rc = parent * 2 + 1
            
            if lc >= count { break }
            else if lc == count && elements[parent].duration < elements[lc].duration {
                elements.swapAt(parent, lc)
                parent = lc
                continue
            }
            else if rc <= count {
                if elements[parent].duration > elements[lc].duration
                    && elements[parent].duration > elements[rc].duration {
                    if elements[lc].duration < elements[rc].duration {
                        elements.swapAt(parent, lc)
                        parent = lc
                    } else {
                        elements.swapAt(parent, rc)
                        parent = rc
                    }
                    continue
                }
                else if elements[parent].duration > elements[lc].duration
                            && elements[parent].duration <= elements[rc].duration {
                    elements.swapAt(parent, lc)
                    parent = lc
                    continue
                }
                else if elements[parent].duration <= elements[lc].duration
                            && elements[parent].duration > elements[rc].duration {
                    elements.swapAt(parent, rc)
                    parent = rc
                    continue
                }
            }
        }
        
        return minimum
    }
}


func solution(_ jobs: [[Int]]) -> Int {
    
    let jobs: [Node] = jobs.map { .init(duration: $0[1], start: $0[0]) }
    var heap: MinHeap = .init()
    
    for job in jobs {
        heap.insert(node: job)
    }
    
    
    var currentTime: Int = 0
    var currentJob: Node?
    
    while heap.isEmpty {
        if currentJob == nil { currentJob = heap.pop() }
        
        
    }
    
    
    return 0
}

print(solution([[0, 3], [1, 9], [2, 6]]))
