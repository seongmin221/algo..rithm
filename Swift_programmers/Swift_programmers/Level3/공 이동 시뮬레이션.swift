//
//  공 이동 시뮬레이션.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/19/24.
//

import Foundation

//struct Position: Equatable {
//    let x: Int
//    let y: Int
//
//    static func + (lhs: Position, rhs: Position) -> Position {
//        return .init(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
//    }
//}

//func solution(
//    _ n: Int, // 격자의 행 수
//    _ m: Int, // 격자의 열 수
//    _ x: Int, // 목적지의 행 번호
//    _ y: Int, // 목적지의 열 번호
//    _ queries: [[Int]]
//) -> Int64 {
//
//    var yMoves: [Int] = []
//    var xMoves: [Int] = []
//    for query in queries {
//        if query[0] == 0 { yMoves.append(-query[1]) } // 0: -y
//        else if query[0] == 1 { yMoves.append(query[1]) } // 1: y
//        // x축 방향을 dir = 0
//        if query[0] == 2 { xMoves.append(-query[1]) } // 2: -x
//        else if query[0] == 3 { xMoves.append(query[1]) } // 3: +x
//    }
//
//    var yBalls: [Int] = .init(repeating: 1, count: m)
//    for yMove in yMoves {
//        if yMove < 0 {
//            let yMove = min(abs(yMove), n-1)
//            let zippedBalls = yBalls[0...yMove].reduce(0, { $0 + $1 })
//            let nonZippedBalls = Array(yBalls[(yMove+1)...])
//            let leftovers = Array(repeating: 0, count: yMove)
//            yBalls = [zippedBalls] + nonZippedBalls + leftovers
//        } else {
//            let xMove = min(yMove, n-1)
//            let zippedBalls = yBalls[(m-1-yMove)...(m-1)].reduce(0, { $0 + $1 })
//            let nonZippedBalls = Array(yBalls[...(m-2-yMove)])
//            let leftovers = Array(repeating: 0, count: yMove)
//            yBalls = leftovers + nonZippedBalls + [zippedBalls]
//        }
//    }
//
//    var xBalls: [Int] = .init(repeating: 1, count: n)
//    for xMove in xMoves {
//        if xMove < 0 {
//            let xMove = min(abs(xMove), n-1)
//            let zippedBalls = xBalls[0...xMove].reduce(0, { $0 + $1 })
//            let nonZippedBalls = Array(xBalls[(xMove+1)...])
//            let leftovers = Array(repeating: 0, count: xMove)
//            xBalls = [zippedBalls] + nonZippedBalls + leftovers
//        } else {
//            let xMove = min(xMove, n-1)
//            let zippedBalls = xBalls[(n-1-xMove)...(n-1)].reduce(0, { $0 + $1 })
//            let nonZippedBalls = Array(xBalls[...(n-2-xMove)])
//            let leftovers = Array(repeating: 0, count: xMove)
//            xBalls = leftovers + nonZippedBalls + [zippedBalls]
//        }
//    }
//
//    return Int64(yBalls[y] * xBalls[x])
//}


