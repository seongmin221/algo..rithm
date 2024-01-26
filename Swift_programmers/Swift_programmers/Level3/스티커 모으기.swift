//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/22/24.
//

import Foundation

func solution(_ sticker:[Int]) -> Int{
    
    switch sticker.count {
        case 1, 2, 3: return sticker.max()!
        default: break
    }
    
    var count = sticker.count
    var firstRemovedDP: [Int] = Array(repeating: 0, count: count)
    firstRemovedDP[0] = sticker[0]
    firstRemovedDP[1] = sticker[0]
    for i in 2..<count-1 {
        firstRemovedDP[i] = max(firstRemovedDP[i-1], firstRemovedDP[i-2] + sticker[i])
    }
    
    var secondRemovedDP: [Int] = Array(repeating: 0, count: count)
    secondRemovedDP[0] = 0
    secondRemovedDP[1] = sticker[1]
    for i in 2..<count {
        secondRemovedDP[i] = max(secondRemovedDP[i-1], secondRemovedDP[i-2] + sticker[i])
    }
    
    return max(firstRemovedDP.max()!, secondRemovedDP.max()!)
}

//print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
