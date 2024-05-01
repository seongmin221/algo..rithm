//
//  표 병합.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/18/24.
//

import Foundation

class Trie {
    var contents: [Character: Trie] = [:]
    var isLast: Bool = false
}

extension Trie {
    func insert(_ chars: [Character]) {
        var temp = self
        for char in chars {
            if temp.contents[char] == nil { temp.contents[char] = .init() }
            temp = temp.contents[char]!
        }
        temp.isLast = true
    }
    
    func countMatching(_ chars: [Character]) -> Int {
        // find matching chars
        var trie = self
        for char in chars {
            guard let temp = trie.contents[char] else { return 0 }
            trie = temp
        }
        // dfs
        var result: Int = 0
        var needVisit: [Trie] = [trie]
        while !needVisit.isEmpty {
            let trie = needVisit.removeLast()
            if trie.isLast { result += 1 }
            needVisit += trie.contents.values
        }
        return result
    }
}

func solution(_ words: [String], _ queries: [String]) -> [Int] {
    
    func extractChars(from query: String) -> [Character] {
        var result: [Character] = []
        
        for c in query {
            guard c != "?" else { continue }
            result.append(c)
        }
        
        if query.first == "?" { return result.reversed() }
        else { return result }
    }
    
    var chars: [[Character]] = []
    for word in words { chars.append(word.map { $0 }) }
    
    var trieMap: [Int: Trie] = [:]
    for char in chars {
        let length = char.count
        
        if trieMap[length] == nil { trieMap[length] = .init() }
        trieMap[length]!.insert(char)
        trieMap[length]!.insert(char.reversed())
    }
    
    var result: [Int] = []
    for query in queries {
        let length = query.count
        guard let trie = trieMap[length] else {
            result.append(0)
            continue
        }
        let queryChars = extractChars(from: query)
        result.append(trie.countMatching(queryChars))
    }
    
    return result
}




//struct Queue<T> {
//    var head: Int = 0
//    var contents: [T] = []
//
//    init(_ contents: [T]) {
//        self.contents = contents
//    }
//
//    var isEmpty: Bool { head == contents.count }
//}
//
//extension Queue {
//    mutating func push(_ values: [T]) {
//        contents += values
//    }
//
//    mutating func pop() -> T {
//        let value = contents[head]
//        head += 1
//        return value
//    }
//}
//
//final class Trie {
//    var isLast: Bool = false
//    var charMap: [Character: Trie] = [:]
//}
//
//extension Trie {
//    func insert(_ word: String) {
//        let chars = word.map { $0 }
//        var temp = self
//        for char in chars {
//            if temp.charMap[char] == nil {
//                temp.charMap[char] = .init()
//            }
//            temp = temp.charMap[char]!
//        }
//        temp.isLast = true
//    }
//
//    func countFromRoot(_ chars: [Character]) -> Int {
//        // move downwards
//        var node = self
//        for char in chars {
//            if node.charMap[char] == nil { return 0 }
//            node = node.charMap[char]!
//        }
//        // bfs
//        var result: Int = 0
//
//        var needVisit: [Trie] = [node]
//        while !needVisit.isEmpty {
//            let node = needVisit.removeLast()
//            if node.isLast { result += 1; continue }
//            needVisit += node.charMap.values
//        }
//        return result
//    }
//
//    func countFromBottom(_ chars: [Character], _ wildCount: Int) -> Int {
//        // move downwards
//
//        func dfs(_ node: Trie, _ depth: Int) -> Int {
//            var result = 0
//
//            if depth == wildCount {
//                var node = node
//                for c in chars {
//                    if node.charMap[c] == nil { return 0 }
//                    else { node = node.charMap[c]! }
//                }
//                return node.isLast ? 1 : 0
//            }
//
//            for node in node.charMap.values {
//                result += dfs(node, depth + 1)
//            }
//            return result
//        }
//
//        return dfs(self, 0)
//    }
//}
//
//func solution(_ words: [String], _ queries: [String]) -> [Int] {
//
//    var trieTable: [Int: Trie] = [:]
//    for word in words {
//        let count = word.count
//        if trieTable[count] == nil { trieTable[count] = .init() }
//        trieTable[count]!.insert(word)
//    }
//
//    func splitWord(_ word: String) -> (chars: [Character], wildCount: Int) {
//        // split word and count ?
//        var chars: [Character] = []
//        var wildCount = 0
//        for c in word {
//            if c == "?" { wildCount += 1 }
//            else { chars.append(c) }
//        }
//        return (chars, wildCount)
//    }
//
//    var result: [Int] = []
//    for query in queries {
//        guard let trie = trieTable[query.count] else {
//            result.append(0)
//            continue
//        }
//
//        let (chars, wildCount) = splitWord(query)
//        if query.last! == "?" { result.append(trie.countFromRoot(chars)) }
//        else { result.append(trie.countFromBottom(chars, wildCount)) }
//    }
//
//    return result
//}

