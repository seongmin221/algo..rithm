//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/18/24.
//

import Foundation

func solution(_ maps: [String]) -> [Int] {
    
    var map: [[Int?]] = maps.map { row in
        var arr: [Int?] = []
        for c in row { arr.append(Int(String(c)) ?? nil)}
        return arr
    }
    
    let yCount: Int = map.count
    let xCount: Int = map.first!.count
    
    let dy: [Int] = [1, -1, 0, 0]
    let dx: [Int] = [0, 0, 1, -1]
    
    func dfs(y: Int, x: Int) -> Int {
        var val = 0
        var needVisit: [(y: Int, x: Int)] = [(y, x)]
        
        while !needVisit.isEmpty {
            let pos = needVisit.removeFirst()
            
            if let posVal = map[pos.y][pos.x] { val += posVal }
            else { continue }
            map[pos.y][pos.x] = nil
            
            for i in 0..<4 {
                let ny = pos.y + dy[i]
                let nx = pos.x + dx[i]
                guard (0 <= ny && ny < yCount) && (0 <= nx && nx < xCount)
                        && map[ny][nx] != nil
                else { continue }
                needVisit.append((ny, nx))
            }
        }
        return val
    }
    
    var result: [Int] = []
    for y in 0..<yCount {
        for x in 0..<xCount {
            if map[y][x] == nil { continue }
            result.append(dfs(y: y, x: x))
        }
    }
    
    return result.sorted(by: <)
}

//print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
