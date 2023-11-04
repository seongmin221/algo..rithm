//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/3/23.
//

import Foundation

// 1. fees: [기본 시간, 기본 요금, 추가 요금 필요한 시간, 단위 시간 추가 요금]
// 2. records: ["00:00 0000 IN/OUT" 모양의 입출차 기록]

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let lastTime = 23 * 60 + 59
    
    let baseTime = fees[0]
    let baseFee = fees[1]
    let addiTime = fees[2]
    let addiFee = fees[3]
    
    var parkRecords = [String: Int]()
    
    for record in records {
        let temp = record
            .split(separator: " ")
            .map { String($0) }
        let carTime = temp[0]
            .split(separator: ":")
            .map { Int($0)! }
            .reduce(0) { $0 * 60 + $1 }
        let carNum = temp[1]
        let inOut = temp[2]
        
        if parkRecords.keys.contains(temp[1]) {
            if inOut == "IN" {
                parkRecords[temp[1]]! -= carTime
            } else if inOut == "OUT" {
                parkRecords[temp[1]]! += carTime
            }
        } else {
            parkRecords[temp[1]] = -carTime
        }
    }
    
    for parkRecord in parkRecords {
        let key = parkRecord.key
        let val = parkRecord.value
        if val <= 0 { parkRecords[key]! += lastTime }
        else { continue }
    }
    
    let sortedTimes = parkRecords
        .sorted { $0.key < $1.key }
        .map { $0.value }
    
    return sortedTimes.map {
        var time = $0 - baseTime
        guard time > 0 else { return baseFee }
        
        var fee = baseFee
        let temp = Float(time) / Float(addiTime)
        fee += temp > Float(Int(temp)) ? (Int(temp) + 1) * addiFee : Int(temp) * addiFee
        return fee
    }
}
