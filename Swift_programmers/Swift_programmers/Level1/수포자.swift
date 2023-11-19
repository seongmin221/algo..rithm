//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/19/23.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    
    var result = [Int]()
    
    var scores = [0, 0, 0]
    var method1 = [1, 2, 3, 4, 5]
    var method2 = [2, 1, 2, 3, 2, 4, 2, 5]
    var method3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    for i in 0..<answers.count {
        if method1[i % 5] == answers[i] { scores[0] += 1 }
        if method2[i % 8] == answers[i] { scores[1] += 1 }
        if method3[i % 10] == answers[i] { scores[2] += 1 }
    }
    
    var maxScore = scores.max()!
    for i in 0..<3 {
        if scores[i] == maxScore { result.append(i + 1) }
    }
    
    return result
}
