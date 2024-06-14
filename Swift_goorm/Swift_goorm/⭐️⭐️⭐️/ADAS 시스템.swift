//
//  ADAS 시스템.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/13/24.
//

import Foundation

// PriorityQueue 만들기
struct Node {
    let y: Int
    let x: Int
    let c: String
    let priority: Int
    
    init(_ y: Int, _ x: Int, _ c: String) {
        self.y = y
        self.x = x
        self.c = c
        
        var cPriority: Int = 0
        if c == "E" { cPriority = 2 }
        else if c == "P" { cPriority = 1 }
        self.priority = cPriority * 1_000_000 + (-1) * (y * 1_000 + x)
    }
}

extension Node {
//    func isPriorThan(_ node: Node) -> Bool {
//        if self.c == "E" { return true }
//        else if node.c == "E" { return false }
//        else if self.c == "P" {
//            if node.c == "P" {
//                if self.y < node.y { return true }
//                else if self.y == node.y { return self.x < node.x }
//                else { return false }
//            }
//            else { return true }
//        }
//        else {
//            if node.c == "P" { return false }
//            else {
//                if self.y < node.y { return true }
//                else if self.y == node.y { return self.x < node.x }
//                else { return false }
//            }
//        }
//    }
    
    func isPriorThan(_ node: Node) -> Bool {
        self.priority > node.priority
    }
}

class Heap {
    var data: [Node] = []
    
    var isEmpty: Bool { data.count <= 1 }
}

extension Heap {
    func insert(_ node: Node) {
        if data.isEmpty { data.append(node) }
        data.append(node)
        
        sortUp()
    }
    
    func remove() -> Node? {
        guard !isEmpty else { return nil }
        
        let val = data[1]
        data.swapAt(1, data.count - 1)
        data.removeLast()
        sortDown(from: 1)
        return val
    }
    
    func sortUp() {
        var c = data.count - 1
        
        while c > 1 {
            let p = c / 2
            
            if data[c].isPriorThan(data[p]) {
                data.swapAt(c, p)
                c = p
            } else {
                break
            }
        }
    }
    
    func sortDown(from root: Int) {
        let p = root
        let lc = p * 2
        let rc = p * 2 + 1
        
        if lc > data.count - 1 { return } // 자식이 없는 경우
        else if lc == data.count - 1 { // 왼쪽 자식만 있는 경우
            if data[lc].isPriorThan(data[p]) {
                data.swapAt(lc, p)
                sortDown(from: lc)
            }
        }
        else { // 양쪽 자식 다 있는 경우 ( lc < data.count - 1 )
            if data[lc].isPriorThan(data[rc]) { // 왼쪽 자식의 우선순위가 더 높은 경우
                if data[lc].isPriorThan(data[p]) {
                    data.swapAt(lc, p)
                    sortDown(from: lc)
                }
            }
            else {
                if data[rc].isPriorThan(data[p]) { // 오른쪽 자식의 우선순위가 더 높은 경우
                    data.swapAt(rc, p)
                    sortDown(from: rc)
                }
            }
        }
    }
}



let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let h: Int = input[0]
let w: Int = input[1]

var start: Node!
var end: Node!
var map: [[String]] = []

for y in 0..<h {
    let row = readLine()!.map { String($0) }
    for x in 0..<w {
        if row[x] == "S" { start = .init(y, x, "S") }
        if row[x] == "E" { end = .init(y, x, "E") }
    }
    map.append(row)
}

func isValidPosition(_ y: Int, _ x: Int) -> Bool {
    guard 0 <= y && y < h, 0 <= x && x < w else { return false }
    return true
}

func nextNodes(_ cn: Node) -> [Node] {
    let dy = [-1, 1, 0, 0]
    let dx = [0, 0, -1, 1]
    
    var next: [Node] = []
    for i in 0..<4 {
        let ny = cn.y + dy[i]
        let nx = cn.x + dx[i]
        guard isValidPosition(ny, nx), !visited[ny][nx] else { continue }
        next.append(.init(ny, nx, map[ny][nx]))
    }
    return next
}

