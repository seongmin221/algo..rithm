//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/31/23.
//

import Foundation

func solution(_ land: [[Int]], _ height: Int) -> Int {
    
    let length = land.count
    let dy = [0, 0, 1, -1]
    let dx = [1, -1, 0, 0]
    
    var board: [[Int]] = .init(repeating: .init(repeating: -1, count: length+2), count: length+2)
    var visited: [[Int]] = .init(repeating: .init(repeating: -1, count: length+2), count: length+2)
    for i in 0..<length {
        for j in 0..<length {
            board[i+1][j+1] = land[i][j]
            visited[i+1][j+1] = 0
        }
    }
    
    
    // MARK: - dfs
    
    var level = 1
    func dfs(y: Int, x: Int, level: Int) {
        var needVisit = [[y,x]]
        
        while !needVisit.isEmpty {
            let pos = needVisit.removeFirst()
            let y = pos[0]
            let x = pos[1]
            guard visited[y][x] == 0 else { continue }
            
            visited[pos[0]][pos[1]] = level
            for i in 0..<4 {
                let ny = pos[0] + dy[i]
                let nx = pos[1] + dx[i]
                let dist = abs(board[ny][nx] - board[y][x])
                guard dist <= height else { continue }
                needVisit.append([ny, nx])
            }
        }
    }
    for y in 1..<length+1 {
        for x in 1..<length+1 {
            guard visited[y][x] == 0 else { continue }
            dfs(y: y, x: x, level: level)
            level += 1
        }
    }
    
    
    // MARK: - height difference
    
    var heightRec: [(s1: Int, s2: Int, diff: Int)] = []
    func heightDiff(x: Int, y: Int) {
        let g1 = visited[y][x]
        
        for i in [0, 2] {
            let ny = y + dy[i]
            let nx = x + dx[i]
            let g2 = visited[ny][nx]
            
            guard g2 != -1 && g1 != g2 else { continue }
            let diff = abs(board[y][x] - board[ny][nx])
            heightRec.append((g1, g2, diff))
        }
    }
    for y in 1..<length+1 {
        for x in 1..<length+1 {
            heightDiff(x: x, y: y)
        }
    }
    
    
    // MARK: - Union-Find algorithm
    
    var result = 0
    var root: [Int] = []
    for i in 0..<level { root.append(i) }
    
    func find(root r: Int) -> Int {
        if root[r] == r { return r }
        else { return find(root: root[r]) }
    }
    
    func union(parent: Int, child: Int) {
        let parent = find(root: parent)
        let child = find(root: child)
        root[child] = parent
    }
    
    for rec in heightRec.sorted(by: { $0.2 < $1.2 }) {
        if find(root: rec.s1) == find(root: rec.s2) { continue }
        result += rec.diff
        union(parent: rec.s1, child: rec.s2)
    }
    
    
    return result
}

print(solution([[1, 4, 8, 10], [5, 5, 5, 5], [10, 10, 10, 10], [10, 10, 10, 20]], 3))
print(solution([[10, 11, 10, 11], [2, 21, 20, 10], [1, 20, 21, 11], [2, 1, 2, 1]], 1))

//func solution(_ land: [[Int]], _ height: Int) -> Int {
//    
//    let length = land.count
//    let dy = [0, 0, 1, -1]
//    let dx = [1, -1, 0, 0]
//    
//    var board: [[Int]] = .init(repeating: .init(repeating: -1, count: length+2), count: length+2)
//    var visited: [[Int]] = .init(repeating: .init(repeating: -1, count: length+2), count: length+2)
//    
//    for i in 0..<length {
//        for j in 0..<length {
//            board[i+1][j+1] = land[i][j]
//            visited[i+1][j+1] = 0
//        }
//    }
//    
//    var level = 1
//    for y in 1..<length+1 {
//        for x in 1..<length+1 {
//            guard visited[y][x] == 0 else { continue }
//            dfs(y: y, x: x, level: level)
//            level += 1
//        }
//    }
//    
//    var heightRec: [(lands: [Int], diff: Int)] = []
//    for y in 1..<length+1 {
//        for x in 1..<length+1 {
//            heightDiff(x: x, y: y)
//        }
//    }
//    
//    var sortedHeightRec: [Set<Int>: Int] = [:]
//    for rec in heightRec {
//        let key = Set(rec.lands)
//        if sortedHeightRec[key] == nil {
//            sortedHeightRec[key] = rec.diff
//            continue
//        }
//        sortedHeightRec[key] = min(sortedHeightRec[key]!, rec.diff)
//    }
//    
//    var result = 0
//    // MARK: Union-find algorithm
//    var levels: [Int: Int] = [:]
//    for l in 1..<level { levels[l] = l }
//    
//    var uf = UnionFind(root: levels)
//    for rec in sortedHeightRec.sorted(by: { $0.value < $1.value }) {
//        var key = rec.key
//        let s1 = key.removeFirst()
//        let s2 = key.removeFirst()
//        guard !uf.hasSameParent(s1: s1, s2: s2) else { continue }
//        result += rec.value
//        uf.union(parent: s1, child: s2)
//    }
//    
//    return result
//    
//    func dfs(y: Int, x: Int, level: Int) {
//        var needVisit = [[y,x]]
//        
//        while !needVisit.isEmpty {
//            let pos = needVisit.removeFirst()
//            guard visited.value(of: pos) == 0 else { continue }
//            
//            visited[pos[0]][pos[1]] = level
//            for i in 0..<4 {
//                let ny = pos[0] + dy[i]
//                let nx = pos[1] + dx[i]
//                let dist = abs(board[ny][nx] - board.value(of: pos))
//                guard dist <= height else { continue }
//                needVisit.append([ny, nx])
//            }
//        }
//    }
//    
//    func heightDiff(x: Int, y: Int) {
//        let pos = [y, x]
//        let g1 = visited.value(of: pos)
//        
//        for i in [0, 2] {
//            let ny = y + dy[i]
//            let nx = x + dx[i]
//            let g2 = visited[ny][nx]
//            
//            guard g2 != -1 && g1 != g2 else { continue }
//            let diff = abs(board.value(of: pos) - board[ny][nx])
//            heightRec.append(([g1, g2], diff))
//        }
//    }
//}
//
//print(solution([[1, 4, 8, 10], [5, 5, 5, 5], [10, 10, 10, 10], [10, 10, 10, 20]], 3))
//print(solution([[10, 11, 10, 11], [2, 21, 20, 10], [1, 20, 21, 11], [2, 1, 2, 1]], 1))
//
//extension Array where Element == [Int] {
//    func value(of loc: [Int]) -> Int { return self[loc[0]][loc[1]] }
//}
