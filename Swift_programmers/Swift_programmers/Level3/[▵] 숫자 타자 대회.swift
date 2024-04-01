//
//  [▵] 숫자 타자 대회.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/1/24.
//

import Foundation

//func solution(_ numbers: String) -> Int {
//
//    let dist: [[Int]] = [
//        [1,7,6,7,5,4,5,3,2,3], // 0에서
//        [7,1,2,4,2,3,5,4,5,6], // 1에서
//        [6,2,1,2,3,2,3,5,4,5], // 2에서
//        [7,4,2,1,5,3,2,6,5,4], // 3에서
//        [5,2,3,5,1,2,4,2,3,5], // 4에서
//        [4,3,2,3,2,1,2,3,2,3], // 5에서
//        [5,5,3,2,4,2,1,5,3,2], // 6에서
//        [3,4,5,6,2,3,5,1,2,4], // 7에서
//        [2,5,4,5,3,2,3,2,1,2], // 8에서
//        [3,6,5,4,5,3,2,4,2,1], // 9에서
//    ]
//    let numbers: [Int] = numbers.map { Int(String($0))! }
//
//    var needVisit: [(lt: Int, rt: Int, offset: Int)] = [(4, 6, 0)]
//    for num in numbers {
//
//        var newNeedVisit: [(lt: Int, rt: Int, offset: Int)] = []
//        for state in needVisit {
//            print(state)
//            if state.lt == num {
//                newNeedVisit += [(num, state.rt, state.offset + 1)]
//                continue
//            }
//
//            if state.rt == num {
//                newNeedVisit += [(state.lt, num, state.offset + 1)]
//                continue
//            }
//
//            newNeedVisit += [
//                (num, state.rt, state.offset + dist[state.lt][num]),
//                (state.lt, num, state.offset + dist[state.rt][num])
//            ]
//        }
//
//        needVisit = newNeedVisit
//    }
//
//    let result = needVisit
//        .map { $0.offset }
//        .min()!
//
//    return result
//}



func solution(_ numbers: String) -> Int {
    
    let dist: [[Int]] = [
        [1,7,6,7,5,4,5,3,2,3], // 0에서
        [7,1,2,4,2,3,5,4,5,6], // 1에서
        [6,2,1,2,3,2,3,5,4,5], // 2에서
        [7,4,2,1,5,3,2,6,5,4], // 3에서
        [5,2,3,5,1,2,4,2,3,5], // 4에서
        [4,3,2,3,2,1,2,3,2,3], // 5에서
        [5,5,3,2,4,2,1,5,3,2], // 6에서
        [3,4,5,6,2,3,5,1,2,4], // 7에서
        [2,5,4,5,3,2,3,2,1,2], // 8에서
        [3,6,5,4,5,3,2,4,2,1], // 9에서
    ]
    
    let numbers: [Int] = numbers.map { Int(String($0))! }
    var dp: [[[Int]]] = .init(repeating: .init(repeating: .init(repeating: 1000000, count: 10), count: 10),
                              count: numbers.count)
    
    func iterate(idx: Int, lt: Int, rt: Int) -> Int {
        if idx == numbers.count { return 0 }
        
        let dest = numbers[idx]
        if dp[idx][lt][rt] == .max {
            var lMove: Int = .max
            var rMove: Int = .max
            if dest != lt {
                lMove = dist[lt][dest] + iterate(idx: idx + 1, lt: dest, rt: rt)
            }
            if dest != rt {
                rMove = dist[rt][dest] + iterate(idx: idx + 1, lt: lt, rt: dest)
            }
            
            dp[idx][lt][rt] = min(lMove, rMove)
        }
        
        return dp[idx][lt][rt]
    }
    
    return iterate(idx: 0, lt: 4, rt: 6)
}

//print(solution("1756"))
