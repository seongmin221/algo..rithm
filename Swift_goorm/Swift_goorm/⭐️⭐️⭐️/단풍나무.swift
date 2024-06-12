//
//  단풍나무.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/12/24.
//

import Foundation

func mapleTree() {
    let n = Int(readLine()!)!
    
    var park: [[Int]] = []
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        park.append(row)
    }
    
    var nonZeroCount: Int = 0
    for y in 0..<n {
        for x in 0..<n {
            nonZeroCount += park[y][x] != 0 ? 1 : 0
        }
    }
    
    func surroundingCount(_ y: Int, _ x: Int) -> Int {
        var returnVal: Int = 0
        if y-1 >= 0 && park[y-1][x] == 0 { returnVal += 1 }
        if y+1 < n && park[y+1][x] == 0 { returnVal += 1 }
        if x-1 >= 0 && park[y][x-1] == 0 { returnVal += 1 }
        if x+1 < n && park[y][x+1] == 0 { returnVal += 1 }
        return returnVal
    }
    
    func dayPass() -> [(r: Int, c: Int, dCount: Int)] {
        var returnVal: [(r: Int, c: Int, dCount: Int)] = []
        
        for y in 0..<n {
            for x in 0..<n {
                guard park[y][x] != 0 else { continue }
                
                let decreaseBy = surroundingCount(y, x)
                returnVal.append((y, x, decreaseBy))
            }
        }
        return returnVal
    }
    
    var result: Int = 0
    while nonZeroCount > 0 {
        for (r, c, dCount) in dayPass() {
            park[r][c] = max(park[r][c] - dCount, 0)
            if park[r][c] == 0 { nonZeroCount -= 1 }
        }
        result += 1
    }
    
    print(result)
}

// func iterate() -> [(r: Int, c: Int)] {
//     var turningZero: [(r: Int, c: Int)] = []
//     for y in 0..<n {
//         for x in 0..<n {
//             guard park[y][x] != 0 else { continue }
//             let c = surroundingCount(y, x)
//             if park[y][x] - c > 0 {
//                 park[y][x] -= c
//             } else {
//                 park[y][x] = 0
//                 nonZeroCount -= 1
//             }
//         }
//     }
//     return turningZero
// }

// var result = 1
// while nonZeroCount > 0 {
//     iterate()
//     result += 1
// }

// print(result)