func dangerPointAt(_ node: Node) -> Int {
    var dangerPoint = node.c == "P" ? -3 : 0
    
    for dy in -1...1 {
        for dx in -1...1 {
            let ny = node.y + dy
            let nx = node.x + dx
            guard isValidPosition(ny, nx), !(dy == 0 && dx == 0) else { continue }
            dangerPoint += map[ny][nx] == "P" ? 1 : 0
        }
    }
    return dangerPoint
}

func ADAS() {
    var dangerPoint: Int = 0
    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: w), count: h)
    var pq: Heap = .init()
    pq.insert(start)

    while true {
        guard let node = pq.remove() else { break }
        
        if node.c == "E" { break }
        
        guard !visited[node.y][node.x] else { continue }
        visited[node.y][node.x] = true
        dangerPoint += dangerPointAt(node)
        
        for nextNode in nextNodes(node) {
            pq.insert(nextNode)
        }
        print(pq.data)
    }

    let result = dangerPoint - dangerPointAt(start)
    if result < 0 { print(0) }
    else { print(result) }
}







//struct Pos {
//    let c: String
//    let y: Int
//    let x: Int
//}
//
//extension Pos {
//    func isPriorThan(_ pos: Pos) -> Bool {
//        if self.c == "E" { return true }
//        else if self.c == "P" {
//            if pos.c == "E" { return false }
//            else if pos.c == "P" {
//                if self.y < pos.y { return true }
//                else if self.y == pos.y { return self.x < pos.x }
//                else { return false }
//            }
//            else { return false }
//        }
//        else {
//            if (pos.c == "E" || pos.c == "P") { return false }
//            else {
//                if self.y < pos.y { return true }
//                else if self.y == pos.y { return self.x < pos.x }
//                else { return false }
//            }
//        }
//    }
//}
//
//struct PriorityQueue {
//    var contents: [Pos]
//
//    init(_ first: Pos) {
//        contents = [first, first]
//    }
//
//    var isEmpty: Bool { contents.count <= 1 }
//}
//
//extension PriorityQueue {
//    mutating func sortUp() {
//        var c = contents.count - 1
//        var p: Int { c / 2 }
//
//        while c != 1 {
//            guard contents[c].isPriorThan(contents[p]) else { break }
//            contents.swapAt(c, p)
//            c = p
//        }
//    }
//
//    mutating func sortDown(_ root: Int) {
//        guard contents[p].isPriorThan(<#T##pos: Pos##Pos#>)
//
//        var p = root
//        var lc: Int { p * 2 }
//        var rc: Int { p * 2 + 1 }
//
//    }
//
//    mutating func push(_ pos: Pos) {
//        contents.append(pos)
//        self.sortUp()
//    }
//
//    mutating func pop() -> Pos? {
//        guard !isEmpty else { return nil }
//
//        let returnValue = contents[1]
//        contents.swapAt(1, contents.count - 1)
//
//        sortDown(1)
//        return returnValue
//    }
//}
//
//
//
//let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
//let h: Int = input[0]
//let w: Int = input[1]
//
//var start: (y: Int, x: Int) = (0, 0)
//var end: (y: Int, x: Int) = (0, 0)
//var map: [[String]] = []
//
//for y in 0..<h {
//    let row = readLine()!.map { String($0) }
//    for x in 0..<w {
//        if row[x] == "S" { start = (y, x) }
//        if row[x] == "E" { end = (y, x) }
//    }
//    map.append(row)
//}
//
//
//func isValidPosition(_ y: Int, _ x: Int) -> Bool {
//    guard 0 <= y && y < h, 0 <= x && x < w else { return false }
//    return true
//}
//
//func findNextPositions(_ y: Int, _ x: Int) -> [(y: Int, x: Int)] {
//    var positions: [(y: Int, x: Int)] = []
//
//    let dy: [Int] = [-1, 0, 0, 1]
//    let dx: [Int] = [0, -1, 1, 0]
//    for i in 0..<4 {
//        let ny = y + dy[i]
//        let nx = x + dx[i]
//        if isValidPosition(ny, nx) { positions.append((ny, nx)) }
//    }
//
//    var values: [String] = positions.map { map[$0.y][$0.x] }
//    var sorted: [(y: Int, x: Int)] = []
//
//    if let eIndex = values.firstIndex(of: "E") {
//        values.remove(at: eIndex)
//        sorted.append(positions.remove(at: eIndex))
//    }
//    while true {
//        guard let pIndex = values.firstIndex(of: "P") else { break }
//        values.remove(at: pIndex)
//        sorted.append(positions.remove(at: pIndex))
//    }
//    sorted += positions
//
//    return sorted
//}
//
//func dangerPointAt(_ y: Int, _ x: Int) -> Int {
//    var point: Int = map[y][x] == "P" ? -3 : 0
//
//    for dy in -1...1 {
//        for dx in -1...1 {
//            guard !(dy == 0 && dx == 0) else { continue }
//
//            let ny = y + dy
//            let nx = x + dx
//            guard isValidPosition(ny, nx) else { continue }
//
//            if map[ny][nx] == "P" { point += 1 }
//        }
//    }
//
//    return point
//}
//
//
//var needVisit: [(y: Int, x: Int)] = [start]
//var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: w), count: h)
//
//var result: Int = 0
//while !needVisit.isEmpty {
//    let pos = needVisit.removeLast()
//    if pos.y == end.y && pos.x == end.x { break }
//
//    guard !visited[pos.y][pos.x] else { continue }
//    visited[pos.y][pos.x] = true
//
//    result += dangerPointAt(pos.y, pos.x)
//    needVisit += findNextPositions(pos.y, pos.x).reversed()
//}
//
//result -= dangerPointAt(start.y, start.x)
//print(max(result, 0))