//import Foundation
//
//final class Trie {
//    var isLast: Bool = false
//    var charMap: [Character: Trie] = [:]
//}
//
//extension Trie {
//    func insert(_ word: String) {
//        let chars = word.map { $0 }
//        var temp = self
//        for char in chars {
//            if temp.charMap[char] == nil {
//                temp.charMap[char] = .init()
//            }
//            temp = temp.charMap[char]!
//        }
//        temp.isLast = true
//    }
//
//    func countFromRoot(_ chars: [Character]) -> Int {
//        // move downwards
//        var node = self
//        for char in chars {
//            if node.charMap[char] == nil { return 0 }
//            node = node.charMap[char]!
//        }
//        // dfs
//        func countMatching(from node: Trie, depth: Int) -> Int {
//            var result: Int = 0
//
//            var needVisit: [Trie] = [node]
//            while !needVisit.isEmpty {
//                let node = needVisit.removeLast()
//                if node.charMap.isEmpty {
//                    result += 1
//                    continue
//                }
//                needVisit += node.charMap.values
//            }
//
//            return result
//        }
//
//        return countMatching(from: node, depth: 0)
//    }
//
//    func countFromBottom(_ chars: [Character], _ wildCount: Int) -> Int {
//        // move downwards
//        func dfs(_ node: Trie, _ depth: Int) -> Int {
//            var result = 0
//
//            if depth == wildCount {
//                var node = node
//                for c in chars {
//                    if node.charMap[c] == nil { return 0 }
//                    else { node = node.charMap[c]! }
//                }
//                return node.isLast ? 1 : 0
//            }
//
//            for node in node.charMap.values {
//                result += dfs(node, depth + 1)
//            }
//            return result
//        }
//
//        return dfs(self, 0)
//    }
//}
//
//func solution(_ words: [String], _ queries: [String]) -> [Int] {
//
//    var trieTable: [Int: Trie] = [:]
//    for word in words {
//        let count = word.count
//        if trieTable[count] == nil { trieTable[count] = .init() }
//        trieTable[count]!.insert(word)
//    }
//
//    func splitWord(_ word: String) -> (chars: [Character], wildCount: Int) {
//        // split word and count ?
//        var chars: [Character] = []
//        var wildCount = 0
//        for c in word {
//            if c == "?" { wildCount += 1 }
//            else { chars.append(c) }
//        }
//        return (chars, wildCount)
//    }
//
//    var result: [Int] = []
//    for query in queries {
//        guard let trie = trieTable[query.count] else {
//            result.append(0)
//            continue
//        }
//
//        let (chars, wildCount) = splitWord(query)
//        if query.first! == "?" { result.append(trie.countFromBottom(chars, wildCount)) }
//        else { result.append(trie.countFromRoot(chars)) }
//    }
//
//    return result
//}

//print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))


