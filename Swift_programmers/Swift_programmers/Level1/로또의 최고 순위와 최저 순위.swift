//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/24.
//

import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var maxCnt = 0
    var minCnt = 0
    for lotto in lottos {
        if lotto == 0 {
            maxCnt += 1
            continue
        } else if win_nums.contains(lotto) {
            maxCnt += 1
            minCnt += 1
        }
    }
    return [7 - maxCnt >= 7 ? 6 : 7 - maxCnt, 7 - minCnt >= 7 ? 6 : 7 - minCnt]
}

print(solution([5, 4, 3, 20, 3, 9], [31, 10, 45, 1, 6, 19]))


//lottos    win_nums    result
//[44, 1, 0, 0, 31, 25]    [31, 10, 45, 1, 6, 19]    [3, 5]
//[0, 0, 0, 0, 0, 0]    [38, 19, 20, 40, 15, 25]    [1, 6]
//[45, 4, 35, 20, 3, 9]    [20, 9, 3, 45, 4, 35]    [1, 1]
