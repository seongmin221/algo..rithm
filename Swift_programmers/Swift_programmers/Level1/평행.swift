//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/20.
//

import Foundation

func solution(_ dots:[[Int]]) -> Int {
    var modDots = dots
    var lastDot = modDots.popLast()!
    for i in 0..<3 {
        var compDots = modDots
        compDots.remove(at: i)
        if (modDots[i][1] == lastDot[1] && modDots[i][0] == lastDot[0]) || (modDots[i][1] - lastDot[1]) * (compDots[0][0] - compDots[1][0]) == (compDots[0][1] - compDots[1][1]) * (modDots[i][0] - lastDot[0]) {
            return 1
        }
    }
    return 0
}

print(solution([[1, 4], [9, 2], [3, 8], [11, 6]]))