//import Foundation
//
//final class Trie {
//    var isLast: Bool = false
//    var charMap: [Character: Trie] = [:]
//}
//
//extension Trie {
//    func insert(_ word: String) {
//        let chars = word.map { $0 }
//        var temp = self
//        for char in chars {
//            if temp.charMap[char] == nil {
//                temp.charMap[char] = .init()
//            }
//            temp = temp.charMap[char]!
//        }
//        temp.isLast = true
//    }
//
//    func countFromRoot(_ chars: [Character], _ wildCount: Int) -> Int {
//        // move downwards
//        var node = self
//        for char in chars {
//            if node.charMap[char] == nil { return 0 }
//            node = node.charMap[char]!
//        }
//        // dfs
//        func countMatching(from node: Trie, depth: Int) -> Int {
//            var result: Int = 0
//            if depth > wildCount { return 0 }
//            if node.isLast { return depth == wildCount ? 1 : 0 }
//
//            for child in node.charMap.values {
//                result += countMatching(from: child, depth: depth + 1)
//            }
//            return result
//        }
//
//        return countMatching(from: node, depth: 0)
//    }
//
//    func countFromBottom(_ chars: [Character], _ wildCount: Int) -> Int {
//        // move downwards
//        func dfs(_ node: Trie, _ depth: Int) -> Int {
//            var result = 0
//
//            if depth > wildCount || node.isLast { return 0 }
//
//            if depth == wildCount {
//                var node = node
//                for c in chars {
//                    if node.charMap[c] == nil { return 0 }
//                    else { node = node.charMap[c]! }
//                }
//                return node.isLast ? 1 : 0
//            }
//
//            for node in node.charMap.values {
//                result += dfs(node, depth + 1)
//            }
//            return result
//        }
//
//        return dfs(self, 0)
//    }
//}
//
//func solution(_ words: [String], _ queries: [String]) -> [Int] {
//
//     var wordsTable: [Int: [String]] = [:]
//     for word in words {
//         let count = word.count
//         if wordsTable[count] == nil { wordsTable[count] = [word] }
//         else { wordsTable[count]!.append(word) }
//     }
//
//    func splitWord(_ word: String) -> (chars: [Character], wildCount: Int) {
//        // split word and count ?
//        var chars: [Character] = []
//        var wildCount = 0
//        for c in word {
//            if c == "?" { wildCount += 1 }
//            else { chars.append(c) }
//        }
//        return (chars, wildCount)
//    }
//
//
//    let trie: Trie = .init()
//    for word in words {
//        trie.insert(word)
//    }
//
//
//    var result: [Int] = []
//    for query in queries {
//        let (chars, wildCount) = splitWord(query)
//
//        if wildCount == query.count {
//            result.append(words.filter({ $0.count == chars.count }).count)
//            continue
//        }
//
//        if query.first! == "?" { result.append(trie.countFromBottom(chars, wildCount)) }
//        else { result.append(trie.countFromRoot(chars, wildCount)) }
//    }
//
//    return result
//}



//struct Queue<T> {
//    var head: Int = 0
//    var contents: [T] = []
//
//    init(_ contents: [T]) {
//        self.contents = contents
//    }
//
//    var isEmpty: Bool { head == contents.count }
//}
//
//extension Queue {
//    mutating func push(_ values: [T]) {
//        contents += values
//    }
//
//    mutating func pop() -> T {
//        let value = contents[head]
//        head += 1
//        return value
//    }
//}

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


