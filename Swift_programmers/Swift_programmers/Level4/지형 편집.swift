//
//  지형 편집.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/1/24.
//

import Foundation

func solution(_ land: [[Int]], _ p: Int, _ q: Int) -> Int64 {
    
    var flatLand: [Int] = land
        .flatMap { $0 }
        .sorted()
    
    var totalCount = flatLand.reduce(0, { $0 + $1 })
    let length = flatLand.count
    let maxHeight = flatLand.last!
    let minHeight = flatLand.first!
    totalCount -= length * minHeight
    
    var cost: Int = .max
    var cur: (height: Int, count: Int) = (minHeight, 0)
    var acc: (height: Int, count: Int) = (minHeight, 0)
    var added: Int = 0
    
    flatLand.append(maxHeight + 1)
    for h in flatLand {
        if cur.height == h {
            cur.count += 1
            continue
        }
        
        let heightDiff: Int = cur.height - acc.height
        let heightCount: Int = length - acc.count
        totalCount -= heightCount * heightDiff
        added += acc.count * heightDiff
        
        let temp = totalCount * q + added * p
        cost = min(cost, temp)
        
        acc.height = cur.height
        acc.count += cur.count
        cur.height = h
        cur.count = 1
    }
    
    
    return Int64(cost)
}
