//
//  2631-줄세우기.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/7/24.
//

import Foundation

//func placeInLine() -> Int {
//    let n = Int(readLine()!)!
//
//    var nums: [Int] = []
//    for _ in 0..<n { nums.append(Int(readLine()!)!) }
//
//    var memo: [[Int]] = .init(repeating: [], count: n)
//
//    for i in 0..<n {
//        let origin: Int = nums[i]
//
//        var minDiff: Int = .max
//        for j in i+1..<n {
//            let other : Int = nums[j]
//            if minDiff > other - origin && other - origin > 0 {
//                minDiff = other - origin
//                memo[i].append(j)
//            }
//        }
//    }
//
//    var temp: Int = .min
//    func recur(_ index: Int, _ count: Int) {
//        for i in memo[index] {
//            recur(i, count+1)
//        }
//        temp = max(temp, count)
//    }
//
//    for i in 0..<n {
//        recur(i, 1)
//    }
//
//    return n - temp
//}

func placeInLine() -> Int {
    
    let n = Int(readLine()!)!
    
    var nums: [Int] = []
    for _ in 0..<n { nums.append(Int(readLine()!)!) }
    
    var memo: [Int] = .init(repeating: 1, count: n)
    for i in 0..<n {
        for j in 0..<i {
            if nums[i] > nums[j] {
                memo[i] = max(memo[i], memo[j] + 1)
            }
        }
    }
    
    return n - memo.max()!
}

//print(placeInLine())
