//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/26.
//

import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    for num in 1..<number+1 {
        var divCnt = 0
        for n in 1..<Int(sqrt(Float(num)))+1 {
            if num % n == 0 {
                divCnt += 2
            }
            if sqrt(Float(num)) == Float(n) {
                divCnt -= 1
            }
            if divCnt > limit {
                divCnt = power
                break
            }
        }
        result += divCnt
    }
    return result
}

print(solution(10, 3, 2))

// number   limit    power    result
// 5        3        2        10
// 10       3        2        21
