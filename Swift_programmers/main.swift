//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

//struct Position: Hashable {
//    let r: Int
//    let c: Int
//}
//
//func solution(_ commands: [String]) -> [String] {
//    
//    var valueTable: [[String]] = .init(repeating: .init(repeating: "EMPTY", count: 50),
//                                       count: 50)
//    var positionTable: [String: Set<Position>] = [:]
//    positionTable["EMPTY"] = []
//    for r in 1...50 {
//        for c in 1...50 {
//            positionTable["EMPTY"]!.insert(.init(r: r, c: c))
//        }
//    }
//    
//    func update(r: Int, c: Int, value: String) {
//        // value들은 EMPTY가 아님
//        valueTable[r-1][c-1] = value
//        
//        if positionTable[value] == nil { positionTable[value] = [.init(r: r, c: c)] }
//        else { positionTable[value]!.insert(.init(r: r, c: c)) }
//    }
//    
//    func update(value1: String, value2: String) {
//        // value들은 EMPTY가 아님
//        if let cells = positionTable.removeValue(forKey: value1) {
//            for pos in cells { valueTable[pos.r-1][pos.c-1] = value2 }
//            positionTable[value2] = cells
//        }
//    }
//    
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//        if r1 == r2 && c1 == c2 { return }
//        
//        let value1 = valueTable[r1-1][c1-1]
//        let value2 = valueTable[r2-1][c2-1]
//        // value들은 EMPTY일 수 있음
//        if value1 == "EMPTY" && value2 != "EMPTY" {
//            valueTable[r1-1][c1-1] = value2
//            let cell1: Position = .init(r: r1, c: c1)
//            positionTable[value1]!.remove(cell1)
//            positionTable[value2]!.insert(cell1)
//        }
//        else if value1 != "EMPTY" {
//            valueTable[r2-1][c2-1] = value1
//            let cell2: Position = .init(r: r2, c: c2)
//            positionTable[value2]!.remove(cell2)
//            positionTable[value1]!.insert(cell2)
//        }
//    }
//    
//    func unmerge(r: Int, c: Int) {
//        let value = valueTable[r-1][c-1]
//        // value들은 EMPTY일 수도 있음
//        guard let positions = positionTable[value] else { return }
//        for pos in positions {
//            
//        }
//    }
//    
//    
//    return []
//}

//struct Position: Hashable {
//    let r: Int
//    let c: Int
//}
//
//func solution(_ commands: [String]) -> [String] {
//    
//    var positionTable: [[String]] = .init(repeating: .init(repeating: "EMPTY", count: 50), count: 50)
//    // 위치 -> String
//    var valueTable: [String: Set<Position>] = [:] // String -> 위치들
//    valueTable["EMPTY"] = []
//    for r in 1...50 {
//        for c in 1...50 {
//            valueTable["EMPTY"]!.insert(.init(r: r, c: c))
//        }
//    }
//    var mergeTable: [String: Set<Position>] = [:] // String -> 병합된 위치들
//    
//    func update(r: Int, c: Int, value: String) {
//        /// `(r, c)` 위치의 값을 `value`로 수정
//        let originalVal = positionTable[r][c]
//        if valueTable[value] == nil {
//            valueTable[value]
//            positionTable[r][c] = value
//        }
//    }
//    
//    func update(value1: Int, value2: Int) {
//        /// `value1`에 해당하는 `모든 값`을 `value2`로 수정
//    }
//    
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//        /// `(r1, c1)`의 셀과 `(r2, c2)`의 셀을 병합
//    }
//    
//    func unmerge(r: Int, c: Int) {
//        /// `(r, c)` 위치의 셀을 병합 해제
//    }
//    
//    func print(r: Int, c: Int) {
//        
//    }
//    
//    return []
//}


struct Position: Hashable {
    let r: Int
    let c: Int
}

class Merged {
    var value: String
    var positions: Set<Position>
    
    init(value: String = "EMPTY", positions: Set<Position> = []) {
        self.value = value
        self.positions = positions
    }
}

extension Merged {
    static func merge(_ merged1: Merged, _ merged2: Merged) -> Merged {
        if merged1.value != "EMPTY" {
            return .init(value: merged1.value, positions: merged1.positions.union(merged2.positions))
        }
        else if merged2.value != "EMPTY" {
            return .init(value: merged2.value, positions: merged1.positions.union(merged2.positions))
        }
        else {
            return .init(positions: merged1.positions.union(merged2.positions))
        }
    }
}