//struct Position: Hashable {
//    let r: Int
//    let c: Int
//}
//
//class Merged {
//    var value: String
//    var positions: Set<Position>
//
//    init(value: String = "EMPTY", positions: Set<Position> = []) {
//        self.value = value
//        self.positions = positions
//    }
//}
//
//extension Merged {
//    static func merge(_ merged1: Merged, _ merged2: Merged) -> Merged {
//        if merged1.value != "EMPTY" {
//            return .init(value: merged1.value, positions: merged1.positions.union(merged2.positions))
//        }
//        else if merged2.value != "EMPTY" {
//            return .init(value: merged2.value, positions: merged1.positions.union(merged2.positions))
//        }
//        else {
//            return .init(positions: merged1.positions.union(merged2.positions))
//        }
//    }
//}
//
//
//func solution(_ commands: [String]) -> [String] {
//
//    var result: [String] = []
//
//    var positions: Set<Position> = []
//    for r in 1...50 { for c in 1...50 { positions.insert(.init(r: r, c: c)) } }
//
//    // 해당 값을 갖는 위치들
//    var positionTable: [String: Set<Position>] = [:]
//    // merge된 것들을 기록하기 위한 테이블
//    var mergedTable: [Position: Merged] = [:] // 하나의 Set을 바라보도록 하기 위해
//    for position in positions { mergedTable[position] = .init(positions: [position]) }
//
//    func update(r: Int, c: Int, value: String) {
//        /// `(r, c)` 위치의 값을 `value`로 수정
//        let pos: Position = .init(r: r, c: c)
//        let positions = mergedTable[pos]!.positions
//
//        if positionTable[value] == nil { positionTable[value] = positions }
//        else { positionTable[value]!.formUnion(positions) }
//
//        mergedTable[pos]!.value = value
//    }
//
//    func update(value1: String, value2: String) {
//        /// `value1`에 해당하는 `모든 값`을 `value2`로 수정
//        if let positions = positionTable.removeValue(forKey: value1) {
//            // value1에 해당하는 위치값들을 통째로 삭제하고
//            // value2에 해당하는 위치값으로 설정
//            if positionTable[value2] == nil { positionTable[value2] = positions }
//            else { positionTable[value2]!.formUnion(positions) }
//            // value1이었던 것들의 value를 value2로 변경
//            for pos in positions {
//                mergedTable[pos]!.value = value2
//            }
//        }
//    }
//
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//        /// `(r1, c1)`의 셀과 `(r2, c2)`의 셀을 병합
//        let pos1: Position = .init(r: r1, c: c1)
//        let pos2: Position = .init(r: r2, c: c2)
//        let merged1 = mergedTable[pos1]!
//        let merged2 = mergedTable[pos2]!
//        let newMerged = Merged.merge(merged1, merged2)
//
//        for pos in merged1.positions { positionTable[merged1.value]?.remove(pos) }
//        for pos in merged2.positions { positionTable[merged2.value]?.remove(pos) }
//
//        if positionTable[newMerged.value] == nil { positionTable[newMerged.value] = newMerged.positions }
//        else { positionTable[newMerged.value]!.formUnion(newMerged.positions) }
//
//        for pos in newMerged.positions {
//            mergedTable[pos] = newMerged
//        }
//    }
//
//    func unmerge(r: Int, c: Int) {
//        /// `(r, c)` 위치의 셀을 병합 해제
//        let pos: Position = .init(r: r, c: c)
//        let value = mergedTable[pos]!.value
//        var positions = mergedTable[pos]!.positions
//
//        positions.remove(pos)
//
//        if positionTable["EMPTY"] == nil { positionTable["EMPTY"] = positions }
//        else { positionTable["EMPTY"]!.formUnion(positions) }
//
//        if positionTable[value] == nil { positionTable[value] = [pos] }
//        else { positionTable[value]!.insert(pos) }
//
//        mergedTable[pos] = .init(value: value, positions: [pos])
//        for p in positions {
//            let newMerged: Merged = .init(positions: [p])
//            mergedTable[p] = newMerged
//        }
//    }
//
//    func printOp(r: Int, c: Int) {
//        let value = mergedTable[.init(r: r, c: c)]!.value
//        result.append(value)
//    }
//
//
//    for command in commands {
//        let cmd = command.split(separator: " ").map { String($0) }
//        switch cmd[0] {
//        case "UPDATE":
//            if cmd.count == 4 { update(r: Int(cmd[1])!, c: Int(cmd[2])!, value: cmd[3]) }
//            else { update(value1: cmd[1], value2: cmd[2]) }
//        case "MERGE":
//            merge(r1: Int(cmd[1])!, c1: Int(cmd[2])!, r2: Int(cmd[3])!, c2: Int(cmd[4])!)
//        case "UNMERGE":
//            unmerge(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        case "PRINT":
//            printOp(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        default: continue
//        }
//    }
//
//
//    return result
//}


//struct Position: Hashable {
//    let r: Int
//    let c: Int
//}
//
//func solution(_ commands: [String]) -> [String] {
//    
//    var maxR: Int = 0
//    var maxC: Int = 0
//    for command in commands {
//        let cmdNums = command.split(separator: " ").compactMap { Int($0) }
//        for (i, num) in cmdNums.enumerated() {
//            if i % 2 == 1 { maxR = max(maxR, num) }
//            else { maxC = max(maxC, num) }
//        }
//    }
//    
//    
//    
//    func findRoot(of pos: Position) -> Position {
//    }
//    
//    
//    // actual commands
//    
//    func update(r: Int, c: Int, value: String) {
//    }
//    
//    func update(value1: String, value2: String) {
//    }
//    
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//    }
//    
//    func unmerge(r: Int, c: Int) {
//    }
//    
//    var result: [String] = []
//    func printOp(r: Int, c: Int) {
//    }
//    
//    
//    for command in commands {
//        print(command)
//        let cmd = command.split(separator: " ").map { String($0) }
//        switch cmd[0] {
//        case "UPDATE":
//            if cmd.count == 4 { update(r: Int(cmd[1])!, c: Int(cmd[2])!, value: cmd[3]) }
//            else { update(value1: cmd[1], value2: cmd[2]) }
//        case "MERGE":
//            merge(r1: Int(cmd[1])!, c1: Int(cmd[2])!, r2: Int(cmd[3])!, c2: Int(cmd[4])!)
//        case "UNMERGE":
//            unmerge(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        case "PRINT":
//            printOp(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        default: continue
//        }
//    }
//    
//    
//    return result
//}


