//
//  1002-터렛.swift
//  Swift_BOJ
//
//  Created by 이성민 on 5/4/24.
//

import Foundation

func solution() {
    let n: Int = Int(readLine()!)!
    
    func calcPossibleCnt(
        _ x1: Int, _ y1: Int, _ r1: Int,
        _ x2: Int, _ y2: Int, _ r2: Int
    ) -> Int {
        if x1 == x2, y1 == y2 { return r1 == r2 ? -1 : 0 }
        
        let larger = max(r1, r2)
        
        let distSq = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
        let add = (r1 + r2)
        let sub = (r1 - r2)
        
        if distSq == add * add || distSq == sub * sub { return 1 }
        else if larger * larger < distSq, add * add > distSq { return 2 }
        else if larger * larger >= distSq, sub * sub < distSq { return 2 }
        else { return 0 }
    }
    
    var input: [[Int]] = []
    for _ in 0..<n {
        input.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    for i in input {
        print(calcPossibleCnt(i[0], i[1], i[2], i[3], i[4], i[5]))
    }
}

//solution()

