//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/22/24.
//

import Foundation

func solution(_ elements: [Int]) -> Int {
    
    let count = elements.count
    
    var set: Set<Int> = Set(elements)
    
    for k in 1..<count {
        var i1 = 0
        var i2 = k
        
        var sum = elements[i1...i2].reduce(0, { $0 + $1 })
        set.insert(sum)
        
        while i1 != count {
            i1 += 1
            sum -= elements[i1 - 1]
            
            i2 = (i2 + 1) % count
            sum += elements[i2]
            
            set.insert(sum)
        }
    }
    
    return set.count
}

//print(solution([7, 9, 1, 1, 4]))
