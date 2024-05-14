//
//  9663-N-Queen.swift
//  Swift_BOJ
//
//  Created by 이성민 on 5/14/24.
//

import Foundation

//
//func solution() {
//
//    let N = Int(readLine()!)!
//    var allPos: Set<Pos> = []
//    for y in 0..<N { for x in 0..<N { allPos.insert(.init(y: y, x: x)) } }
//
//    func isPossible(_ pos1: Pos, _ pos2: Pos) -> Bool {
//        if pos1.y == pos2.y { return false }
//        if pos1.x == pos2.x { return false }
//        if abs(pos1.y - pos2.y) == abs(pos1.x - pos2.x) { return false }
//        return true
//    }
//
//    func dfs(_ index: Int, _ pos: Pos, _ possible: Set<Pos>) -> Int {
//        if index == N { return 1 } // 마지막 퀸이라면
//
//        // 마지막 퀸이 아닌 상태
//        if possible.count == 0 { return 0 } // 더 이상 둘 수 있는 곳이 없음
//
//        // 마지막 퀸이 아니고, 둘 공간 있음
//        var result = 0
//        for np in possible { // np: 다음 퀸 위치
//            let nextPossible = possible.filter { isPossible($0, np) }
//            result += dfs(index+1, np, nextPossible)
//        }
//
//        for np in possible {
//            let nextPossible: Set<Pos> = possible
//                .filter { p in
//                    if p.y != np.y, p.x != np.x,
//                       abs(np.y - p.y) != abs(np.x - p.x) {
//                        return true
//                    } else { return false }
//                }
//            result += dfs(index + 1, np, nextPossible)
//        }
//        for y in 0..<N {
//            guard pos.y != y else { continue }
//            for x in 0..<N {
//                guard pos.x != x else { continue }
//
//                let np: Pos = .init(y: y, x: x)
//                guard possible.contains(pos) else { continue }
//
//                let dy = pos.y - np.y
//                let dx = pos.x - np.x
//                if abs(dy) != abs(dx) {
//                    nextPossible.insert(np)
//                }
//            }
//        }
//
//        var result: Int = 0
//        for np in nextPossible {
//            result += dfs(index + 1, np, nextPossible)
//        }
//        return result
//    }
//
//    var result = 0
//    for pos in allPos {
//        result += dfs(1, pos, allPos.filter { isPossible($0, pos) })
//    }
//
//    print(result / N)
//}
//
//solution()

//struct Pos: Hashable {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//func solution() {
//
//    let N = Int(readLine()!)!
//    var allPos: Set<Pos> = []
//    for y in 0..<N { for x in 0..<N { allPos.insert(.init(y, x)) } }
//
//    func dfs(_ y: Int, _ possible: Set<Pos>) -> Int {
//        if y == N { return 1 }
//        if possible.isEmpty { return 0 }
//
//        for x in 0..<N {
//            let pos: Pos = .init(y, x)
//
//        }
//    }
//}



//extension Array where Element == [Int] {
//    func filterPos(_ y: Int, _ x: Int) -> [[Int]] {
//        let size = self.count
//        var result = self
//        for ny in y+1..<size {
//            for nx in 0..<size {
//                if nx == x || abs(nx-x) == abs(ny-y) {
//                    result[ny][nx] = -1
//                }
//            }
//        }
//        return result
//    }
//}
//
//func solution() {
//
//    let N = Int(readLine()!)!
//    let board: [[Int]] = .init(repeating: .init(repeating: 0, count: N), count: N)
//
//    func dfs(_ y: Int, _ x: Int, _ possible: [[Int]]) -> Int {
//        print(y, x)
//        for row in possible { print(row) }
//        if y == N-1 { return 1 }
//        if !possible[y].contains(0) { return 0 }
//
//        var result: Int = 0
//        for nx in 0..<N {
//            if possible[y+1][nx] == -1 { continue }
//            var nextPossible = possible.filterPos(y+1, nx)
//            nextPossible[y+1][nx] = 1
//            result += dfs(y+1, nx, nextPossible)
//        }
//        return result
//    }
//
//    var result = 0
//    for x in 0..<N {
//        var possible = board.filterPos(0, x)
//        possible[0][x] = 1
//        result += dfs(0, x, possible)
//    }
//    print(result)
//}
//
//solution()



// MARK: - 답은 잘 나옴 / 시간초과

//func solution() {
//
//    let N = Int(readLine()!)!
//
//    func isAttackable(_ y: Int, _ x: Int, _ positions: [Int]) -> Bool {
//        for i in 0..<y {
//            if positions[i] == x { return true }
//            if abs(x-positions[i]) == abs(y-i) { return true }
//        }
//        return false
//    }
//
//    func dfs(_ y: Int, _ x: Int, _ xPositions: [Int]) -> Int {
//        if y == N-1 { return 1 }
//
//        var result: Int = 0
//        for nx in 0..<N {
//            guard !isAttackable(y+1, nx, xPositions + [nx]) else { continue }
//            result += dfs(y+1, nx, xPositions + [nx])
//        }
//        return result
//    }
//
//    var result = 0
//    for x in 0..<N {
//        result += dfs(0, x, [x])
//    }
//    print(result)
//}
//
//solution()


func solution() {
    
    let N = Int(readLine()!)!
    
    var qXArr: [Int] = .init(repeating: -1, count: N)
    var visited: [Bool] = .init(repeating: false, count: N)
    
    func isAttackable(row: Int) -> Bool {
        for i in 0..<row {
            let sub = qXArr[i] - qXArr[row]
            if sub == 0 || abs(sub) == abs(row-i) {
                return true
            }
        }
        return false
    }
    
    var answer = 0
    func dfs(row: Int) {
        if row == N { answer += 1; return }
        
        for i in 0..<N {
            if visited[i] { continue }
            qXArr[row] = i
            guard !isAttackable(row: row) else { continue }
            visited[i] = true
            dfs(row: row+1)
            visited[i] = false
        }
    }
    
    dfs(row: 0)
    print(answer)
}

//solution()
