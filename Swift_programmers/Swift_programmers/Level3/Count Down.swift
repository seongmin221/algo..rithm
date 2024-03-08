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
    
    var dp: [[Int]] = .init(repeating: [target, 0], count: 100001)
    for i in 1...20 {
        dp[i] = [1, 1]
        dp[i * 2] = [1, 0]
        dp[i * 3] = [1, 0]
    }
    dp[50] = [1, 1]
    
    for i in 1...target {
        for j in 1...20 {
            // single
            if i + j <= target {
                if dp[i+j][0] > dp[i][0] + 1 {
                    dp[i+j][0] = dp[i][0] + 1
                    dp[i+j][1] = dp[i][1] + 1
                }
                else if dp[i+j][0] == dp[i][0] + 1 {
                    dp[i+j][1] = max(dp[i][1] + 1, dp[i+j][1])
                }
            }
            
            // bull
            if i + 50 <= target {
                if dp[i+50][0] >= dp[i][0] + 1 {
                    dp[i+50][0] = dp[i][0] + 1
                    dp[i+50][1] = dp[i][1] + 1
                }
                else if dp[i+50][0] == dp[i][0] + 1 {
                    dp[i+50][1] = max(dp[i][1] + 1, dp[i+50][1])
                }
            }
            
            // double
            if i + 2 * j <= target {
                if dp[i+2*j][0] > dp[i][0] + 1 {
                    dp[i+2*j][0] = dp[i][0] + 1
                    dp[i+2*j][1] = dp[i][1]
                }
            }
            
            // triple
            if i + 3 * j <= target {
                if dp[i+3*j][0] > dp[i][0] + 1 {
                    dp[i+3*j][0] = dp[i][0] + 1
                    dp[i+3*j][1] = dp[i][1]
                }
            }
        }
    }
    
    return dp[target]
}

//print(solution(58))
