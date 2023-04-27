//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/12.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    
    // 어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고
    // 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.
    
    // citations.count = 논문의 개수
    // 논문 중 h 번 이상 인용된 논문 >= h 일 때 h의 최대값
    var temp = 0
    var cits = citations.sorted()
    for cit in cits {
        if cit <= cits.count {
            temp = cit
            cits.removeFirst()
        } else {
            break
        }
    }
    while temp < cits.count {
        temp += 1
    }
    return temp
}

print(solution([1, 2, 3, 5, 21, 25, 33, 44, 55, 66, 77]))

// 77 66 55 44 33 25 21 5 3 2 1
// 1 2 3 5 21 25 33 44 55 66 77
// 0 1 3 5 6
//citations         return
//[3, 0, 6, 1, 5]   3
