//
//  쌍둥이 빌딩 숲.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

/// 1부터 n까지 각각 2 채씩 총 `2n`채의 빌딩이 존재
/// `같은 높이를 가지는 빌딩 사이에는 그보다 높은 빌딩이 존재하지 않습니다.`
/// `count` 채의 빌딩이 구분되어 보였습니다.

/// `n`과 `count`가 주어졌을 때, `빌딩들이 배치될 수 있는 방법의 수`를 return

//func solution(_ n: Int, _ count: Int) -> Int {
//
//    let reducer = 1000000007
//
//    var combination: [Int: [Int]] = [:]
//    var countDict: [Int: [Int]] = [:]
//    for i in 1...n {
//        combination[i] = .init(repeating: 0, count: i + 1)
//        countDict[i] = .init(repeating: 0, count: i + 1)
//    }
//    combination[0] = [0]
//    combination[1] = [1, 1]
//    countDict[0] = [0, 1]
//    countDict[1] = [0, 1]
//    countDict[2] = [0, 2, 1]
//
//    func calcCombination(n: Int, k: Int) {
//        if k == n || k == 0 { combination[n]![k] = 1; return }
//        var result = combination[n-1]![k-1] + combination[n-1]![k]
//        combination[n]![k] = result % reducer
//    }
//
//    for i in 1...n {
//        for k in 0...i {
//            calcCombination(n: i, k: k)
//        }
//    }
//
//    func countSum(ofKey key: Int) -> Int {
//        return (countDict[key]!.reduce(0, { ($0 % reducer) + $1 }) % reducer)
//    }
//
//    for blockCount in 3...n {
//        let n = blockCount
//
//        var singleSeen = 0
//        for i in 0...n-1 {
//            singleSeen += (combination[n-1]![i] % reducer)
//            * countSum(ofKey: i)
//            * countSum(ofKey: n-1-i)
//            singleSeen %= reducer
//        }
//        countDict[n]![1] = singleSeen
//        countDict[n]![n] = 1
//
//        for visible in 2...n-1 {
//            var count = 0
//            for k in visible-1...n-1 {
//                count += (combination[n-1]![k] % reducer)
//                * (countDict[k]![visible-1] % reducer)
//                * (countDict[n-k]![1] % reducer)
//                count %= reducer
//            }
//            countDict[n]![visible] = count
//        }
//    }
//
//    return countDict[n]![count]
//}

//func solution(_ n: Int, _ count: Int) -> Int {
//
//    let reducer = 1000000007
//
//    var combination: [Int: [Int]] = [:]
//    var countDict: [Int: [Int]] = [:]
//    for i in 1...n {
//        combination[i] = .init(repeating: 0, count: i + 1)
//        countDict[i] = .init(repeating: 0, count: i + 1)
//    }
//    combination[0] = [0]
//    combination[1] = [1, 1]
//    countDict[0] = [0, 1]
//    countDict[1] = [0, 1]
//    countDict[2] = [0, 2, 1]
//
//    func calcCombination(n: Int, k: Int) {
//        if k == n || k == 0 { combination[n]![k] = 1; return }
//        let result = combination[n-1]![k-1] + combination[n-1]![k]
//        combination[n]![k] = result/* % reducer*/
//    }
//
//    for i in 1...n {
//        for k in 0...i {
//            calcCombination(n: i, k: k)
//        }
//    }
//
//    func countSum(ofKey key: Int) -> Int {
//        return (countDict[key]!.reduce(0, { $0 + $1 })/* % reducer*/)
//    }
//
//    for blockCount in 3...n {
//        let n = blockCount
//
//        var singleSeen = 0
//        for i in 0...n-1 {
//            singleSeen += combination[n-1]![i]
//            singleSeen *= countSum(ofKey: i)
////            singleSeen %= reducer
//            singleSeen *= countSum(ofKey: n-1-i)
////            singleSeen %= reducer
//        }
//        countDict[n]![1] = singleSeen
//        countDict[n]![n] = 1
//
//        for visible in 2...n-1 {
//            var count = 0
//            for k in visible-1...n-1 {
//                count += combination[n-1]![k]
//                count *= countDict[k]![visible-1]
////                count %= reducer
//                count *= countDict[n-k]![1]
////                count %= reducer
//            }
//            countDict[n]![visible] = count
//        }
//    }
//
//    return countDict[n]![count]
//}




func solution(_ n: Int, _ count: Int) -> Int {
    
    let reducer = 1000000007
    
    if n == 1 { return 1 }
    
    var combination: [Int: [Int]] = [:]
    var countDict: [Int: [Int]] = [:]
    for i in 1...n {
        combination[i] = .init(repeating: 0, count: i + 1)
        countDict[i] = .init(repeating: 0, count: i + 1)
    }
    combination[0] = [0]
    combination[1] = [1, 1]
    countDict[0] = [0, 1]
    countDict[1] = [0, 1]
    countDict[2] = [0, 2, 1]
    
    func calcCombination(n: Int, k: Int) {
        if k == n || k == 0 { combination[n]![k] = 1; return }
        var result = combination[n-1]![k-1] + combination[n-1]![k]
        combination[n]![k] = result % reducer
    }
    
    for i in 1...n {
        for k in 0...i {
            calcCombination(n: i, k: k)
        }
    }
    
    func countSum(ofKey key: Int) -> Int {
        return (countDict[key]!.reduce(0, { ($0 % reducer) + $1 }) % reducer)
    }
    
    for blockCount in 3...n {
        let n = blockCount
        
        var singleSeen = 0
        for i in 0...n-1 {
            singleSeen += (combination[n-1]![i] * countSum(ofKey: i) % reducer)
            * countSum(ofKey: n-1-i)
            singleSeen %= reducer
        }
        countDict[n]![1] = singleSeen
        countDict[n]![n] = 1
        
        for visible in 2...n-1 {
            var count = 0
            for k in visible-1...n-1 {
                count += (combination[n-1]![k] * countDict[k]![visible-1] % reducer)
                * (countDict[n-k]![1] % reducer)
                count %= reducer
            }
            countDict[n]![visible] = count
        }
    }
    
    return countDict[n]![count]
}


//print(solution(1, 1))

