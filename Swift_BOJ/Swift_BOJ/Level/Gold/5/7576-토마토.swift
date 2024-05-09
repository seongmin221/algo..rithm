//
//  7576-토마토.swift
//  Swift_BOJ
//
//  Created by 이성민 on 5/9/24.
//

import Foundation

struct Pos: Hashable {
    let y: Int
    let x: Int
    
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func solution() {
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let M = input[0]
    let N = input[1]
    
    let dy: [Int] = [1, -1, 0, 0]
    let dx: [Int] = [0, 0, 1, -1]
    
    var tCount: Int = 0
    var tPos: [Pos] = []
    var board: [[Int]] = []
    for y in 0..<N {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        board.append(row)
        for x in 0..<row.count {
            if row[x] == 1 { tPos.append(.init(y, x)) }
            else if row[x] == 0 { tCount += 1 }
        }
    }
    
    if tCount == 0 { print("0"); return }
    
    var visited: Set<Pos> = []
    func bfs(_ needVisit: [Pos], _ days: Int) {
        if needVisit.isEmpty { return }
        
        var nextVisit: [Pos] = []
        for pos in needVisit {
            for i in 0..<4 {
                let next: Pos = .init(pos.y + dy[i], pos.x + dx[i])
                
                guard 0 <= next.y, next.y < N,
                      0 <= next.x, next.x < M,
                      !visited.contains(next)
                else { continue }
                
                if board[next.y][next.x] == 0 {
                    board[next.y][next.x] = days
                    nextVisit.append(next)
                    visited.insert(next)
                }
            }
        }
        
        bfs(nextVisit, days + 1)
    }
    
    bfs(tPos, 1)
    
    var result: Int = 0
    for row in board {
        for c in row {
            if c == 0 { print("-1"); return }
            result = max(result, c)
        }
    }
    print(result)
}

//solution()
