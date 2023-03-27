//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/27.
//

import Foundation

//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var lostStud = lost
//    for stud in reserve {
//        if let index = lostStud.firstIndex(of: stud) {
//            lostStud.remove(at: index)
//        } else if let index = lostStud.firstIndex(of: stud - 1) {
//            lostStud.remove(at: index)
//        } else if let index = lostStud.firstIndex(of: stud + 1) {
//            lostStud.remove(at: index)
//        }
//    }
//    return n - lostStud.count
//}
// 3~5,10,12,17~21,23~25 실패

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
}

print(solution(3, [3], [1]))

//n    lost    reserve    return
//5    [2, 4]    [1, 3, 5]    5
//5    [2, 4]    [3]    4
//3    [3]    [1]    2
