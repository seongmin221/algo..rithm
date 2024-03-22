//
//  호텔 방 배정.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

// 1. 한 번에 한 명씩 신청한 순서대로 방을 배정합니다.
// 2. 고객은 투숙하기 원하는 방 번호를 제출합니다.
// 3. 고객이 원하는 방이 비어 있다면 즉시 배정합니다.
// 4. 고객이 원하는 방이 이미 배정되어 있으면 원하는 방보다 번호가 크면서 비어있는 방 중 가장 번호가 작은 방을 배정합니다.

//func solution(_ k: Int64, _ room_number: [Int64]) -> [Int64] {
//
//    var result: [Int64] = []
//
//    var takenArray: [Bool] = .init(repeating: false, count: Int(k))
//
//    for num in room_number {
//        var num = Int(num)
//
//        while takenArray[num-1] {
//            num += 1
//        }
//        takenArray[num-1] = true
//        result.append(Int64(num))
//    }
//
//    return result
//}


func solution(_ k: Int64, _ room_number: [Int64]) -> [Int64] {
    
    var result: [Int64] = []
    var allocation: [Int64: Int64] = [:]
    
    for room in room_number {
        if allocation[room] == nil {
            result.append(room)
            allocation[room] = room + 1
        }
        else {
            var visited: [Int64] = []
            var temp = room
            while true {
                visited.append(temp)
                guard let next = allocation[temp] else { break }
                temp = next
            }
            result.append(temp)
            allocation[temp] = temp + 1
            
            for v in visited {
                allocation[v] = temp + 1
            }
        }
    }
    
    return result
}

//print(solution(10, [1,3,4,1,3,1]))
