//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/16/24.
//

import Foundation


// MARK: - 1차 시도: 8,9,12~20 시간초과

//func solution(_ sequence: [Int]) -> Int64 {
//    
//    let count = sequence.count
//    var signedSeq = sequence
//    var sign = 1
//    for i in 0..<count {
//        signedSeq[i] *= sign
//        sign *= -1
//    }
//    
//    var absMax: Int = 0
//    var rec: [[Int]] = Array(repeating: Array(repeating: 0, count: count+1), count: count+1)
//    for i in 0..<count {
//        for j in i..<count {
//            rec[i][j+1] = rec[i][j] + signedSeq[j]
//            absMax = max(absMax, abs(rec[i][j+1]))
//        }
//    }
//    
//    return Int64(absMax)
//}



//func solution(_ sequence: [Int]) -> Int64 {
//    
//    let count = sequence.count
//    var signedSeq = sequence
//    var sign = 1
//    for i in 0..<count {
//        signedSeq[i] *= sign
//        sign *= -1
//    }
//    
//    print(signedSeq)
//    
//    var reduced: [Int] = []
//    var isLast = false
//    var s = 0
//    while !isLast {
//        var prev = 0
//        var sum = 0
//        
//        for i in s..<count {
//            let num = signedSeq[i]
//            if num * prev < 0 {
//                s = i
//                reduced.append(sum)
//                sum = 0
//                break
//            }
//            
//            sum += num
//            prev = num
//            
//            if i == count-1 {
//                isLast = true
//                reduced.append(sum)
//            }
//        }
//    }
//    
//    
//    
//    return Int64()
//}

//func solution(_ sequence: [Int]) -> Int64 {
//    
//    let count = sequence.count
//    var signedSeq = sequence
//    var sign = 1
//    for i in 0..<count {
//        signedSeq[i] *= sign
//        sign = -sign
//    }
//    
//    var dp: [Int] = Array(repeating: 0, count: count)
//    dp[0] = signedSeq[0]
//    for i in 1..<count {
//        if abs(dp[i-1] + signedSeq[i]) > abs(signedSeq[i]) {
//            dp[i] = dp[i-1] + signedSeq[i]
//        } else {
//            dp[i] = signedSeq[i]
//        }
//    }
//    
//    dp += signedSeq
//    print(dp)
//    
//    var absMax = 0
//    for num in dp {
//        absMax = max(absMax, abs(num))
//    }
//    
//    return Int64(absMax)
//}

func solution(_ sequence: [Int]) -> Int64 {
    
    let count = sequence.count
    
    var signedSeq1: [Int] = sequence
    var signedSeq2: [Int] = sequence
    var sign1 = 1
    var sign2 = -1
    for i in 0..<count {
        signedSeq1[i] *= sign1
        signedSeq2[i] *= sign2
        sign1 *= -1
        sign2 *= -1
    }
    
    func runDP(_ seq: [Int]) -> [Int] {
        var dp: [Int] = Array(repeating: 0, count: seq.count)
        dp[0] = seq[0]
        
        for i in 1..<seq.count { dp[i] = max(dp[i-1] + seq[i], seq[i]) }
        return dp
    }
    
    var dp1: [Int] = runDP(signedSeq1)
    var dp2: [Int] = runDP(signedSeq2)
    
    return Int64(max(dp1.max()!, dp2.max()!))
}

//print(solution([2, 3, -6, 1, 3, -1, 2, 4]))
//print(solution([6, -7, 16, 3, -4]))
//print(solution([2, 3, 6, 1 ,5, 7]))
