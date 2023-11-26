//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/25/23.
//

import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    
    var friendMap: [String: Int] = [:]
    for (index, friend) in friends.enumerated() {
        friendMap[friend] = index
    }
    
    let friendCount = friends.count
    var fromTo: [[Int]] = Array(repeating: Array(repeating: 0, count: friendCount), count: friendCount)
    
    var giftRecord = gifts.map { Array($0.split(separator: " ").map { String($0) }) }
    for record in giftRecord {
        let from = friendMap[record[0]]!
        let to = friendMap[record[1]]!
        fromTo[from][to] += 1
    }
    
    var nextCount = Array(repeating: 0, count: friendCount)
    for a in 0..<friendCount {
        for b in 0..<a {
            if a == b { continue }
            
            if fromTo[a][b] > fromTo[b][a] { nextCount[a] += 1 }
            else if fromTo[a][b] == fromTo[b][a] {
                let aSent = fromTo[a].reduce(0, { $0 + $1 })
                let bSent = fromTo[b].reduce(0, { $0 + $1 })
                
                var aRec = 0
                var bRec = 0
                fromTo.forEach {
                    aRec += $0[a]
                    bRec += $0[b]
                }
                
                if (aSent - aRec) > (bSent - bRec) { nextCount[a] += 1 }
                else if (aSent - aRec) < (bSent - bRec) { nextCount[b] += 1 }
                else { continue }
            }
            else { nextCount[b] += 1 }
        }
    }
    
    return nextCount.max()!
}

//func solution(_ friends:[String], _ gifts:[String]) -> Int {
//    
//    var gMap: [String: [Int]] = [:]
//    for friend in friends {
//        gMap[friend] = [0, 0]
//    }
//    
//    var giftRecords = gifts.map { Array($0.split(separator: " ").map { String($0) }) }
//    
//    for record in giftRecords {
//        gMap[record[0]]![0] += 1
//        gMap[record[1]]![1] += 1
//    }
//    
//    gMap.sorted(by: {
//        $0.value[0]
//    })
//    
//    return 0
//}
