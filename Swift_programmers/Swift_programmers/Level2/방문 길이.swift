//
//  방문 길이.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/6/24.
//

import Foundation

struct Position: Hashable {
    var y: Int
    var x: Int
}

func solution(_ dirs: String) -> Int {

    var visited: Set<Set<Position>> = []
    var position: Position = .init(y: 0, x: 0)
    var moveCount: Int = 0
    for dir in dirs {
        let dir = String(dir)
        var road: Set<Position> = []
        road.insert(position)
        switch dir {
        case "U":
            guard position.y < 5 else { continue }
            position.y += 1
        case "D":
            guard position.y > -5 else { continue }
            position.y -= 1
        case "R":
            guard position.x < 5 else { continue }
            position.x += 1
        case "L":
            guard position.x > -5 else { continue }
            position.x -= 1
        default:
            continue
        }

        road.insert(position)
        if !visited.contains(road) {
            moveCount += 1
            visited.insert(road)
        }
    }

    return moveCount
}
//
//print(solution("ULURRDLLU"))
