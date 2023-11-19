//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/19/23.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var player = players
    var dict = [String: Int]()
    
    for i in 0..<player.count {
        dict[player[i]] = i
    }
    for call in callings {
        var idx1 = dict[call]!
        let name = player[idx1 - 1]
        player[idx1 - 1] = call
        player[idx1] = name
        dict[call]! -= 1
        dict[player[idx1]]! += 1
    }
    return player
}
