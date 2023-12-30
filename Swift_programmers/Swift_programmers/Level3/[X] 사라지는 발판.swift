//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/28/23.
//

import Foundation

// b의 움직임 회수는 최대
// a의 움직임 회수는 최소

enum Turn {
    case a
    case b
}

func solution(_ board: [[Int]], _ aloc: [Int], _ bloc: [Int]) -> Int {
    
    var newBoard: [[Int]] = []
    let boardW = board.first!.count
    newBoard.append(.init(repeating: 0, count: boardW + 2))
    for row in board { newBoard.append([0] + row + [0]) }
    newBoard.append(.init(repeating: 0, count: boardW + 2))
    
    let aloc = [aloc[0]+1, aloc[1]+1]
    let bloc = [bloc[0]+1, bloc[1]+1]
    
    var moveRec: [[Int]] = []
    var turn: Turn = .a
    
    func backtrackingDFS(board: [[Int]], aloc: [Int], bloc: [Int], aCount: Int, bCount: Int) {
        var board = board
//        for row in board { print(row) }
//        print("----- a: \(aloc), b: \(bloc)")
        switch turn {
        case .a:
            if board.value(of: aloc) == 0 { moveRec.append([0, aCount, bCount]); return }
            board[aloc[0]][aloc[1]] = 0
            
            turn = .b
            let possibleMoves = board.possibleMoves(from: aloc)
            if possibleMoves.isEmpty { moveRec.append([0, aCount, bCount]); return }
            
            for move in possibleMoves {
                backtrackingDFS(board: board, aloc: move, bloc: bloc, aCount: aCount+1, bCount: bCount)
            }
            
        case .b:
            if board.value(of: bloc) == 0 { moveRec.append([1, aCount, bCount]); return }
            board[bloc[0]][bloc[1]] = 0
            
            turn = .a
            let possibleMoves = board.possibleMoves(from: bloc)
            if possibleMoves.isEmpty { moveRec.append([1, aCount, bCount]); return }
            
            for move in possibleMoves {
                backtrackingDFS(board: board, aloc: aloc, bloc: move, aCount: aCount, bCount: bCount+1)
            }
        }
    }
    
    backtrackingDFS(board: newBoard, aloc: aloc, bloc: bloc, aCount: 0, bCount: 0)
    
    moveRec = moveRec.filter { rec in
        let loser = rec[0]
        switch loser {
        case 0: return rec[1] == rec[2]
        case 1: return rec[1] == rec[2] + 1
        default: return false
        }
    }
    print(moveRec)
    
    let loserRec = moveRec.map { $0[0] }
    var loserCount = (a: 0, b: 0)
    for rec in loserRec {
        if rec == 0 { loserCount.a += 1 }
        if rec == 1 { loserCount.b += 1 }
    }
    let loser = loserCount.a > loserCount.b ? 0 : 1
    let trueLoserRec = moveRec
        .filter { $0[0] == loser }
        .sorted(by: { $0[2] > $1[2] })
        .first!
    
    return trueLoserRec[1] + trueLoserRec[2]
}

extension Array where Element == [Int] {
    func value(of loc: [Int]) -> Int { return self[loc[0]][loc[1]] }

    func up(from loc: [Int]) -> Int { return self[loc[0]-1][loc[1]] }
    func down(from loc: [Int]) -> Int { return self[loc[0]+1][loc[1]] }
    func left(from loc: [Int]) -> Int { return self[loc[0]][loc[1]-1] }
    func right(from loc: [Int]) -> Int { return self[loc[0]][loc[1]+1] }

    func possibleMoves(from loc: [Int]) -> [[Int]] {
        var moves: [[Int]] = []
        if up(from: loc) == 1 { moves.append([loc[0]-1, loc[1]]) }
        if down(from: loc) == 1 { moves.append([loc[0]+1, loc[1]]) }
        if left(from: loc) == 1 { moves.append([loc[0], loc[1]-1]) }
        if right(from: loc) == 1 { moves.append([loc[0], loc[1]+1]) }
        return moves
    }
}

//print(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1,0], [1,2]))
//print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 1]], [1,0], [1,2]))
//print(solution([[1,1,1,1,1]], [0,0], [0,4]))

//extension Array where Element == [Int] {
//    func value(of loc: [Int]) -> Int { return self[loc[0]][loc[1]] }
//    
//    func allMoves(from loc: [Int]) -> [[Int]] {
//        var moves: [[Int]] = []
//        if loc[0]-1 >= 0 { moves.append([loc[0]-1, loc[1]]) }
//        if loc[0]+1 < self.count { moves.append([loc[0]+1, loc[1]]) }
//        if loc[1]-1 >= 0 { moves.append([loc[0], loc[1]-1]) }
//        if loc[1]+1 < self.first!.count { moves.append([loc[0], loc[1]+1]) }
//        return moves
//    }
//}