func solution(
    _ n: Int, // 격자의 행 수
    _ m: Int, // 격자의 열 수
    _ x: Int, // 목적지의 행 번호
    _ y: Int, // 목적지의 열 번호
    _ queries: [[Int]]
) -> Int64 {
    
    var yMoves: [Int] = []
    var xMoves: [Int] = []
    for query in queries {
        if query[0] == 0 { yMoves.append(-query[1]) } // 0: -y
        else if query[0] == 1 { yMoves.append(query[1]) } // 1: y
        // x축 방향을 dir = 0
        if query[0] == 2 { xMoves.append(-query[1]) } // 2: -x
        else if query[0] == 3 { xMoves.append(query[1]) } // 3: +x
    }
    
    func calculateEachEnd(
        _ moves: [Int],
        limit: Int
    ) -> ((pos: Int, amount: Int), (pos: Int, amount: Int)) {
        var start: (pos: Int, amount: Int) = (0, 1)
        var end: (pos: Int, amount: Int) = (limit-1, 1)
        for move in moves {
            if move < 0 { // 왼쪽으로 이동
                let move = abs(move)
                if move >= end.pos { // 공이 있는 오른쪽 끝이 왼쪽 벽에 붙음
                    start = (0, limit)
                    end = (0, limit)
                }
                else if move >= start.pos { // 왼쪽 끝은 붙음
                    if start.pos < end.pos {
                        start.amount += (move - start.pos)
                        start.pos = 0
                        end.pos -= move
                    } else {
                        start.pos = 0
                        end.pos = 0
                    }
                }
                else { // 왼쪽 끝도 붙지 않음
                    start.pos -= move
                    end.pos -= move
                }
            } else {
                if move >= limit - 1 - start.pos { // 공이 있는 왼쪽 끝이 오른쪽 벽에 붙음
                    end = (limit-1, limit)
                    start = (limit-1, limit)
                }
                else if move >= limit - 1 - end.pos { // 공이 있는 왼쪽과 오른쪽 사이만큼 움직일 때
                    if start.pos < end.pos {
                        end.amount += (move - (limit - 1 - end.pos))
                        end.pos = limit-1
                        start.pos += move
                    } else {
                        end.pos = limit - 1
                        start.pos = limit - 1
                    }
                }
                else {
                    end.pos += move
                    start.pos += move
                }
            }
        }
        return (start, end)
    }
    
    let (yStart, yEnd) = calculateEachEnd(yMoves, limit: m)
    let (xStart, xEnd) = calculateEachEnd(xMoves, limit: n)
    
    var yPossibilities = 0
    if yStart.pos == y { yPossibilities = yStart.amount }
    else if yStart.pos < y && y < yEnd.pos { yPossibilities = 1 }
    else if yEnd.pos == y { yPossibilities = yEnd.amount }
    else { return 0 }
    
    var xPossibilities = 0
    if xStart.pos == x { xPossibilities = xStart.amount }
    else if xStart.pos < x && x < xEnd.pos { xPossibilities = 1 }
    else if xEnd.pos == x { xPossibilities = xEnd.amount }
    else { return 0 }
    
    return Int64(yPossibilities * xPossibilities)
}

//print(solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]]))
//print(solution(2, 5, 0, 1, [[3,1],[2,2],[1,1],[2,3],[0,1],[2,1]]))


//if let yLast = yMoves.last {
//    if yLast < 0 && (m - y) < abs(yLast) { return 0 }
//    else if yLast > 0 && y > abs(yLast) { return 0 }
//}
//if let xLast = xMoves.last {
//    if xLast < 0 && (m - x) < abs(xLast) { return 0 }
//    else if xLast > 0 && x > abs(xLast) { return 0 }
//}


//    var moves: [(dir: Int, amount: Int)] = queries
//        .map {
//            // y축 방향을 dir = 1
//            if $0[0] == 0 { return (1, -$0[1]) } // 0: -y
//            else if $0[0] == 1 { return (1, $0[1]) } // 1: y
//            // x축 방향을 dir = 0
//            else if $0[0] == 2 { return (0, -$0[1]) } // 2: -x
//            else if $0[0] == 3 { return (0, $0[1]) } // 3: +x
//            else { return (-1, -1) }
//        }


//    typealias Pos = (x: Int, y: Int)
//
//    func query0(_ amount: Int, from pos: Pos) -> Pos {
//        return (max(pos.x - amount, 0), pos.y)
//    }
//
//    func query1(_ amount: Int, from pos: Pos) -> Pos {
//        return (min(pos.x + amount, n), pos.y)
//    }
//
//    func query2(_ amount: Int, from pos: Pos) -> Pos {
//        return (max(pos.x - amount, 0), pos.y)
//    }
//
//    func query3(_ amount: Int, from pos: Pos) -> Pos {
//        return (max(pos.x - amount, 0), pos.y)
//    }
    
//    var continuousMoves: [(dir: Int, amount: Int)] = []
//
//    var dx: Int = 0
//    var dy: Int = 0
//    for query in queries {
//        if query[0] == 0 {
//            if dy > 0 { continuousMoves.append((0, dy)); dy = 0 }
//            dy += -query[1]
//        } // 0: -y
//        else if query[0] == 1 {
//            if dy < 0 { continuousMoves.append((0, dy)); dy = 0 }
//            dy += query[1]
//        } // 1: y
//        // x축 방향을 dir = 0
//        if query[0] == 2 {
//            if dx > 0 { continuousMoves.append((1, dx)); dx = 0 }
//            dx += -query[1]
//        } // 2: -x
//        else if query[0] == 3 {
//            if dx < 0 { continuousMoves.append((1, dx)); dx = 0 }
//            dx += query[1]
//        }
//    }
//    continuousMoves.append((1, dx))
//    continuousMoves.append((0, dy))
//    dump(continuousMoves)
