//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/22.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var lastOfBest: [Int] = []
    var resultScore: [Int] = []
    
    for n in score {
        if lastOfBest.count < k {
            lastOfBest.append(n)
        } else {
            if lastOfBest.last! < n {
                lastOfBest[k-1] = n
            }
        }
        lastOfBest = lastOfBest.sorted(by: >)
        resultScore.append(lastOfBest.last!)
    }
    return resultScore
}

print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))


//k    score    result
//3    [10, 100, 20, 150, 1, 100, 200]    [10, 10, 10, 20, 20, 100, 100]
//4    [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]    [0, 0, 0, 0, 20, 40, 70, 70, 150, 300]
