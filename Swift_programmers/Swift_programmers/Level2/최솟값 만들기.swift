//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/8/24.
//

import Foundation

func solution(_ A: [Int], _ B: [Int]) -> Int
{
    var ans = 0

    let a = A.sorted(by: { $0 < $1 })
    let b = B.sorted(by: { $0 > $1 })
    for i in 0..<a.count {
        ans += a[i] * b[i]
    }

    return ans
}
