//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/18/24.
//

import Foundation

// MARK: - 1차 시도: 효율성 실패

//func solution(_ strs: [String], _ t: String) -> Int {
//    
//    var dp: [String: Int] = [:]
//    dp[""] = 0
//    var k: String = ""
//    for c in t {
//        k.append(c)
//        dp[k] = 20_001
//    }
//    
//    var keys: [String] = dp.keys.map { $0 }
//    keys.sort()
//    
//    for key in keys {
//        for str in strs {
//            guard key.count >= str.count else { continue }
//            
//            if key.hasSuffix(str) {
//                var prevKey = key
//                prevKey.removeLast(str.count)
//                print(key, prevKey, str)
//                dp[key]! = min(dp[key]!, dp[prevKey]! + 1)
//            }
//        }
//    }
//    
//    return dp[t] == 20_001 ? -1 : dp[t]!
//}

// MARK: - 2차 시도: 시간초과

//func solution(_ strs: [String], _ t: String) -> Int {
//    
//    let tCount = t.count
//    let tStart = t.startIndex
//    
//    var dp: [Int: Int] = [:]
//    for i in 0...tCount { dp[i] = 200000 }
//    
//    for l in stride(from: tCount-1, to: -1, by: -1) {
//        for r in stride(from: tCount, to: l, by: -1) {
//            let lp = t.index(tStart, offsetBy: l)
//            let rp = t.index(tStart, offsetBy: r)
//            let target = String(t[lp..<rp])
//            
//            if strs.contains(target) {
//                if r == tCount {
//                    dp[l] = 1
//                }
//                else {
//                    dp[l] = min(dp[l]!, dp[r]! + 1)
//                }
//            }
//        }
//    }
//    
//    return dp[0]! >= 20000 ? -1 : dp[0]!
//}


func solution(_ strs: [String], _ t: String) -> Int {
    
    let tCount = t.count
    let tStart = t.startIndex
    let strsSet = Set(strs)
    let splitT = t.map { String($0) }
    
    var dp: [Int: Int] = [:]
    for i in 0...tCount { dp[i] = 200000 }
    
    for start in stride(from: tCount, to: -1, by: -1) {
        for len in 0..<5 {
            let end = start + len + 1
            guard end <= tCount else { continue }
            
            var target = ""
            for i in start..<end {
                target += splitT[i]
            }
            
            if strsSet.contains(target) {
                if end == tCount { dp[start]! = 1 }
                else { dp[start] = min(dp[start]!, dp[end]! + 1) }
            }
        }
    }
    
    
    if dp[0]! >= 200000 { return -1 }
    else { return dp[0]! }
}

//print(solution(["app","ap","p","l","e","ple","pp"], "apple"))