//struct Pos: Equatable {
//    let y: Int
//    let x: Int
//
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//extension Pos {
//    func surroundingPos(_ H: Int, _ W: Int) -> [Pos] {
//        var returnVal: [Pos] = []
//
//        // 우선순위대로 추가
//        if y-1 >= 0 { returnVal.append(.init(y-1, x)) }
//        if x-1 >= 0 { returnVal.append(.init(y, x-1)) }
//        if x+1 < W { returnVal.append(.init(y, x+1)) }
//        if y+1 < H { returnVal.append(.init(y+1, x)) }
//
//        return returnVal
//    }
//}
//
//struct Map {
//    var content: [[String]] = []
//
//    var visited: [[Bool]]
//    var h: Int
//    var w: Int
//
//    init(_ h: Int, _ w: Int) {
//        self.h = h
//        self.w = w
//        self.visited = .init(repeating: .init(repeating: false, count: w), count: h)
//    }
//}
//
//extension Map {
//    mutating func appendRow(_ row: [String]) {
//        self.content.append(row)
//    }
//
//    mutating func visit(_ pos: Pos) {
//        self.visited[pos.y][pos.x] = true
//    }
//
//    func valueAt(_ pos: Pos) -> String {
//        self.content[pos.y][pos.x]
//    }
//
//    func dangerPointAt(_ pos: Pos) -> Int {
//        var point = valueAt(pos) == "P" ? -3 : 0
//        for dy in -1...1 {
//            for dx in -1...1 {
//                if dy == 0 && dx == 0 { continue }
//
//                let np: Pos = .init(pos.y+dy, pos.x+dx)
//                guard 0 <= np.y && np.y < h, 0 <= np.x && np.x < w
//                else { continue }
//
//                if valueAt(np) == "P" { point += 1 }
//            }
//        }
//        print(pos, point)
//        return point
//    }
//
//    mutating func calcDangerPoint(
//        start sp: Pos,
//        current cp: Pos,
//        end ep: Pos
//    ) -> (point: Int, isDone: Bool) {
//
//        visit(cp)
//
//        var dangerPoint = sp == cp ? 0 : dangerPointAt(cp)
//
//        var candidates: [Pos] = cp
//            .surroundingPos(h, w)
//            .filter { !visited[$0.y][$0.x] }
//        let values: [String] = candidates.map(valueAt)
//
//        var nextPos: [Pos] = []
//        if values.contains("E") {
//            return (dangerPoint, true)
//        }
//
//        if let i = values.firstIndex(of: "P") {
//            nextPos.append(candidates.remove(at: i))
//        }
//        nextPos += candidates
//
//        for pos in nextPos {
//            let (dp, isDone) = calcDangerPoint(start: sp, current: pos, end: ep)
//            dangerPoint += dp
//
//            if isDone { return (dangerPoint, true) }
//        }
//
//        return (dangerPoint, false)
//    }
//}
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let h = input[0]
//let w = input[1]
//
//var start: Pos = .init(0, 0)
//var end: Pos = .init(0, 0)
//var map: Map = .init(h, w)
//for y in 0..<h {
//    let row = readLine()!.map { String($0) }
//    map.appendRow(row)
//
//    for x in 0..<w {
//        if row[x] == "S" { start = .init(y, x) }
//        if row[x] == "E" { end = .init(y, x) }
//    }
//}
//
//print(map.calcDangerPoint(start: start, current: start, end: end).point)


