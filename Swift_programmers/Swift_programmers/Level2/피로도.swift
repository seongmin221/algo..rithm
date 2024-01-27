//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/27/24.
//

import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    
    var maxDungeonCount = 0
    func dfs(leftEnergy: Int, leftDungeons: [[Int]], selecetedIndex: Int, count: Int) {
        var energy = leftEnergy
        var dungeons = leftDungeons
        let selectedDungeon = dungeons.remove(at: selecetedIndex)
        
        if energy < selectedDungeon[0] { return }
        energy -= selectedDungeon[1]
        maxDungeonCount = max(maxDungeonCount, count + 1)
        
        for i in 0..<dungeons.count {
            dfs(leftEnergy: energy, leftDungeons: dungeons, selecetedIndex: i, count: count + 1)
        }
    }
    
    for i in 0..<dungeons.count {
        dfs(leftEnergy: k, leftDungeons: dungeons, selecetedIndex: i, count: 0)
    }
    
    return maxDungeonCount
}

//print(solution(80, [[80,20],[50,40],[30,10]]))
