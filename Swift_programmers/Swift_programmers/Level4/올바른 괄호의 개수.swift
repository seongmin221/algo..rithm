//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/14/23.
//

import Foundation

func solution(_ n: Int) -> Int {
    
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    dp[1][1] = 1
    
    for i in 1..<n {
        for (index, count) in dp[i].enumerated() {
            guard count != 0 else { continue }
            for j in 1..<index+2 {
                dp[i+1][j] += count
            }
        }
    }
    
    return dp.last!.reduce(0, { $0 + $1 })
}

// MARK: - 2차 시도: 마지막만 시간 초과

//func solution(_ n: Int) -> Int {
//    
//    var treeSet: Set<[Int: [Int]]> = Set()
//    treeSet.insert([1: [1]])
//    
//    var tempTreeSet: Set<[Int: [Int]]> = Set()
//    
//    for _ in 0..<n-1 {
//        while !treeSet.isEmpty {
//            var tree = treeSet.removeFirst()
//            let treeMax = tree.keys.max()!
//            print("tree: \(tree)")
//            for i in tree[treeMax]! {
//                var t = tree
//                t[treeMax+1] = [i+1]
//                tempTreeSet.insert(t)
//            }
//
//            for i in tree[treeMax]! {
//                var t = tree
//                t[treeMax]!.append(i+1)
//                tempTreeSet.insert(t)
//            }
//        }
//        treeSet = tempTreeSet
//        tempTreeSet = Set()
//    }
//    
//    print(treeSet)
//    
//    return 0
//}

//func solution(_ n: Int) -> Int {
//    
//    var treeSet: Set<[Int]> = Set([[1]])
//    var tempTreeSet: Set<[Int]> = Set()
//    
//    for _ in 0..<n-1 {
//        while !treeSet.isEmpty {
//            var tree = treeSet.removeFirst()
//            let treeMax = tree.max()!
//            
//            for (i, e) in tree.enumerated() {
//                if e == treeMax {
//                    for a in 0..<2 {
//                        var t = tree
//                        t.insert(e + a, at: i+1)
//                        tempTreeSet.insert(t)
//                    }
//                }
//                else if e == treeMax - 1 {
//                    var t = tree
//                    t.insert(treeMax, at: i+1)
//                    tempTreeSet.insert(t)
//                }
//            }
//        }
//        treeSet = tempTreeSet
//        tempTreeSet = Set()
//    }
//    
//    return treeSet.count
//}

//func solution(_ n: Int) -> Int {
//    
//    var treeSet: Set<[Int]> = Set([[1]])
//    
//    for _ in 0..<n-1 {
//        let count = treeSet.count
//        for _ in 0..<count {
//            var tree = treeSet.removeFirst()
//            let treeMax = tree.max()!
//            
//            for (i, e) in tree.enumerated() {
//                if e == treeMax {
//                    for a in 0..<2 {
//                        var t = tree
//                        t.insert(e + a, at: i+1)
//                        treeSet.insert(t)
//                    }
//                }
//                else if e == treeMax - 1 {
//                    var t = tree
//                    t.insert(treeMax, at: i+1)
//                    treeSet.insert(t)
//                }
//            }
//        }
//    }
//    
//    return treeSet.count
//}


// MARK: - 1차 시도: 실패 & 시간초과

//func solution(_ n: Int) -> Int {
//    
//    var tempTreeSet: Set<[Int]> = Set([[1]])
//    var treeSet: Set<[Int]> = Set()
//    
//    for _ in 0..<n-1 {
//        while !tempTreeSet.isEmpty {
//            var tree = tempTreeSet.removeFirst()
//            let treeMax = tree.max()! + 1
//            var val = 1
//            
//            while val <= treeMax {
//                for i in val-1..<tree.count+1 {
//                    var t = tree
//                    t.insert(val, at: i)
//                    treeSet.insert(t)
//                }
//                val += 1
//            }
//        }
//        tempTreeSet = treeSet
//        treeSet = Set()
//    }
//    
//    return tempTreeSet.count
//}

print(solution(4))
