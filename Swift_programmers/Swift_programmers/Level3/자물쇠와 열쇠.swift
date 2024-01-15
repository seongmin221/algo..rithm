//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/15/24.
//

import Foundation

func solution(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    
    let M = key.count
    let N = lock.count
    
    var lock0 = 0
    var lock1 = 0
    var key0 = 0
    var key1 = 0
    for y in 0..<N {
        for x in 0..<N {
            if lock[y][x] == 0 { lock0 += 1 }
            else { lock1 += 1 }
        }
    }
    for y in 0..<M {
        for x in 0..<M {
            if key[y][x] == 0 { key0 += 1 }
            else { key1 += 1 }
        }
    }
    
    if lock1 == N * N { return true }
    if lock0 > key1 { return false }
    
    
    var key = key
    
    for _ in 0..<4 {
        for dy in 0..<N+M-1 {
            for dx in 0..<N+M-1 {
                var expandedBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 2*M - 2), count: N + 2*M - 2)
                for y in 0..<N {
                    for x in 0..<N {
                        expandedBoard[y+M-1][x+M-1] = lock[y][x]
                    }
                }
                
                for y in 0..<M {
                    for x in 0..<M {
                        expandedBoard[y+dy][x+dx] += key[y][x]
                    }
                }
                
                var sizedBoard = Array(repeating: Array(repeating: 0, count: N), count: N)
                for y in 0..<N {
                    for x in 0..<N {
                        sizedBoard[y][x] = expandedBoard[M-1+y][M-1+x]
                    }
                }
                
                if sizedBoard.flatMap({ $0 }).allSatisfy({ $0 == 1 }) {
                    return true
                }
            }
        }
        key = key.rotate()
    }
    
    return false
}

extension Array where Element == [Int] {
    func rotate() -> Self {
        let count = self.count
        var rKey: [[Int]] = .init(repeating: .init(repeating: 0, count: count), count: count)
        for y in 0..<count {
            for x in 0..<count {
                guard self[x][count-1-y] == 1 else { continue }
                rKey[y][x] = self[x][count-1-y]
            }
        }
        
        return rKey
    }
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
