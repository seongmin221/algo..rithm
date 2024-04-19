//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/25/23.
//

import Foundation

//func solution(_ n: Int, _ results: [[Int]]) -> Int {
//    
//    var allRecords: [Int: [Int]] = [:]
//    var map: [Int: [Int]] = [:]
//    for i in 1..<n+1 {
//        allRecords[i] = [0, 0]
//        map[i] = []
//    }
//    for result in results { map[result[0]]!.append(result[1]) }
//    
//    for i in 1..<n+1 {
//        var needVisit: [Int] = [i]
//        var visited: [Int] = []
//        
//        while !needVisit.isEmpty {
//            let node = needVisit.removeLast()
//            
//            if visited.contains(node) { continue }
//            
//            allRecords[i]![0] += 1
//            allRecords[node]![1] += 1
//            needVisit += map[node]!
//            visited.append(node)
//        }
//    }
//    
//    var result = 0
//    allRecords.values.forEach { record in
//        if record.reduce(0, { $0 + $1 }) == n + 1 {
//            result += 1
//        }
//    }
//    
//    return result
//}


class Player {
    let index: Int
    var beat: [Player] = []
    var lost: [Player] = []

    init(_ index: Int) {
        self.index = index
    }
}

extension Player {
    func beat(_ player: Player) {
        self.beat.append(player)
    }

    func lost(_ player: Player) {
        self.lost.append(player)
    }

    func knownResultCount() -> Int {
        func bfs(_ initialArr: [Player], beats: Bool) -> Int {
            var count: Int = 0
            var needVisit = initialArr
            var visited: Set<Int> = []
            while !needVisit.isEmpty {
                let node = needVisit.removeLast()
                if visited.contains(node.index) { continue }
                count += 1
                visited.insert(node.index)
                if beats { needVisit += node.beat }
                else { needVisit += node.lost }
            }
            return count
        }

        return bfs(self.beat, beats: true) + bfs(self.lost, beats: false)
    }
}

func solution(_ n: Int, _ results: [[Int]]) -> Int {

    var players: [Player] = []
    for i in 1...n { players.append(.init(i)) }

    for result in results {
        let winner = players[result[0] - 1]
        let loser = players[result[1] - 1]
        winner.beat(loser)
        loser.lost(winner)
    }

    var result: Int = 0
    for player in players {
        if player.knownResultCount() == n-1 {
            result += 1
        }
    }

    return result
}

print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
