//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/26/23.
//

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {

    var map: [Int: [(des: Int, dis: Int)]] = [:]
    for i in 1..<N+1 { map[i] = [] }
    
    for r in road {
        map[r[0]]!.append((r[1], r[2]))
        map[r[1]]!.append((r[0], r[2]))
    }
    
    var minDis = Array(repeating: Int.max, count: N + 1)
    minDis[0] = 0
    minDis[1] = 0
    
    var queue = [(des: 1, dis: 0)]
    
    while !queue.isEmpty {
        let point = queue.removeFirst()
        
        for path in map[point.des]! {
            if minDis[path.des] <= path.dis + minDis[point.des] { continue }
            else {
                minDis[path.des] = path.dis + minDis[point.des]
                queue.append((path.des, point.dis + path.dis))
            }
        }
        
        queue.sort(by: { $0.dis < $1.dis })
    }
    
    return minDis.filter { $0 <= k }.count - 1
}

//print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
