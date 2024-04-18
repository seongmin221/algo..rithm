//
//  인사고과.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/18/24.
//

import Foundation

//func solution(_ scores: [[Int]]) -> Int {
//
//    let wonho = scores[0]
//    let wonhoSum = wonho[0] + wonho[1]
    
//    var result = 0
//
//    var scoreTable: [Int: [[Int]]] = [:]
//    for score in scores {
//        let sum = score[0] + score[1]
//        if score[0] > wonho[0] && score[1] > wonho[1] { return -1 }
//        if sum > wonhoSum {
//            if scoreTable[sum] == nil { scoreTable[sum] = [score] }
//            else { scoreTable[sum]!.append(score) }
//            result += 1
//        }
//    }
//
//    let higherScores: [Int] = scoreTable.keys
//        .filter { $0 > wonhoSum }
//        .sorted(by: >)
//
//    for i in 0..<higherScores.count-1 {
//        for j in i..<higherScores.count {
//            for iScore in scoreTable[higherScores[i]]! {
//                for jScore in scoreTable[higherScores[j]]! {
//                    if iScore[0] > jScore[0] && iScore[1] > jScore[1] {
//                        result -= 1
//                    }
//                }
//            }
//        }
//    }
//
//    return result + 1
    
    
//    var result = 1
//    var higher: [[Int]] = []
//    for score in scores {
//        if score[0] + score[1] > wonhoSum {
//            higher.append(score)
//            result += 1
//        }
//    }
//
//    higher.sort(by: { $0[0] + $0[1] > $1[0] + $1[1] })
//    for i in 0..<higher.count {
//        if higher[i][0] > wonho[0] && higher[i][1] > wonho[1] { return -1 }
//
//        for j in 0..<i {
//            if higher[j][0] > higher[i][0] && higher[j][1] > higher[i][1] {
//                result -= 1
//                break
//            }
//        }
//    }
//
//    return result
//}

struct Score: Comparable {
    let sum: Int
    let work: Int
    let team: Int
    
    init(_ work: Int, _ team: Int) {
        self.work = work
        self.team = team
        self.sum = work + team
    }
    
    static func < (lhs: Score, rhs: Score) -> Bool {
        lhs.sum < rhs.sum
    }
}

func solution(_ scores: [[Int]]) -> Int {
    
    let wonho: Score = .init(scores[0][0], scores[0][1])
    
    var result = 1
    var higher: [Score] = []
    for score in scores {
        if score[0] + score[1] > wonho.sum {
            if score[0] > wonho.work && score[1] > wonho.team { return -1 }
            higher.append(.init(score[0], score[1]))
            result += 1
        }
    }
    
    higher.sort(by: >)
    for i in 0..<higher.count {
        for j in 0..<i {
            if higher[j].work > higher[i].work && higher[j].team > higher[i].team {
                result -= 1
                break
            }
        }
    }
    
    return result
}

//print(solution([[2,2],[1,4],[3,2],[3,2],[2,1]]))
//
//print(solution([[1,10],[6,6],[8,8]]))