//// 자료구조 - Pos
//struct Pos: Equatable {
//    let y: Int
//    let x: Int
//    
//    init(_ y: Int, _ x: Int) {
//        self.y = y
//        self.x = x
//    }
//}
//
//extension Pos {
//    func surroundingPoints(_ H: Int, _ W: Int) -> [Pos] {
//        var returnVal: [Pos] = []
//        
//        // 우선순위대로 추가
//        if y-1 >= 0 { returnVal.append(.init(y-1, x)) }
//        if x-1 >= 0 { returnVal.append(.init(y, x-1)) }
//        if x+1 < W { returnVal.append(.init(y, x+1)) }
//        if y+1 < H { returnVal.append(.init(y+1, x)) }
//        
//        return returnVal
//    }
//}
//
//// 자료구조 - Road
//struct Road {
//    var content: [[String]] = []
//    
//    var visited: [[Bool]]
//    var height: Int
//    var width: Int
//    
//    init(_ h: Int, _ w: Int) {
//        self.visited = .init(repeating: .init(repeating: false, count: w), count: h)
//        self.height = h
//        self.width = w
//    }
//}
//
//extension Road {
//    mutating func appendMap(_ row: [String]) {
//        content.append(row)
//    }
//    
//    mutating func visited(_ pos: Pos) {
//        visited[pos.y][pos.x] = true
//    }
//    
//    func valueAt(_ pos: Pos) -> String {
//        return content[pos.y][pos.x]
//    }
//    
//    func dangerPointAt(_ pos: Pos) -> Int {
//        var point = valueAt(pos) == "P" ? -3 : 0
//        for dy in -1...1 {
//            for dx in -1...1 {
//                let np: Pos = .init(pos.y+dy, pos.x+dx)
//                guard np != pos,
//                    0 <= np.y && np.y < height,
//                    0 <= np.x && np.x < width
//                else { continue }
//                
//                if valueAt(np) == "P" { point += 1 }
//            }
//        }
//        return point
//    }
//    
//    func nextPos(_ cp: Pos) -> Pos {
//        let points = cp
//            .surroundingPoints(height, width)
//            .filter { !visited[$0.y][$0.x] }
//        let values = points.map(valueAt)
//        
//        if let eIndex = values.firstIndex(of: "E") { return points[eIndex] }
//        else if let pIndex = values.firstIndex(of: "P") { return points[pIndex] }
//        
//        return points.first!
//    }
//}
//
//// 값 입력
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let H = input[0] // 위아래
//let W = input[1] // 좌우
//
//var start: Pos = .init(0, 0)
//var end: Pos = .init(0, 0)
//
//var roads: Road = .init(H, W)
//for y in 0..<H {
//    let row = readLine()!.map { String($0) }
//    roads.appendMap(row)
//    
//    for x in 0..<W {
//        if row[x] == "S" { start = .init(y, x) }
//        if row[x] == "E" { end = .init(y, x) }
//    }
//}
//
//var result = 0
//var pos = start
//while pos != end {
//    roads.visited(pos)
//    result += roads.dangerPointAt(pos)
//    pos = roads.nextPos(pos)
//    print(pos)
//}
//
//print(result)
