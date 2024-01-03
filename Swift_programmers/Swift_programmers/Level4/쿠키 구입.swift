//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/2/24.
//

import Foundation

func solution(_ cookie: [Int]) -> Int {
    
    let cCount = cookie.count
    var result = 0
    
    for m in 0..<cCount - 1 {
        var l = m
        var r = m + 1
        var lSum = cookie[l]
        var rSum = cookie[r]
        while true {
            if lSum < rSum {
                if l <= 0 { break }
                l -= 1
                lSum += cookie[l]
            }
            else if lSum > rSum {
                if r >= cCount-1 { break }
                r += 1
                rSum += cookie[r]
            }
            else {
                result = max(result, lSum)
                if m - l > cCount - r {
                    if l <= 0 { break } else { l -= 1 }
                    lSum += cookie[l]
                }
                else {
                    if r >= cCount-1 { break } else { r += 1 }
                    rSum += cookie[r]
                }
            }
        }
    }
    
    return result
}

//print(solution([1,1,2,3]))
//print(solution([1,2,4,5]))

print(solution([1,1,1,1,1,1,1,1]))
// -> 1, 1 에서 끝나는게 아니라 더 갈 수 있음


// MARK: - 1, 2차 시도: 시간초과: 9, 23, 26

//func solution(_ cookie: [Int]) -> Int {
//    
//    var result = 0
//    var cCount = cookie.count
//    
//    for m in 0..<cCount - 1 {
//        var lSum: [Int] = .init(repeating: 0, count: m+2)
//        for l in Array(0...m).reversed() {
//            lSum[l] = lSum[l+1] + cookie[l]
//        }
//        var rSum = 0
//        for r in m+1..<cCount {
//            rSum += cookie[r]
//            if lSum.contains(rSum) {
//                result = max(result, rSum)
//            }
//        }
//    }
//    
//    return result
//}
//
//print(solution([1,1,2,3]))


//func solution(_ cookie: [Int]) -> Int {
//    
//    var possibleResult: [Int] = []
//    
//    for m in 0..<cookie.count {
//        for l in 0...m {
//            let lSon = cookie[l...m].reduce(0, { $0 + $1 })
//            var rSon = 0
//            for r in m+1..<cookie.count {
//                rSon += cookie[r]
//                if rSon > lSon { break }
//                if rSon == lSon { possibleResult.append(rSon) }
//            }
//        }
//    }
//    
//    return possibleResult.max() ?? 0
//}
//
//print(solution([1,1,2,3]))
