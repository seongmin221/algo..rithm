//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/29/23.
//

import Foundation

// 진법 n
// 미리 구할 숫자의 갯수 t
// 게임에 참가하는 인원 m
// 튜브의 순서 p

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    
    let numberCount = m * t
    var allAnswers = [String]()
    for i in 0..<numberCount { allAnswers += String(i, radix: n).map { String($0) } }
    
    let numbersToSay = allAnswers.enumerated()
        .filter { index, _ in
            index % m == p - 1
        }
        .map { $0.element.uppercased() }
        .reduce("", { $0 + $1 })
    
    let result = String(numbersToSay.prefix(t))
    
    return result
}

//print(solution(2, 4, 2, 1))
//print(solution(16, 16, 2, 1))
//print(solution(16, 16, 2, 2))
