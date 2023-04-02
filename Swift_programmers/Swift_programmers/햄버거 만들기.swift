//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/01.
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var result = 0
    var ing = ingredient
    var i = 0
    while true {
        if ing.count < 4 || i + 4 > ing.count {
            break
        }
        if ing[i...i+3] == [1,2,3,1] {
            result += 1
            ing.remove(at: i)
            ing.remove(at: i)
            ing.remove(at: i)
            ing.remove(at: i)
            i = i > 3 ? i - 3 : 0
        } else {
            i += 1
        }
    }
    return result
}

print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))

//ingredient    result
//[2, 1, 1, 2, 3, 1, 2, 3, 1]    2
//[1, 3, 2, 1, 2, 1, 3, 1, 2]    0
