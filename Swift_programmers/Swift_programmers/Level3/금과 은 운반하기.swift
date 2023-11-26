//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/25/23.
//

import Foundation

func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    
    let cityCount = g.count
    
    var start = 0
    var end = Int(1e15)
    
    while start < end {
        let mid = (start + end) / 2
        
        var sum = 0
        var gold = 0
        var silver = 0
        
        for i in 0..<cityCount {
            let deliverCount = (mid - t[i]) / (2 * t[i]) + 1
            sum += min(deliverCount * w[i], g[i] + s[i])
            gold += min(deliverCount * w[i], g[i])
            silver += min(deliverCount * w[i], s[i])
        }
        
        if sum >= a + b, gold >= a, silver >= b {
            end = mid
        }
        else {
            start = mid + 1
        }
    }
    
    return Int64(start)
}

// MARK: - 2차 시도
// MARK: 추가적인 city filtering 했지만 시간초과

//func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
//
//    var gold = g
//    var silver = s
//
//    var goldNeeded = a
//    var silverNeeded = b
//
//    let cityCount = g.count
//    var time = 0
//    while goldNeeded > 0 || silverNeeded > 0 {
//        time += 1
//        
//        
//        let cities: [Int] = t.enumerated()
//            .filter { city, time in
//                guard time % (2 * t[city]) == t[city] else { return false }
//                if goldNeeded > 0 && gold[city] > 0 { return true }
//                else if silverNeeded > 0 && silver[city] > 0 { return true }
//                else { return false }
//            }
//            .map { city, time in return city }
//        
//        
//        
//        for i in cities {
//            guard time % (2 * t[i]) == t[i] else { continue }
//
//            var weight = w[i]
//            if goldNeeded > 0 && gold[i] > 0 {
//                if goldNeeded >= weight && weight >= gold[i] {
//                    goldNeeded -= gold[i]
//                    weight -= gold[i]
//                    gold[i] = 0
//                }
//                else if goldNeeded >= weight && gold[i] > weight {
//                    goldNeeded -= weight
//                    weight = 0
//                    gold[i] -= weight
//                }
//                else if weight > goldNeeded && goldNeeded >= gold[i] {
//                    goldNeeded -= gold[i]
//                    weight -= gold[i]
//                    gold[i] = 0
//                }
//                else if weight > goldNeeded && gold[i] > goldNeeded {
//                    goldNeeded = 0
//                    weight -= goldNeeded
//                    gold[i] -= goldNeeded
//                }
//            }
//
//            if silverNeeded > 0 && silver[i] > 0 {
//                if silverNeeded >= weight && weight >= silver[i] {
//                    silverNeeded -= silver[i]
//                    weight -= silver[i]
//                    silver[i] = 0
//                }
//                else if silverNeeded >= weight && silver[i] > weight {
//                    silverNeeded -= weight
//                    weight = 0
//                    silver[i] -= weight
//                }
//                else if weight > silverNeeded && silverNeeded >= silver[i] {
//                    silverNeeded -= silver[i]
//                    weight -= silver[i]
//                    silver[i] = 0
//                }
//                else if weight > silverNeeded && silver[i] > silverNeeded {
//                    silverNeeded = 0
//                    weight -= silverNeeded
//                    silver[i] -= silverNeeded
//                }
//            }
//        }
//    }
//
//    return Int64(time)
//}

// MARK: - 1차
// MARK: 시간초과

//func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
//    
//    var gold = g
//    var silver = s
//    
//    var goldNeeded = a
//    var silverNeeded = b
//    
//    let cityCount = g.count
//    var time = 0
//    while goldNeeded > 0 || silverNeeded > 0 {
//        time += 1
//        for i in 0..<cityCount {
//            guard time % (2 * t[i]) == t[i] else { continue }
//            
//            var weight = w[i]
//            if goldNeeded > 0 && gold[i] > 0 {
//                if goldNeeded >= weight && weight >= gold[i] {
//                    goldNeeded -= gold[i]
//                    weight -= gold[i]
//                    gold[i] = 0
//                }
//                else if goldNeeded >= weight && gold[i] > weight {
//                    goldNeeded -= weight
//                    weight = 0
//                    gold[i] -= weight
//                }
//                else if weight > goldNeeded && goldNeeded >= gold[i] {
//                    goldNeeded -= gold[i]
//                    weight -= gold[i]
//                    gold[i] = 0
//                }
//                else if weight > goldNeeded && gold[i] > goldNeeded {
//                    goldNeeded = 0
//                    weight -= goldNeeded
//                    gold[i] -= goldNeeded
//                }
//            }
//            
//            if silverNeeded > 0 && silver[i] > 0 {
//                if silverNeeded >= weight && weight >= silver[i] {
//                    silverNeeded -= silver[i]
//                    weight -= silver[i]
//                    silver[i] = 0
//                }
//                else if silverNeeded >= weight && silver[i] > weight {
//                    silverNeeded -= weight
//                    weight = 0
//                    silver[i] -= weight
//                }
//                else if weight > silverNeeded && silverNeeded >= silver[i] {
//                    silverNeeded -= silver[i]
//                    weight -= silver[i]
//                    silver[i] = 0
//                }
//                else if weight > silverNeeded && silver[i] > silverNeeded {
//                    silverNeeded = 0
//                    weight -= silverNeeded
//                    silver[i] -= silverNeeded
//                }
//            }
//        }
//    }
//    
//    return Int64(time)
//}

print(solution(10, 10, [100], [100], [7], [10]))