//func solution(_ commands: [String]) -> [String] {
//
//    var valueMap: [[String]] = .init(repeating: .init(repeating: "EMPTY", count: 51),
//                                     count: 51)
//    // mergeMap[r1][c1] = (r2, c2) -> (r1, c1)은 (r2, c2)에 머지되어 있음
//    var mergeMap: [[(r: Int, c: Int)]] = .init(repeating: .init(repeating: (0, 0), count: 51),
//                                               count: 51)
//    for r in 1...50 { for c in 1...50 { mergeMap[r][c] = (r, c) } }
//
//    func findParentAndUpdate(r: Int, c: Int) -> (r: Int, c: Int) {
//        func recursive(r: Int, c: Int) -> (r: Int, c: Int) {
//            let (pr, pc) = mergeMap[r][c]
//            if pr == mergeMap[pr][pc].r && pc == mergeMap[pr][pc].c { return (pr, pc) }
//            mergeMap[pr][pc] = recursive(r: pr, c: pc)
//            return mergeMap[pr][pc]
//        }
//
//        return recursive(r: r, c: c)
//    }
//
//    // actual commands
//
//    func update(r: Int, c: Int, value: String) {
//        let (pr, pc) = findParentAndUpdate(r: r, c: c)
//        valueMap[pr][pc] = value
//    }
//
//    func update(value1: String, value2: String) {
//        for r in 1...50 {
//            for c in 1...50 {
//                guard valueMap[r][c] == value1 else { continue }
//                valueMap[r][c] = value2
//            }
//        }
//    }
//
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//        let (pr1, pc1) = findParentAndUpdate(r: r1, c: c1)
//        let (pr2, pc2) = findParentAndUpdate(r: r2, c: c2)
//        if valueMap[pr2][pc2] != "EMPTY" && valueMap[pr1][pc1] == "EMPTY" {
//            // 둘 다 EMPTY면, (r2, c2) -> (r1, c1)에 MERGE
//            mergeMap[pr1][pc1] = (pr2, pc2)
//            valueMap[pr1][pc1] = "EMPTY" // *
//        } else {
//            // (r1, c1)이 EMPTY가 아니면 (r2, c2) -> (r1, c1)에 MERGE
//            // (r1, c1)이 EMPTY이고, (r2, c2)가 EMPTY가 아니면 (r1, c1) -> (r2, c2)에 MERGE
//            mergeMap[pr2][pc2] = (pr1, pc1)
//            valueMap[pr2][pc2] = "EMPTY" // *
//        }
//    }
//
//    func unmerge(r: Int, c: Int) {
//        let (pr, pc) = findParentAndUpdate(r: r, c: c)
//        let value = valueMap[pr][pc]
//        valueMap[pr][pc] = "EMPTY"
//
//        for r in 1...50 {
//            for c in 1...50 {
//                let (tr, tc) = findParentAndUpdate(r: r, c: c)
//                guard tr == pr && tc == pc else { continue }
//                mergeMap[r][c] = (r, c)
//            }
//        }
//        valueMap[r][c] = value
//    }
//
//    var result: [String] = []
//    func printOp(r: Int, c: Int) {
//        let (pr, pc) = findParentAndUpdate(r: r, c: c)
//        result.append(valueMap[pr][pc])
//    }
//
//
//    for command in commands {
//        let cmd = command.split(separator: " ").map { String($0) }
//        switch cmd[0] {
//        case "UPDATE":
//            if cmd.count == 4 { update(r: Int(cmd[1])!, c: Int(cmd[2])!, value: cmd[3]) }
//            else { update(value1: cmd[1], value2: cmd[2]) }
//        case "MERGE":
//            merge(r1: Int(cmd[1])!, c1: Int(cmd[2])!, r2: Int(cmd[3])!, c2: Int(cmd[4])!)
//        case "UNMERGE":
//            unmerge(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        case "PRINT":
//            printOp(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        default: continue
//        }
//    }
//
//
//    return result
//}

