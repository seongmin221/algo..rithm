//
//  main.swift
//  SOPT_Algorithm_Study
//
//  Created by 이성민 on 10/25/23.
//

import Foundation

func solution(_ n:Int) -> [[Int]] {
    var order = [[Int]]()
    
    func hanoi(from: Int, to: Int, other: Int, count: Int) {
        if count == 1 { order.append([from, to]) }
        else {
            hanoi(from: from, to: other, other: to, count: count - 1)
            order.append([from, to])
            hanoi(from: other, to: to, other: from, count: count - 1)
        }
    }
    
    hanoi(from: 1, to: 3, other: 2, count: n)
    
    return order
}
