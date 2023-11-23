//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/19/23.
//

import Foundation

// MARK: - 3차

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var totalQ = queue1 + queue2
    var val = totalQ.reduce(0, { $0 + $1 }) / 2
    var moveCount = 0
    
    var f1 = 0
    var f2 = queue1.count
    var q1sum = queue1.reduce(0, { $0 + $1 })
    while f1 < f2 && f2 < totalQ.count {
        if q1sum == val { break }
        else if q1sum > val {
            q1sum -= totalQ[f1]
            f1 += 1
        }
        else if q1sum < val {
            q1sum += totalQ[f2]
            f2 += 1
        }
        moveCount += 1
    }
    
    if q1sum == val { return moveCount }
    else { return -1 }
}

// MARK: - 2차
// MARK: 실패 - 1 / 시간초과 - 20, 21, 22, 23, 24, 28, 30

//func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    var q1 = queue1
//    var q2 = queue2
//    
//    var val = (q1 + q2).reduce(0, { $0 + $1 }) / 2
//    var moveCount = 0
//    
//    var q1sum = q1.reduce(0, { $0 + $1 })
//    
//    while true {
//        guard moveCount < (q1 + q2).count else { break }
//        if q1sum == val { break }
//        else if q1sum > val {
//            let e = q1.removeFirst()
//            q1sum -= e
//            q2.append(e)
//        }
//        else if q1sum < val {
//            let e = q2.removeFirst()
//            q1sum += e
//            q1.append(e)
//        }
//        moveCount += 1
//    }
//    
//    if q1sum == val { return moveCount }
//    else { return -1 }
//}


// MARK: - 1차

// 시간초과
// 인덱싱하는 부분에서 시간 많이 쓴 듯 ?

//func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
//    
//    var totalQueue = queue1 + queue2
//    var queueCount = totalQueue.count
//    var val = totalQueue.reduce(0) { $0 + $1 } / 2
//    
//    var index1 = 0
//    var index2 = queue1.count
//    var moveCount = 0
//    var diff = 0
//    while true {
//        guard index1 < index2 && index2 < queueCount else { break }
//        
//        diff = totalQueue[index1..<index2].reduce(0, { $0 + $1 }) - val
//        
//        if diff == 0 { break }
//        else if diff > 0 {
//            index1 = (index1 + 1) % queueCount
//        }
//        else if diff < 0 {
//            index2 = (index2 + 1) % queueCount
//        }
//        
//        moveCount += 1
//    }
//    
//    if diff == 0 { return moveCount }
//    else { return -1 }
//}

print(solution([3, 2, 7, 2], [4, 6, 5, 1]))
print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
print(solution([1, 1], [1, 5]))
