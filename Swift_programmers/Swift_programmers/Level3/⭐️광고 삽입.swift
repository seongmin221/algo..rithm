//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/10/24.
//

import Foundation

//struct Time: Comparable {
//    var h: Int
//    var m: Int
//    var s: Int
//    
//    static func < (lhs: Time, rhs: Time) -> Bool {
//        if lhs.h < rhs.h { return true }
//        else if lhs.h == rhs.h {
//            if lhs.m < rhs.m { return true }
//            else if lhs.m == rhs.m { return lhs.s < rhs.s }
//            else { return false }
//        }
//        else { return false }
//    }
//    
//    static func == (lhs: Time, rhs: Time) -> Bool {
//        lhs.h == rhs.h && lhs.m == rhs.m && lhs.s == rhs.s
//    }
//    
//    static func + (lhs: Time, rhs: Time) -> Time {
//        var result: Time = .emptyValue
//        result.s = lhs.s + rhs.s
//        result.m = lhs.m + rhs.m
//        result.h = lhs.h + rhs.h
//        if result.s >= 60 {
//            result.s %= 60
//            result.m += 1
//        }
//        if result.m >= 60 {
//            result.m %= 60
//            result.h += 1
//        }
//        return result
//    }
//    
//    static func - (lhs: Time, rhs: Time) -> Time? {
//        guard lhs > rhs else { return nil }
//        var result: Time = .emptyValue
//        result.s = lhs.s - rhs.s
//        result.m = lhs.m - rhs.m
//        result.h = lhs.h - rhs.h
//        if result.s < 0 {
//            result.s += 60
//            result.m -= 1
//        }
//        if result.m < 0 {
//            result.m += 60
//            result.h -= 1
//        }
//        return result
//    }
//    
//    static func * (lhs: Time, rhs: Int) -> Time {
//        var result: Time = .emptyValue
////        for _ in 0..<rhs {
////            result = result + lhs
////        }
//        result.s = lhs.s * rhs
//        result.m = lhs.m * rhs
//        result.h = lhs.h * rhs
//        if result.s >= 60 {
//            result.m += result.s / 60
//            result.s %= 60
//        }
//        if result.m >= 60 {
//            result.h += result.m / 60
//            result.m %= 60
//        }
//        return result
//    }
//    
//    static var emptyValue: Time {
//        Time(h: 0, m: 0, s: 0)
//    }
//}
//
//struct TimeLog {
//    enum LogType {
//        case start
//        case end
//    }
//    
//    var time: Time
//    var type: LogType
//    var count: Int = 0
//}
//
//
//func addTimeLogs(start: Time, end: Time, logs timeLogs: [TimeLog]) -> Time {
//    var accTime: Time = .emptyValue
//    var index = 1
//    while index < timeLogs.count {
//        var start = timeLogs[index-1]
//        var end = timeLogs[index]
//        guard let timeDiff = end.time - start.time else { break }
//        accTime = accTime + timeDiff * start.count
//        index += 1
//    }
//    return accTime
//}
//
//func addReversedTimeLogs(start: Time, end: Time, logs timeLogs: [TimeLog]) -> Time {
//    var accTime: Time = .emptyValue
//    var index = timeLogs.count - 1
//    while index > 1 {
//        var start = timeLogs[index-1]
//        var end = timeLogs[index]
//        guard let timeDiff = end.time - start.time else { break }
//        accTime = accTime + timeDiff * start.count
//        index -= 1
//    }
//    return accTime
//}
//
//func solution(_ playTime: String, _ advTime: String, _ logs: [String]) -> String {
//    
//    if playTime == advTime { return "00:00:00" }
//    
//    let pt = playTime.toTimeDigits()
//    let at = advTime.toTimeDigits()
//    var timeLogs: [TimeLog] = []
//    for log in logs {
//        let (start, end) = log.splitTimeRange()
//        timeLogs.append(.init(time: start.toTimeDigits(), type: .start))
//        timeLogs.append(.init(time: end.toTimeDigits(), type: .end))
//    }
//    timeLogs.sort(by: { $0.time < $1.time })
//    
//    var accCount = 0
//    var accTimeLogs: [TimeLog] = [.init(time: .emptyValue, type: .start)]
//    for timeLog in timeLogs {
//        var acc: TimeLog = .init(time: timeLog.time, type: timeLog.type)
//        switch timeLog.type {
//        case .start:
//            accCount += 1
//            acc.count = accCount
//            
//        case .end:
//            accCount -= 1
//            acc.count = accCount
//        }
//        accTimeLogs.append(acc)
//    }
//    accTimeLogs.append(.init(time: pt, type: .end))
//    
//    
//    var maxAccTime: (start: Time, accTime: Time) = (Time.emptyValue, Time.emptyValue)
//    for (index, log) in accTimeLogs.enumerated() {
//        switch log.type {
//        case .start:
//            let start = log.time
//            let end = log.time + at
//            
//            var i = index
//            var containedLogs: [TimeLog] = []
//            while end >= accTimeLogs[i].time {
//                containedLogs.append(accTimeLogs[i])
//                i += 1
//            }
//            
//            let addedTime = addTimeLogs(start: start, end: end, logs: containedLogs)
//            if maxAccTime.accTime < addedTime {
//                maxAccTime = (start, addedTime)
//            }
////            print("-", containedLogs.map { $0.time })
////            print("--", start, "--", end)
////            print(addTimeLogs(start: start, end: end, logs: containedLogs))
//            
//        case .end:
//            let end = log.time
//            let start = (log.time - at)!
//            
//            var i = index
//            var containedLogs: [TimeLog] = []
//            while start <= accTimeLogs[i].time {
//                containedLogs.append(accTimeLogs[i])
//                i -= 1
//            }
////            print("-", containedLogs.map { $0.time })
////            print("--", start, "--", end)
////            print("---", addReversedTimeLogs(start: start, end: end, logs: containedLogs.reversed()))
//            
//            let addedTime = addReversedTimeLogs(start: start, end: end, logs: containedLogs.reversed())
//            if maxAccTime.accTime < addedTime {
//                maxAccTime = (start, addedTime)
//            }
//        }
//    }
//    
//    return "\(maxAccTime.start.h):\(maxAccTime.start.m):\(maxAccTime.start.s)"
//}
//
//
//extension String {
//    func toTimeDigits() -> Time {
//        let digits = self.split(separator: ":").map { Int(String($0))! }
//        return .init(h: digits[0], m: digits[1], s: digits[2])
//    }
//    
//    func splitTimeRange() -> (start: String, end: String) {
//        let time = self.split(separator: "-").map { String($0) }
//        return (time[0], time[1])
//    }
//}


