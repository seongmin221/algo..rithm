//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/2/24.
//

import Foundation

func solution(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    
    var newArr2: [[Int]] = []
    for x in 0..<arr2.first!.count {
        var row: [Int] = []
        for y in 0..<arr2.count {
            row.append(arr2[y][x])
        }
        newArr2.append(row)
    }
    
    let colCount = arr1.first!.count
    var result: [[Int]] = []
    for y in 0..<arr1.count {
        var row: [Int] = []
        for y2 in 0..<newArr2.count {
            var temp = 0
            for x in 0..<colCount {
                temp += arr1[y][x] * newArr2[y2][x]
            }
            row.append(temp)
        }
        result.append(row)
    }
    
    return result
}
