//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/23.
//

import Foundation

func solution(_ dartResult:String) -> Int {
    var result = 0
    var scoreList = dartResult.components(separatedBy: ["S", "D", "T", "*", "#"]).filter { $0 != ""}.map { Int($0)! }
    let charList = dartResult.components(separatedBy: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]).filter { $0 != ""}
    
    for i in 0..<3 {
        switch charList[i].first! {
        case "S":
            scoreList[i] = scoreList[i]
        case "D":
            scoreList[i] = scoreList[i] * scoreList[i]
        case "T":
            scoreList[i] = scoreList[i] * scoreList[i] * scoreList[i]
        default:
            continue
        }
        
        if charList[i].last! == "*" {
            scoreList[i] *= 2
            if i >= 1 {
                scoreList[i-1] *= 2
            }
        } else if charList[i].last! == "#" {
            scoreList[i] *= -1
        }
    }
    
    for score in scoreList {
        result += score
    }
    
    return result
}

print(solution("1S2D*3T"))
