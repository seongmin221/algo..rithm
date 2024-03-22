//
//  경주로 건설.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

// 직선 도로 하나를 만들 때는 100원이 소요
// 코너를 하나 만들 때는 500원이 추가

// 도면의 상태(0은 비어 있음, 1은 벽)을 나타내는 2차원 배열 board가 매개변수
// 경주로를 건설하는데 필요한 최소 비용

// sol1. dp (X)
// sol2. dfs ?

//struct DPNode: Comparable {
//    var direction: Set<Direction>
//    var cost: Int
//
//    static func <(lhs: DPNode, rhs: DPNode) -> Bool {
//        lhs.cost < rhs.cost
//    }
//
//    static var empty: DPNode {
//        return .init(direction: [], cost: 1000000)
//    }
//}

//func solution(_ board: [[Int]]) -> Int {
//
//    let dx: [Int] = [1, -1, 0, 0]
//    let dy: [Int] = [0, 0, -1, 1]
//
//    // 전체 트랙 초기 설정
//    let maxY: Int = board.count
//    let maxX: Int = board.first!.count
//    var wholeBoard: [[Int]] = []
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//    for row in board {
//        var temp: [Int] = [1]
//        temp += row
//        temp.append(1)
//        wholeBoard.append(temp)
//    }
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//
//    // 로직
//    var dp: [[DPNode]] = .init(repeating: .init(repeating: .empty, count: maxX + 2),
//                               count: maxY + 2)
//    dp[1][1] = .init(direction: [], cost: 0)
//    func logic(y: Int, x: Int, dir: Direction) {
//        for d in Direction.allCases {
//            let ny = y + dy[d.rawValue]
//            let nx = x + dx[d.rawValue]
//            var nCost = dp[y][x].cost + 100
//            guard wholeBoard[ny][nx] != 1 else { continue }
//
//            if dir != d { nCost += 500 }
//
//            if dp[ny][nx].cost > nCost { dp[ny][nx].cost = nCost }
//            else if dp[ny][nx].cost == nCost {
//                dp[ny][nx].direction.insert(d)
//            }
//            else { continue }
//            print("---")
//            for r in dp.map({ $0.map { $0.cost }}) { print(r) }
//            print("---")
//            logic(y: ny, x: nx, dir: d)
//        }
//    }
//
//    logic(y: 1, x: 1, dir: .right)
//
//
//    return dp[maxY][maxX].cost
//}

//func solution(_ board: [[Int]]) -> Int {
//
//    let dx: [Int] = [1, -1, 0, 0]
//    let dy: [Int] = [0, 0, -1, 1]
//
//    // 전체 트랙 초기 설정
//    let maxY: Int = board.count
//    let maxX: Int = board.first!.count
//    var wholeBoard: [[Int]] = []
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//    for row in board {
//        var temp: [Int] = [1]
//        temp += row
//        temp.append(1)
//        wholeBoard.append(temp)
//    }
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//
//    // 로직
//    var dp: [[DPNode]] = .init(repeating: .init(repeating: .empty, count: maxX + 2),
//                               count: maxY + 2)
//    dp[1][1] = .init(direction: [], cost: 0)
//    func logic(y: Int, x: Int, dir: Direction) {
//        for d in Direction.allCases {
//            let ny = y + dy[d.rawValue]
//            let nx = x + dx[d.rawValue]
//            var nCost = dp[y][x].cost + 100
//            if dir != d { nCost += 500 }
//
//            var nNode: DPNode = .init(direction: [d], cost: nCost)
//            if dp[y][x].direction.contains(d) && dp[y][x].cost >= nNode.cost {}
//            else if
//        }
//    }
//
//    logic(y: 1, x: 1, dir: .right)
//
//
//    return dp[maxY][maxX].cost
//}




//func solution(_ board: [[Int]]) -> Int {
//
//    let dx: [Int] = [1, -1, 0, 0]
//    let dy: [Int] = [0, 0, -1, 1]
//
//    // 전체 트랙 초기 설정
//    let maxY: Int = board.count
//    let maxX: Int = board.first!.count
//    var wholeBoard: [[Int]] = []
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//    for row in board {
//        var temp: [Int] = [1]
//        temp += row
//        temp.append(1)
//        wholeBoard.append(temp)
//    }
//    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
//
//    // 로직
//    var minCost: Int = .max
//    func dfs(y: Int, x: Int, dir: Direction, cost: Int, visited: [(y: Int, x: Int)]) {
//        if minCost < cost { return }
//
//        for d in Direction.allCases {
//            var nVisited = visited
//            let ny = y + dy[d.rawValue]
//            let nx = x + dx[d.rawValue]
//            var nCost = cost + 100
//            if dir != d { nCost += 500 }
//
//            // 이미 현재 경로에서 방문한 곳이면 패스
//            if nVisited.contains(where: { $0.y == ny && $0.x == nx }) { continue }
//            // 보드 바깥
//            if wholeBoard[ny][nx] == 1 { continue }
//            // 지금까지의 최소 가격보다 많으면 패스
//            if minCost < nCost { continue }
//
//            // 목적지에 도달
//            if ny == maxY && nx == maxX {
//                minCost = min(minCost, nCost)
//                return
//            }
//
//            nVisited.append((ny, nx))
//            dfs(y: ny, x: nx, dir: d, cost: nCost, visited: nVisited)
//        }
//    }
//
//    dfs(y: 1, x: 1, dir: .right, cost: 0, visited: [(1, 1)])
//    dfs(y: 1, x: 1, dir: .down, cost: 0, visited: [(1, 1)])
//
//    return minCost
//}


enum Direction: Int, CaseIterable {
    case right = 0
    case left = 1
    case up = 2
    case down = 3
}

func solution(_ board: [[Int]]) -> Int {
    
    let dx: [Int] = [1, -1, 0, 0]
    let dy: [Int] = [0, 0, -1, 1]
    
    // 전체 트랙 초기 설정
    let maxY: Int = board.count
    let maxX: Int = board.first!.count
    var wholeBoard: [[Int]] = []
    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
    for row in board {
        var temp: [Int] = [1]
        temp += row
        temp.append(1)
        wholeBoard.append(temp)
    }
    wholeBoard.append(.init(repeating: 1, count: maxX + 2))
    
    
    var dp: [[[Int]]] = .init(
        repeating: .init(repeating: .init(repeating: .max, count: 4), count: maxX+2),
        count: maxY+2
    )
    
    func dfs(y: Int, x: Int, dir: Direction, cost: Int) {
        for d in Direction.allCases {
            let ny = y + dy[d.rawValue]
            let nx = x + dx[d.rawValue]
            let nCost = cost + 100 + (d == dir ? 0 : 500)
            
            if wholeBoard[ny][nx] == 1 { continue }
            if dp[ny][nx][d.rawValue] > nCost {
                dp[ny][nx][d.rawValue] = nCost
            }
            else { continue }
            
            dfs(y: ny, x: nx, dir: d, cost: nCost)
        }
    }
    
    dfs(y: 1, x: 1, dir: .down, cost: 0)
    dfs(y: 1, x: 1, dir: .right, cost: 0)
    
    return dp[maxY][maxX].min()!
}

//print(solution([[0,0,0],[0,0,0],[0,0,0]]))
//print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
//print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]))
//print(solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]]))
