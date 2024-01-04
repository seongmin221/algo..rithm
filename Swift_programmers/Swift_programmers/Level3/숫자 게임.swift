//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/3/24.
//

import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {
    
    var a = a.sorted()
    var b = b.sorted()
    let count = a.count
    
    var result = 0
    var ai = 0
    var bi = 0
    
    while bi < count && ai < count {
        if a[ai] < b[bi] {
            result += 1
            ai += 1
            bi += 1
        }
        else if a[ai] >= b[bi] {
            bi += 1
        }
    }
    
    return result
}

//print(solution([5,1,3,7], [2,2,6,8]))
//print(solution([2,2,2,2], [1,1,1,1]))
//print(solution([1,2,4,4,5,6,7,8], [3,4,4,5,4,4,4,4]))