func solution(_ playTime: String, _ advTime: String, _ logs: [String]) -> String {
    
    if playTime == advTime { return "00:00:00" }
    
    let playTime = playTime.toSec()
    let logs = logs.map { $0.toTime().map { t in t.toSec() } }
    var accLogs: [Int] = .init(repeating: 0, count: playTime + 1)
    
    
    for log in logs {
        accLogs[log[0]] += 1
        accLogs[log[1]] -= 1
    }
    
    for i in 1..<playTime {
        accLogs[i] += accLogs[i-1]
    }
    
    let advTime = advTime.toSec()
    var accTime = accLogs[0..<advTime].reduce(0, { $0 + $1 })
    var maxAccTime = accTime
    var maxAccStart = 0
    for i in 0..<(playTime - advTime) {
        accTime = accTime - accLogs[i] + accLogs[advTime + i]
        if maxAccTime < accTime {
            maxAccTime = accTime
            maxAccStart = i + 1
        }
    }
    
    return maxAccStart.toTime()
}

extension Int {
    func toTime() -> String {
        let h = self / 3600
        let m = (self % 3600) / 60
        let s = (self % 3600) % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}

extension String {
    func toTime() -> [String] {
        return self.split(separator: "-").map { String($0) }
    }
    
    func toSec() -> Int {
        let temp = self.split(separator: ":").map { Int(String($0))! }
        return temp[0] * 3600 + temp[1] * 60 + temp[2]
    }
}


//print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))
//print(solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"]))