func solution(_ commands: [String]) -> [String] {
    
    var result: [String] = []
    
    var positions: Set<Position> = []
    for r in 1...50 { for c in 1...50 { positions.insert(.init(r: r, c: c)) } }
    
    // 해당 값을 갖는 위치들
    var positionTable: [String: Set<Position>] = [:]
    // merge된 것들을 기록하기 위한 테이블
    var mergedTable: [Position: Merged] = [:] // 하나의 Set을 바라보도록 하기 위해
    for position in positions { mergedTable[position] = .init(positions: [position]) }
    
    func update(r: Int, c: Int, value: String) {
        /// `(r, c)` 위치의 값을 `value`로 수정
        let pos: Position = .init(r: r, c: c)
        let positions = mergedTable[pos]!.positions
        
        if positionTable[value] == nil { positionTable[value] = positions }
        else { positionTable[value]!.formUnion(positions) }
        
        mergedTable[pos]!.value = value
    }
    
    func update(value1: String, value2: String) {
        /// `value1`에 해당하는 `모든 값`을 `value2`로 수정
        if let positions = positionTable.removeValue(forKey: value1) {
            // value1에 해당하는 위치값들을 통째로 삭제하고
            // value2에 해당하는 위치값으로 설정
            if positionTable[value2] == nil { positionTable[value2] = positions }
            else { positionTable[value2]!.formUnion(positions) }
            // value1이었던 것들의 value를 value2로 변경
            for pos in positions {
                mergedTable[pos]!.value = value2
            }
        }
    }
    
    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
        /// `(r1, c1)`의 셀과 `(r2, c2)`의 셀을 병합
        let pos1: Position = .init(r: r1, c: c1)
        let pos2: Position = .init(r: r2, c: c2)
        let merged1 = mergedTable[pos1]!
        let merged2 = mergedTable[pos2]!
        let newMerged = Merged.merge(merged1, merged2)
        
        if positionTable[newMerged.value] == nil { positionTable[newMerged.value] = newMerged.positions }
        else { positionTable[newMerged.value]!.formUnion(newMerged.positions) }
        
        for pos in newMerged.positions {
            mergedTable[pos] = newMerged
        }
    }
    
    func unmerge(r: Int, c: Int) {
        /// `(r, c)` 위치의 셀을 병합 해제
        let pos: Position = .init(r: r, c: c)
        let value = mergedTable[pos]!.value
        var positions = mergedTable[pos]!.positions
        
        positions.remove(pos)
        
        if positionTable["EMPTY"] == nil { positionTable["EMPTY"] = positions }
        else { positionTable["EMPTY"]!.formUnion(positions) }
        
        if positionTable[value] == nil { positionTable[value] = [pos] }
        else { positionTable[value]!.insert(pos) }
        
        mergedTable[pos] = .init(value: value, positions: [pos])
        for p in positions {
            let newMerged: Merged = .init(positions: [p])
            mergedTable[p] = newMerged
        }
    }
    
    func printOp(r: Int, c: Int) {
        let value = mergedTable[.init(r: r, c: c)]!.value
        result.append(value)
    }
    
    
    for command in commands {
        let cmd = command.split(separator: " ").map { String($0) }
        switch cmd[0] {
        case "UPDATE":
            if cmd.count == 4 { update(r: Int(cmd[1])!, c: Int(cmd[2])!, value: cmd[3]) }
            else { update(value1: cmd[1], value2: cmd[2]) }
        case "MERGE":
            merge(r1: Int(cmd[1])!, c1: Int(cmd[2])!, r2: Int(cmd[3])!, c2: Int(cmd[4])!)
        case "UNMERGE":
            unmerge(r: Int(cmd[1])!, c: Int(cmd[2])!)
        case "PRINT":
            printOp(r: Int(cmd[1])!, c: Int(cmd[2])!)
        default: continue
        }
    }
    
    
    return result
}


//print(solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]))

//print(solution(["UPDATE 1 1 a", "UPDATE 1 2 b", "UPDATE 2 1 c", "UPDATE 2 2 d", "MERGE 1 1 1 2", "MERGE 2 2 2 1", "MERGE 2 1 1 1", "PRINT 1 1", "UNMERGE 2 2", "PRINT 1 1"]))

//print(solution(["MERGE 1 1 1 2","MERGE 1 2 1 1", "PRINT 1 1"]))
