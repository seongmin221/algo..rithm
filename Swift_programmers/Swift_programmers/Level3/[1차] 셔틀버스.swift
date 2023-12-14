//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/13/23.
//

import Foundation

// 셔틀 운행 횟수 n,
// 셔틀 운행 간격 t,
// 한 셔틀에 탈 수 있는 최대 크루 수 m,
// 크루가 대기열에 도착하는 시각을 모은 배열 timetable

func solution(_ n: Int, _ t: Int, _ m: Int, _ timetable: [String]) -> String {
    
    var table = timetable
        .sorted()
        .map { $0.split(separator: ":") }
        .map { Int($0[0])! * 60 + Int($0[1])! }
    
    var busList = Array(0..<n)
        .map { 9 * 60 + $0 * t }
    
    // 크루가 버스의 마지막 도달 시간보다 늦게부터 기다리고 있을 때
    if table.first! > 9 * 60 + (n - 1) * t { return busList.last!.toTime() }
    if n == 1 {
        if table.count >= m { return (table[m-1] - 1).toTime() }
        else { return busList.first!.toTime() }
    }
    
    var possibleBusList: [(bus: Int, crew: [Int])] = []
    while !busList.isEmpty {
        let bus = busList.removeFirst()
        var crewOnBus: [Int] = []
        while crewOnBus.count < m && !table.isEmpty {
            guard table.first! <= bus else { break }
            crewOnBus.append(table.removeFirst())
        }
        possibleBusList.append((bus, crewOnBus))
    }
    
    var result = 0
    let busCount = possibleBusList.count
    for i in (0..<n).reversed() {
        let (bus, crew) = possibleBusList[i]
        if crew.count < m  { result = bus; break }
        else if i >= 1 {
            let con = crew.last! - 1
            if possibleBusList[i - 1].bus == con { continue }
            else { result = con; break }
        }
    }
    return result.toTime()
}

extension Int {
    func toTime() -> String {
        let hour = self / 60
        let min = self % 60
        let hourInString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minInString = min < 10 ? "0\(min)" : "\(min)"
        return hourInString + ":" + minInString
    }
}

//print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))  // 09:00
//print(solution(2, 10, 2, ["09:10", "09:09", "08:00"]))  // 09:09
//print(solution(10, 60, 45, ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]))    // 18:00
//print(solution(2, 1, 2, ["09:00", "09:00", "09:00", "09:00"]))  // 08:59
//print(solution(1, 1, 1, ["23:59"])) // 09:00

//print(solution(1, 1, 5, ["00:01", "00:01", "00:01","00:01", "00:01", "00:02", "00:03", "00:04"]))
//print(solution(10, 25, 1, ["09:00", "09:10" ,"09:20" ,"09:30" ,"09:40" ,"09:50","10:00", "10:10" ,"10:20" ,"10:30" ,"10:40" ,"10:50"]))
