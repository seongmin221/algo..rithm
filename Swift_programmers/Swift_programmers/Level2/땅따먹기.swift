//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/22/24.
//

import Foundation

// MARK: - 1차 시도: 시간초과

//func solution(_ land: [[Int]]) -> Int{
//    
//    var answer = 0
//    
//    var level = 0
//    var needVisit: [Int] = [0, 1, 2, 3]
//    var visited: [Int] = []
//    
//    while !needVisit.isEmpty {
//        let index = needVisit.removeFirst()
//        
//        if visited.contains(index) { continue }
//        visited.append(index)
//    }
//    
//    func dfs(_ level: Int, index: Int, currentValue: Int) {
//        
//        if level >= land.count {
//            answer = max(answer, currentValue)
//            return
//        }
//        
//        let val = land[level][index]
//        
//        for i in 0..<4 {
//            guard i != index else { continue }
//            dfs(level + 1, index: i, currentValue: currentValue + val)
//        }
//    }
//    
//    for i in 0..<4 {
//        dfs(0, index: i, currentValue: 0)
//    }
//
//    return answer
//}


func solution(_ land: [[Int]]) -> Int{
    
    var land = land
    
    func findBestValue(from array: [Int], except e: Int) -> Int {
        var best = 0
        for i in 0..<array.count {
            guard i != e else { continue }
            best = max(best, array[i])
        }
        return best
    }
    
    for i in 1..<land.count {
        for j in 0..<4 {
            land[i][j] += findBestValue(from: land[i-1], except: j)
        }
    }
    
    return land.last!.max()!
}

//print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
