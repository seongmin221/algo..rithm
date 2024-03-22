//
//  기지국 설치.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

//func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
//
//    var answer = 0
//
//    var apt: [Int] = .init(repeating: 0, count: n)
//    for s in stations {
//        for i in s-w...s+w {
//            guard 0 <= i, i <= n else { continue }
//            apt[i-1] = 1
//        }
//    }
//
//    var reqAptRow: [Int] = []
//    var isFirst: Bool = true
//    for i in 0..<n {
//        guard apt[i] == 0 else {
//            isFirst = true
//            continue
//        }
//        if isFirst {
//            reqAptRow.append(1)
//            isFirst = false
//        }
//        else {
//            reqAptRow[reqAptRow.count-1] += 1
//        }
//    }
//
//    let div: Int = 2 * w + 1
//    for reqApt in reqAptRow {
//        if reqApt <= div { answer += 1 }
//        else {
//            if reqApt % div > 0 { answer += Int(ceil(Double(reqApt) / Double(div))) }
//            else { answer += reqApt / div }
//        }
//    }
//
//    return answer
//}



//func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
//
//    var answer = 0
//
//    var stationAreas: [(l: Int, r: Int)] = []
//    for s in stations {
//        let left: Int = max(1, s-w)
//        let right: Int = min(n, s+w)
//        stationAreas.append((left, right))
//    }
//
//    var connectedAreas: [(l: Int, r: Int)] = [stationAreas.first!]
//    var lastIndex: Int { connectedAreas.count-1 }
//    for i in 1..<stationAreas.count {
//        let last = connectedAreas.last!
//        if last.r + 1 >= stationAreas[i].l {
//            connectedAreas[lastIndex] = (last.l, stationAreas[i].r)
//        }
//        else {
//            connectedAreas.append(stationAreas[i])
//        }
//    }
//
//    var discAreas: [Int] = []
//    if connectedAreas.first!.l != 0 {
//        discAreas.append(connectedAreas.first!.l - 1)
//    }
//    if connectedAreas.last!.r != n {
//        discAreas.append(n - connectedAreas.last!.r)
//    }
//    for i in 0..<connectedAreas.count-1 {
//        let left = connectedAreas[i].r
//        let right = connectedAreas[i+1].l
//        discAreas.append(right - left - 1)
//    }
//
//    let div: Int = 2 * w + 1
//    for area in discAreas {
//        if area <= div { answer += 1 }
//        else {
//            if area % div > 0 { answer += Int(ceil(Double(area) / Double(div))) }
//            else { answer += area / div }
//        }
//    }
//
//    return answer
//}



//func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
//
//    var answer = 0
//
//    var discAreaLength: [Int] = []
//    var station = (l: -1, r: -1)
//    var next = (l: stations[0] - w, r: stations[0] + w)
////    if station.l > 1 {
////        discAreaLength.append(station.l - 1)
////    }
//
//    for s in stations {
//        if station.r + 1 < next.l { station = next }
//        else { discAreaLength.append(next.l - station.r - 1) }
//        station = next
//        next = (s - w, s + w)
//    }
//
////    for i in 1..<stations.count {
////        let next = (l: stations[i] - w, r: stations[i] + w)
////
////        if station.r + 1 >= next.l {
////            continue
////        }
////
////        discAreaLength.append(next.l - station.r - 1)
////    }
//
////    station = (stations.last! - w, stations.last! + w)
//    if next.r < n {
//        discAreaLength.append(n - next.r)
//    }
//
//    print(discAreaLength)
//    let div: Int = 2 * w + 1
//    for length in discAreaLength {
//        if length % div > 0 { answer += Int(ceil(Double(length) / Double(div))) }
//        else { answer += length / div }
//    }
//
//    return answer
//}



func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    
    var answer = 0
    
    var discAreaLength: [Int] = []
    var currentRight: Int = -1 - 2 * w
    var nextLeft: Int = -2 * w
    
    for s in stations {
        if currentRight + 1 < nextLeft { // 안 겹칠 때
            discAreaLength.append(nextLeft - currentRight - 1)
        }
        currentRight = nextLeft + 2 * w
        nextLeft = s - w
        print(currentRight, nextLeft)
    }
    
    if currentRight + 1 < nextLeft { // 안 겹칠 때
        discAreaLength.append(nextLeft - currentRight - 1)
    }
    
    if stations.last! + w < n {
        discAreaLength.append(n - stations.last! - w)
    }
    
    print(discAreaLength)
    
    let div: Int = 2 * w + 1
    for length in discAreaLength {
        if length % div > 0 { answer += Int(ceil(Double(length) / Double(div))) }
        else { answer += length / div }
    }
    
    return answer
}

//print(solution(13, [3, 7, 11], 1))
//print(solution(11, [4, 11], 1))
//print(solution(16, [9], 2))
