//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/08.
//

import Foundation

func solution(_ n: Int) -> Int {
    
    // 선택지:
    // 1. K 칸만큼 앞으로 이동하기 -> K overhead
    // 2. 지금까지 온 만큼의 2배 위치로 이동하기 -> no overhead
    // N이라는 지점에 갈 때 최소의 overhead 를 반환
    
    var ans: Int = 0
    
    var num = n
    while n != 0 {
        if num % 2 == 0 {
            num /= 2
        } else {
            num -= 1
            ans += 1
        }
        if num == 0 { break }
    }
    return ans
}

print(solution(5000))
