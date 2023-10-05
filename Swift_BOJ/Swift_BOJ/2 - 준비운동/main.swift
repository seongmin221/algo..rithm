//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/4/23.
//

import Foundation

_ = readLine()!.components(separatedBy: " ").map { Int($0)! }
let blocks = readLine()!.components(separatedBy: " ").map { Int($0)! }
let blockCnt = blocks.count

var blockTemp = [0]
var index = 0
var inc = 0
var dec = 0
var turningPt = [0]

while index < blockCnt-1 {
    blockTemp = Array(blocks.suffix(from: index))
    inc = blockTemp.isIncUntil()
    dec = blockTemp.isDecUntil()
    index = max(inc, dec) + turningPt.last!
    turningPt.append(index)
}

var count = 0
var line = 0

//if blocks[turningPt.first!] < blocks[turningPt[1]] {
//    turningPt.removeFirst()
//}
//if blocks[turningPt.last!] < blocks[turningPt.last!-1] {
//    turningPt.removeLast()
//}

print(turningPt)

if turningPt.count >= 3 {
    
    for i in 0..<turningPt.count-2 {
        if blocks[turningPt[i]] < blocks[turningPt[i+1]] {
            continue
        } else {
            line = min(blocks[turningPt[i]], blocks[turningPt[i+2]])
            for j in turningPt[i]+1...turningPt[i+2]-1 {
                count += line - blocks[j]
            }
        }
    }
    print(count)
} else {
    print(0)
}


extension Array where Element == Int {
    func isIncUntil() -> Int {
        var max = Int.min
        for i in 0..<self.count {
            if self[i] >= max {
                max = self[i]
                continue
            } else {
                return i - 1
            }
        }
        return self.count - 1
    }
    
    func isDecUntil() -> Int {
        var min = Int.max
        for i in 0..<self.count {
            if self[i] <= min {
                min = self[i]
                continue
            } else {
                return i - 1
            }
        }
        return self.count - 1
    }
}

