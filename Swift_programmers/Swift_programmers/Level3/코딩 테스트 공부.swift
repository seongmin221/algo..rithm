//
//  코딩 테스트 공부.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

//struct Problem {
//    let req: Skill
//    let gain: Skill
//    let cost: Int
//}
//
//extension Problem: Comparable {
//    static func == (lhs: Problem, rhs: Problem) -> Bool {
//        lhs.req == rhs.req
//    }
//
//    static func < (lhs: Problem, rhs: Problem) -> Bool {
//        lhs.req < rhs.req
//    }
//}
//
//extension Problem {
//    struct Skill: Comparable {
//        let alp: Int
//        let cop: Int
//
//        static func < (lhs: Skill, rhs: Skill) -> Bool {
//            lhs.alp < rhs.alp && lhs.cop < rhs.cop
//        }
//
//        static func <= (lhs: Skill, rhs: Skill) -> Bool {
//            lhs.alp <= rhs.alp && lhs.cop <= rhs.cop
//        }
//
//        static func + (lhs: Skill, rhs: Skill) -> Skill {
//            .init(alp: lhs.alp + rhs.alp, cop: lhs.cop + rhs.cop)
//        }
//    }
//}
//
//func solution(_ alp: Int, _ cop: Int, _ problems: [[Int]]) -> Int {
//
//    var maxAlpReq: Int = 0
//    var maxCopReq: Int = 0
//    let problems: [Problem] = problems.map { prob in
//        maxAlpReq = max(maxAlpReq, prob[0])
//        maxCopReq = max(maxCopReq, prob[1])
//        return .init(req: .init(alp: prob[0], cop: prob[1]),
//                     gain: .init(alp: prob[2], cop: prob[3]),
//                     cost: prob[4])
//    }
//
//    var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: maxCopReq + 1),
//                            count: maxAlpReq + 1)
//    for i in 0...maxAlpReq {
//        for j in 0...maxCopReq {
//            if i > alp { dp[i][j] += i - alp }
//            if j > cop { dp[i][j] += j - cop }
//        }
//    }
//
//    for al in alp...maxAlpReq {
//        for co in cop...maxCopReq {
//            for prob in problems {
//                let skill: Problem.Skill = .init(alp: al, cop: co)
//                guard prob.req <= skill else { continue }
//                guard skill + prob.gain <= .init(alp: maxAlpReq, cop: maxCopReq) else { continue }
//
//                let newSkill = skill + prob.gain
//                dp[newSkill.alp][newSkill.cop] = min(dp[newSkill.alp][newSkill.cop], dp[skill.alp][skill.cop] + prob.cost)
//            }
//        }
//    }
//
//    var reqTime: Int = 0
//    for prob in problems {
//        reqTime = max(reqTime, dp[prob.req.alp][prob.req.cop])
//    }
//
//    return reqTime
//}


func solution(_ alp: Int, _ cop: Int, _ problems: [[Int]]) -> Int {
    
    var maxAlp: Int = problems.map({ $0[0] }).max()!
    var maxCop: Int = problems.map({ $0[1] }).max()!
    maxAlp = max(maxAlp, alp)
    maxCop = max(maxCop, cop)
    
    var dp: [[Int]] = .init(repeating: .init(repeating: 10001, count: maxCop + 1), count: maxAlp + 1)
    for a in 0...alp {
        for c in 0...cop {
            dp[a][c] = 0
        }
    }
    
    for a in 0...maxAlp {
        for c in 0...maxCop {
            guard a >= alp || c >= cop else { continue }
            
            if a+1 <= maxAlp {
                dp[a+1][c] = min(dp[a+1][c], dp[a][c] + 1)
            }
            if c+1 <= maxCop {
                dp[a][c+1] = min(dp[a][c+1], dp[a][c] + 1)
            }
            
            for prob in problems {
                guard a >= prob[0], c >= prob[1] else { continue }
                
                var newA = min(a + prob[2], maxAlp)
                var newC = min(c + prob[3], maxCop)
                dp[newA][newC] = min(dp[newA][newC], dp[a][c] + prob[4])
            }
        }
    }
    
    var reqTime: Int = 0
    for problem in problems {
        reqTime = max(reqTime, dp[problem[0]][problem[1]])
    }
    
    return reqTime
}

//print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
