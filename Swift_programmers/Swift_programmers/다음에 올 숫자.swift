//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/17.
//

import Foundation

func solution(_ common:[Int]) -> Int {
    if common[0] - common[1] == common[1] - common[2] {
        return common.last! + common[1] - common[0]
    } else {
        return common.last! * common[1] / common[0]
    }
}

print(solution([2, 4, 8]))
