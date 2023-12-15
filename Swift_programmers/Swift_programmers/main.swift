//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/14/23.
//

import Foundation

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

func solution(_ n: Int) -> Int {
    
    var treeSet: Set<[Int]> = Set([[1]])
    var tempTreeSet: Set<[Int]> = Set()
    
    for _ in 0..<n-1 {
        while !treeSet.isEmpty {
            var tree = treeSet.removeFirst()
            let treeMax = tree.max()!
            
            for (i, e) in tree.enumerated() {
                if e == treeMax {
                    for a in 0..<2 {
                        var t = tree
                        t.insert(e + a, at: i+1)
                        tempTreeSet.insert(t)
                    }
                }
                else if e == treeMax - 1 {
                    var t = tree
                    t.insert(treeMax, at: i+1)
                    tempTreeSet.insert(t)
                }
            }
        }
        treeSet = tempTreeSet
        tempTreeSet = Set()
    }
    
    return treeSet.count
}


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

print(solution(14))
