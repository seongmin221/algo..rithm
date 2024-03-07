//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/7/24.
//

import Foundation

//func solution(_ target: Int) -> [Int] {
//    
//    var dpWeight: [Int: Int] = [:]
//    var dpSpecial: [Int: Int] = [:]
//    for i in 1...target {
//        dpWeight[i] = target
//        dpSpecial[i] = 0
//    }
//    var possiblePoints: [Int: (weight: Int, special: Int)] = [:]
//    for i in 1...20 {
//        let x1: (weight: Int, special: Int) = (1, 1)
//        let x2: (weight: Int, special: Int) = (1, 0)
//        let x3: (weight: Int, special: Int) = (1, 0)
//        possiblePoints[i] = x1
//        if possiblePoints[i * 2] == nil {
//            possiblePoints[i * 2] = x2
//        }
//        if possiblePoints[i * 3] == nil {
//            possiblePoints[i * 3] = x3
//        }
//    }
//    possiblePoints[50] = (1, 1)
//    
//    for (point, (weight, special)) in possiblePoints {
//        dpWeight[point] = weight
//        dpSpecial[point] = special
//    }
//    
//    for i in 1...target {
//        for (point, (weight, special)) in possiblePoints {
//            let np = i + point
//            guard np <= target else { continue }
//            
//            if let currentWeight = dpWeight[np] {
//                if currentWeight >= dpWeight[i]! + weight {
//                    dpWeight[np] = dpWeight[i]! + weight
//                    dpSpecial[np] = max(dpSpecial[i]! + special, dpSpecial[np]!)
//                }
//            }
//        }
//    }
//    
//    return [dpWeight[target]!, dpSpecial[target]!]
//}

func solution(_ target: Int) -> [Int] {
    
    var dp: [Int: (count: Int, weight: Int)] = [:]
    for i in 1...target {
        dp[i] = (target, 0)
    }
    
    var possiblePoints: [Int: Int] = [:]
    for i in 1...20 {
        possiblePoints[i] = 1
        possiblePoints[i * 2] = 0
        possiblePoints[i * 3] = 0
    }
    possiblePoints[50] = 1
    
    for (point, weight) in possiblePoints {
        dp[point] = (1, weight)
    }
    
    for i in 1...target {
        for (point, weight) in possiblePoints {
            let np = i + point
            guard np <= target else { continue }
            let (c, w) = dp[i]!
            let (nc, nw) = dp[np]!
            if nc > c + 1 {
                dp[np] = (c + 1, w + weight)
            } else if nc == c + 1 {
                dp[np]!.weight = w + weight
            }
        }
    }
    
    return [dp[target]!.count, dp[target]!.weight]
}

print(solution(294))