//func solution(_ commands: [String]) -> [String] {
//    
//    var valueMap: [[String]] = .init(repeating: .init(repeating: "EMPTY", count: 51),
//                                     count: 51)
//    // mergeMap[r1][c1] = (r2, c2) -> (r1, c1)은 (r2, c2)에 머지되어 있음
//    var mergeMap: [[(r: Int, c: Int)]] = .init(repeating: .init(repeating: (0, 0), count: 51),
//                                               count: 51)
//    for r in 1...50 { for c in 1...50 { mergeMap[r][c] = (r, c) } }
//    
//    // actual commands
//    
//    func update(r: Int, c: Int, value: String) {
//        var (pr, pc) = mergeMap[r][c]
//        (pr, pc) = mergeMap[pr][pc]
//        valueMap[pr][pc] = value
//    }
//    
//    func update(value1: String, value2: String) {
//        for r in 1...50 {
//            for c in 1...50 {
//                guard valueMap[r][c] == value1 else { continue }
//                valueMap[r][c] = value2
//            }
//        }
//    }
//    
//    func merge(r1: Int, c1: Int, r2: Int, c2: Int) {
//        let (pr1, pc1) = mergeMap[r1][c1]
//        let (pr2, pc2) = mergeMap[r2][c2]
//        
//        if valueMap[pr1][pc1] == "EMPTY" {
//            valueMap[pr1][pc1] = valueMap[pr2][pc2]
//        }
//        for r in 1...50 {
//            for c in 1...50 {
//                if mergeMap[r][c] == (pr1, pc1) {
//                    valueMap[r][c] = valueMap[pr1][pc1]
//                }
//                else if mergeMap[r][c] == (pr2, pc2) {
//                    mergeMap[r][c] = (pr1, pc1)
//                    valueMap[r][c] = valueMap[pr1][pc1]
//                }
//            }
//        }
//    }
//    
//    func unmerge(r: Int, c: Int) {
//        let (pr, pc) = mergeMap[r][c]
//        let value = valueMap[pr][pc]
//        
//        for r in 1...50 {
//            for c in 1...50 {
//                let (tr, tc) = mergeMap[r][c]
//                guard tr == pr && tc == pc else { continue }
//                mergeMap[r][c] = (r, c)
//                valueMap[r][c] = "EMPTY"
//            }
//        }
//        valueMap[r][c] = value
//    }
//    
//    var result: [String] = []
//    func printOp(r: Int, c: Int) {
//        let (pr, pc) = mergeMap[r][c]
//        result.append(valueMap[pr][pc])
//    }
//    
//    
//    for command in commands {
//        let cmd = command.split(separator: " ").map { String($0) }
//        switch cmd[0] {
//        case "UPDATE":
//            if cmd.count == 4 { update(r: Int(cmd[1])!, c: Int(cmd[2])!, value: cmd[3]) }
//            else { update(value1: cmd[1], value2: cmd[2]) }
//        case "MERGE":
//            merge(r1: Int(cmd[1])!, c1: Int(cmd[2])!, r2: Int(cmd[3])!, c2: Int(cmd[4])!)
//        case "UNMERGE":
//            unmerge(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        case "PRINT":
//            printOp(r: Int(cmd[1])!, c: Int(cmd[2])!)
//        default: continue
//        }
//    }
//    
//    
//    return result
//}


//print(solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]))



//print(solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]))

//print(solution(["UPDATE 1 1 a", "UPDATE 1 2 b", "UPDATE 2 1 c", "UPDATE 2 2 d", "MERGE 1 1 1 2", "MERGE 2 2 2 1", "MERGE 2 1 1 1", "PRINT 1 1", "UNMERGE 2 2", "PRINT 1 1"]))
