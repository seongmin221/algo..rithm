//
//  ㅡ먀ㅜ.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/25/23.
//

import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    
    var diceMap: [[Int: Int]] = []
    dice.forEach { d in
        var map: [Int: Int] = [:]
        d.forEach {
            if map[$0] == nil { map[$0] = 0 }
            else { map[$0]! += 1 }
        }
        diceMap.append(map)
    }
    
    
    
    return []
}
