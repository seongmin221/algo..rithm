//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/27/23.
//

import Foundation

func solution(_ n: Int, _ times: [Int]) -> Int64 {
    
    let times = times.sorted()
    var high = times.last! * n
    var low = 0
    var mid = (high + low) / 2
    var result = 0
    
    while low <= high {
        var mid = (high + low) / 2
        var count = 0
        times.forEach { count += mid / $0 }
        
        if count < n { low = mid + 1 }
        else {
            high = mid - 1
            result = mid
        }
    }
    
    return Int64(result)
}

//func solution(_ n: Int, _ times: [Int]) -> Int64 {
//    
//    let times = times.sorted()
//    var high = times.last! * n
//    var low = 0
//    var mid = (high + low) / 2
//    var count = 0
//    var result = 0
//    
//    while low <= high {
//        var mid = (high + low) / 2
//        count = 0
//        times.forEach { count += mid / $0 }
//        
//        if count > n { high = mid - 1 }
//        else if count < n { low = mid + 1 }
//        else { result = mid; break }
//    }
//    
//    let adjust = Set(times).map({ result % $0 }).min() ?? 0
//    
//    return Int64(result - adjust)
//}

//print(solution(6, [7,10]))
//print(solution(100000, .init(repeating: 1, count: 100000)))

// MARK: - 1차시도: 시간초과

//func solution(_ n: Int, _ times: [Int]) -> Int64 {
//    
//    var addingTimes: [Int] = []
//    for time in times {
//        var t: [Int] = []
//        for i in 1..<n+1 {
//            t.append(i * time)
//        }
//        addingTimes += t
//    }
//    addingTimes.sort()
//    print(addingTimes)
//    
//    var result = 0
//    var passed = 0
//    while passed != n {
//        result = addingTimes.removeFirst()
//        passed += 1
//    }
//    
//    return Int64(result)
//}

//print(solution(2142, [3,15,1204,102,29,4,11]))

//func solution(_ n: Int, _ times: [Int]) -> Int64 {
//    
//    var timeRange = [0, Int.max]
//    
//    while true {
//        var leftHalf = 0
//        var rightHalf = 0
//        times.forEach {
//            leftHalf += timeRange[0] / $0
//            rightHalf += timeRange[1] / $0
//        }
//        
//        let margin = (timeRange[1] - timeRange[0]) / 2
//        if abs(leftHalf - n) > abs(rightHalf - n) {
//            timeRange = [timeRange[0] + margin, timeRange[1]]
//        }
//        else if abs(leftHalf - n) < abs(rightHalf - n) {
//            timeRange = [timeRange[0], timeRange[1] - margin]
//        }
//        else {
//            timeRange = [timeRange[0] + margin/2, timeRange[1] - margin/2]
//        }
//        
//        if leftHalf - n == 0 || rightHalf - n == 0 { break }
//    }
//    print(timeRange)
//    var result = 0
//    for time in timeRange[0]...timeRange[1] {
//        guard result == 0 else { break }
//        for div in times {
//            if time % div == 0 { result = time; break }
//        }
//    }
//    
//    return Int64(result)
//}



//func solution(_ n: Int, _ times: [Int]) -> Int64 {
//    
//    var timeRange = [0, Int.max]
//    
//    while true {
//        var customers = 0
//        times.forEach { customers += timeRange[1] / $0 }
//        print(customers, timeRange)
//        let margin = (timeRange[1] - timeRange[0]) / 2
//        if customers > n { timeRange = [timeRange[0], timeRange[1] - margin] }
//        else if customers < n { timeRange = [timeRange[0] + margin, timeRange[1]] }
//        
//        if margin == 0 { break }
//    }
//    
//    return 0
//}


//func solution(_ n: Int, _ times: [Int]) -> Int64 {
//    
//    var baseTime = 0
//    var addTime = Int.max
//    var time = Int.max
//    
//    while true {
//        var customers = 0
//        times.forEach { customers += time / $0 }
//        print(customers, time)
//        addTime /= 2
//        if customers > n { time -= addTime }
//        else if customers < n { time += addTime }
//        else { break }
//    }
//    
//    return Int64(time)
//}
