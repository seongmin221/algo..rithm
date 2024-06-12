//
//  블록 게임.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/13/24.
//

import Foundation

struct Pos: Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

func blockGame() {
    
    let n: Int = Int(readLine()!)!
    let dirs: [String] = readLine()!.map { String($0) }
    let scores: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    
    var pos: Pos = .init(1000, 1000)
    var wentMap: [[Bool]] = .init(repeating: .init(repeating: false, count: 2001), count: 2001)
    var posStack: [Pos] = [pos]
    var scoreStack: [Int] = [1]
    
    wentMap[1000][1000] = true
    
    for i in 0..<n {
        switch dirs[i] {
            case "L": pos.x -= 1
            case "R": pos.x += 1
            case "U": pos.y += 1
            case "D": pos.y -= 1
            default: continue
        }
        
        if wentMap[pos.y][pos.x] {
            while true {
                let prev = posStack.removeLast()
                let _ = scoreStack.removeLast()
                wentMap[prev.y][prev.x] = false
                
                if prev == pos { break }
            }
        }
        
        posStack.append(pos)
        scoreStack.append(scores[i])
        wentMap[pos.y][pos.x] = true
    }
    
    print(scoreStack.reduce(0, { $0 + $1 }))
}
