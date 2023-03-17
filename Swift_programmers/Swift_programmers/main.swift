//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/15.
//

import Foundation

func solution(_ array: [Int]) -> Int {
    var cnt = Dictionary<Int, Int>()
    if cnt.count == 1 {
        return cnt.keys.first!
    }
    for num in array {
        if cnt.keys.contains(num) {
            cnt[num]! += 1
        } else {
            cnt[num] = 1
        }
    }
    let maxCnt = cnt.values.max()
    if cnt.filter({ $0.value == maxCnt }).count == 1{
        return cnt.first(where: { $1 == maxCnt })!.key
    } else {
        return -1
    }
}

print(solution([1, 2, 3, 3, 3, 4]))