//func solution(_ board: [[Int]], _ aloc: [Int], _ bloc: [Int]) -> Int {
//    
//    var newBoard: [[Int]] = []
//    let boardW = board.first!.count
//    newBoard.append(.init(repeating: 0, count: boardW + 2))
//    for row in board { newBoard.append([0] + row + [0]) }
//    newBoard.append(.init(repeating: 0, count: boardW + 2))
//    
//    var aloc = [aloc[0]+1, aloc[1]+1]
//    var aNeedVisit: [[Int]] = [[]]
//    var aVisited: [[Int]] = []
//    var aMoveCount = 0
//    
//    var bloc = [bloc[0]+1, bloc[1]+1]
//    var bNeedVisit: [[Int]] = [[]]
//    var bVisited: [[Int]] = []
//    var bMoveCount = 0
//    
//    var moveRec: [[Int]] = []
//    var turn: Turn = .a
//    
//    while !aNeedVisit.isEmpty && !bNeedVisit.isEmpty {
//        switch turn {
//        case .a:
//            if newBoard.value(of: aloc) == 0 {
//                moveRec.append([aMoveCount, bMoveCount])
//                print("-1")
//                aloc = aVisited.removeLast()
//                newBoard[aloc[0]][aloc[1]] = 1
//                aMoveCount -= 1
//                continue
//            }
//            
//            newBoard[aloc[0]][aloc[1]] = 0
//            aMoveCount += 1
//            aVisited.append(aloc)
//            
//            let aPossibleMoves = newBoard.possibleMoves(from: aloc)
//            if aPossibleMoves.isEmpty {
//                moveRec.append([aMoveCount, bMoveCount])
//                print("-2")
//                aloc = aVisited.removeLast()
//                newBoard[aloc[0]][aloc[1]] = 1
//                aMoveCount -= 1
//                continue
//            }
//            aNeedVisit += aPossibleMoves
//            aloc = aNeedVisit.removeLast()
//            turn = .b
//            
//            for row in newBoard { print(row) }
//            print("-", aloc)
//        case .b:
//            if newBoard.value(of: bloc) == 0 {
//                moveRec.append([aMoveCount, bMoveCount])
//                print("-3")
//                bloc = bVisited.removeLast()
//                newBoard[bloc[0]][bloc[1]] = 1
//                bMoveCount -= 1
//                continue
//            }
//            
//            newBoard[bloc[0]][bloc[1]] = 0
//            bMoveCount += 1
//            bVisited.append(bloc)
//            
//            let bPossibleMoves = newBoard.possibleMoves(from: bloc)
//            if bPossibleMoves.isEmpty {
//                moveRec.append([aMoveCount, bMoveCount])
//                print("-4")
//                bloc = bVisited.removeLast()
//                newBoard[bloc[0]][bloc[1]] = 1
//                bMoveCount -= 1
//                continue
//            }
//            bNeedVisit += bPossibleMoves
//            bloc = bNeedVisit.removeLast()
//            turn = .a
//            
//            for row in newBoard { print(row) }
//            print("-", bloc)
//        }
//    }
//    
//    return 0
//}

//func solution(_ board: [[Int]], _ aloc: [Int], _ bloc: [Int]) -> Int {
//    
//    var newBoard: [[Int]] = []
//    var boardH = board.count
//    var boardW = board.first!.count
//    newBoard.append(.init(repeating: 0, count: boardW + 2))
//    for row in board { newBoard.append([0] + row + [0]) }
//    newBoard.append(.init(repeating: 0, count: boardW + 2))
//    
//    var aloc = [aloc[0]+1, aloc[1]+1]
//    var bloc = [bloc[0]+1, bloc[1]+1]
//    
//    var moveRec: [(a: Int, b: Int)] = []
//    
//    var aNeedVisit: [[Int]] = [aloc]
//    var aVisited: [[Int]] = []
//    
//    var bNeedVisit: [[Int]] = [bloc]
//    var bVisited: [[Int]] = []
//    
//    var aMoveCount = 0
//    var bMoveCount = 0
//    
//    while !aNeedVisit.isEmpty && !bNeedVisit.isEmpty {
//        if newBoard.value(of: aloc) == 0 { 
//            moveRec.append((aMoveCount, bMoveCount))
//            continue
//        }
//        
//        let aPossibleMoves = newBoard.possibleMoves(from: aloc)
//        if aPossibleMoves.isEmpty { 
//            moveRec.append((aMoveCount, bMoveCount))
//            continue
//        }
//        else { aNeedVisit += aPossibleMoves }
//        
//        newBoard[aloc[0]][aloc[1]] = 0
//        aMoveCount += 1
//        aloc = aNeedVisit.removeLast()
//        
//        if newBoard.value(of: bloc) == 0 {
//            moveRec.append((aMoveCount, bMoveCount))
//            continue
//        }
//        
//        let bPossibleMoves = newBoard.possibleMoves(from: bloc)
//        if bPossibleMoves.isEmpty {
//            moveRec.append((aMoveCount, bMoveCount))
//            continue
//        }
//        else { bNeedVisit += bPossibleMoves }
//        
//        newBoard[bloc[0]][bloc[1]] = 0
//        bMoveCount += 1
//        bloc = bNeedVisit.removeLast()
//    }
//    
//    print(moveRec)
//    
//    
//    return -1
//}


