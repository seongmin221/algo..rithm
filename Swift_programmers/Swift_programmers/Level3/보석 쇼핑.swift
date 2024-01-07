//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/5/24.
//

import Foundation

func solution(_ gems: [String]) -> [Int] {
    
    let types = Set(gems)
    if types.count == 1 { return [1,1] }
    
    var possibleRange: [[Int]] = []
    var s = 0
    var e = 0
    var map: [String: Int] = [:]
    map[gems[0]] = 1
    
    while s <= e && e < gems.count {
        if map.count == types.count {
            possibleRange.append([s+1, e+1])
            if map[gems[s]] == 1 { map[gems[s]] = nil }
            else { map[gems[s]]! -= 1 }
            s += 1
        }
        else {
            if e < gems.count - 1 { e += 1 }
            else { break }
            
            if map[gems[e]] == nil { map[gems[e]] = 1 }
            else { map[gems[e]]! += 1 }
        }
//        print(s, gems[s], e, gems[e])
//        print(map)
//        print("---")
    }
    
    possibleRange.sort(by: {
        let firstLength = $0[1] - $0[0]
        let secondLength = $1[1] - $1[0]
        if firstLength < secondLength { return true }
        else { return false }
    })
    
    return possibleRange.first!
}

//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3,7]
//print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1,3]
//print(solution(["ZZZ", "YYY", "NNNN", "BBB"])) // [1,5]
//print(solution(["A"]))
//print(solution(["A","B","B","B","B","B","B","C","B","A"]))

// MARK: - 2차 시도: 효율성 실패

//func solution(_ gems: [String]) -> [Int] {
//    
//    let gemTypes = Set(gems)
//    let gemTypeCount = gemTypes.count
//    if gemTypeCount == 1 { return [1,1] }
//    
//    var possibleRange: [[Int]] = []
//    var s = 0
//    var e = 0
//    while true {
//        guard s - e + 1 <= gemTypeCount && e < gems.count else { break }
//        
//        let collected = gems[s...e]
//        if e - s + 1 == gemTypeCount && Set(collected) == gemTypes {
//            return [s+1, e+1]
//        }
//        
//        if Set(collected) == gemTypes {
//            possibleRange.append([s+1, e+1])
//            s += 1
//        }
//        else { e += 1 }
//    }
//    
//    possibleRange.sort(by: {
//        let firstLength = $0[1] - $0[0]
//        let secondLength = $1[1] - $1[0]
//        if firstLength < secondLength { return true }
//        else { return false }
//    })
//    
//    return possibleRange.first!
//}
//
//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3,7]
//print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1,3]
//print(solution(["ZZZ", "YYY", "NNNN", "BBB"])) // [1,5]
//print(solution(["A"]))
//print(solution(["A","B","B","B","B","B","B","C","B","A"]))

//func solution(_ gems: [String]) -> [Int] {
//    
//    let gemTypes = Set(gems)
//    let gemTypeCount = gemTypes.count
//    if gemTypeCount == 1 { return [1, 1] }
//    
//    var possibleRange: [[Int]] = []
//    
//    var s = 0
//    var e = s + gemTypeCount - 1
//    while true {
//        guard s <= gems.count - gemTypeCount else { break }
//        guard e < gems.count else {
//            s += 1
//            e = s + gemTypeCount - 1
//            continue
//        }
//        
//        let curSet = Set(gems[s...e])
//        if curSet == gemTypes {
//            if e - s == gemTypeCount - 1 { return [s+1,e+1] }
//            possibleRange.append([s+1,e+1])
//            s += 1
//            e = s + gemTypeCount - 1
//            continue
//        }
//        e += 1
//    }
//    
//    possibleRange.sort(by: {
//        if $0.count < $1.count { return true }
//        else if $0.count == $1.count {
//            return $0[0] < $1[1]
//        }
//        else { return false }
//    })
//    
//    return possibleRange.first!
//}
//
//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])) // [3,7]
//print(solution(["AA", "AB", "AC", "AA", "AC"])) // [1,3]
//print(solution(["ZZZ", "YYY", "NNNN", "BBB"])) // [1,5]
//print(solution(["A"]))
//print(solution(["A","B","B","B","B","B","B","C","B","A"]))


// MARK: - 1차 시도: 틀림 / 시간초과

//func solution(_ gems: [String]) -> [Int] {
//    
//    let gemTypes = Set(gems)
//    if gemTypes.count == 1 { return [1,1] }
//    
//    var startType = gems[0]
//    var collected = Set([startType])
//    
//    var start = 0
//    var end = 0
//    while collected != gemTypes {
//        collected.insert(gems[start])
//        for i in start+1..<gems.count {
//            if gems[start] == gems[i] {
//                collected = Set()
//                start += 1
//                break
//            }
//            
//            collected.insert(gems[i])
//            end = i
//            if collected == gemTypes { break }
//        }
//    }
//    
//    return [start + 1, end + 1]
//}
//
//print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
//print(solution(["AA", "AB", "AC", "AA", "AC"]))
//print(solution(["ZZZ", "YYY", "NNNN", "BBB"]))
//print(solution(["A","A","A","A","B","B","B","B"]))
//print(solution(["A","B","B","B","B","B","B","C","B","A"]))
//
