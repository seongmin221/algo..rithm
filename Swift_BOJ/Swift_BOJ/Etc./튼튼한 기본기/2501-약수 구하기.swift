//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/3/23.
//

import Foundation

func solution() -> Int {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0]
    var k = input[1]
    var result = 0
    
    guard 2 * sqrt(Double(n)) > Double(k) else { return 0 }
    
    Array(1...n).forEach { num in
        if n.isMultiple(of: num) {
            k -= 1
            
            if k == 0 {
                result = num
            }
        }
    }
    return result
}

print(solution())

