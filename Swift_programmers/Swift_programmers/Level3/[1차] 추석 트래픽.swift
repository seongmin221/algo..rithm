//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/12/23.
//

import Foundation

func solution(_ lines: [String]) -> Int {
    
    let lineCount = lines.count
    var inputs: [[String]] = []
    for line in lines {
        let comps = line.split(separator: " ").map { String($0) }
        inputs.append(comps)
    }
    
    var timeList: [Date] = []
    var intervalList: [Int] = []
    for input in inputs {
        let time = (input[0] + " " + input[1]).toDate()
        timeList.append(time)
        
        var intervalString = input.last!
        intervalString.removeLast()
        let interval = Int(Double(intervalString)! * 1000) - 1
        intervalList.append(interval)
    }
    
    let originTime = timeList.first!
    var timeRangeList: [(s: Int, e: Int)] = []
    for i in 0..<lineCount {
        let endTime = Int(fabs(timeList[i].timeIntervalSince(originTime)) * 1000)
        let startTime = endTime - intervalList[i]
        timeRangeList.append((startTime, endTime))
    }
    
    var overlapCountList: [Int] = []
    for i in 0..<lineCount-1 {
        let standard = timeRangeList[i]
        var overlapCount = 1
        for j in i+1..<lineCount {
            let other = timeRangeList[j]
            guard other.s < standard.e + 1000 else { continue }
            overlapCount += 1
        }
        overlapCountList.append(overlapCount)
    }
    
    return overlapCountList.max() ?? 1
}

extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter.date(from: self)!
    }
}

//print(solution(["2016-09-15 01:00:04.001 2.0s",
//                "2016-09-15 01:00:07.000 2s"]))
//
//print(solution(["2016-09-15 01:00:04.002 2.0s",
//                "2016-09-15 01:00:07.000 2s"]))
//
//print(solution(["2016-09-15 23:59:59.999 0.001s"]))
//
//print(solution(["2016-09-15 20:59:57.421 0.351s",
//                "2016-09-15 20:59:58.233 1.181s",
//                "2016-09-15 20:59:58.299 0.8s",
//                "2016-09-15 20:59:58.688 1.041s",
//                "2016-09-15 20:59:59.591 1.412s",
//                "2016-09-15 21:00:00.464 1.466s",
//                "2016-09-15 21:00:00.741 1.581s",
//                "2016-09-15 21:00:00.748 2.31s",
//                "2016-09-15 21:00:00.966 0.381s",
//                "2016-09-15 21:00:02.066 2.62s"]))


//func solution(_ lines: [String]) -> Int {
//    
//    var inputs = lines
//        .map { line in
//            var input = line.split(separator: " ").map { String($0) }
//            input.removeFirst()
//            return input
//        }
//    
//    let timeStarts = inputs
//        .map { time in
//            time.first!.split(separator: ":").map { Double(String($0))! }
//        }
//    
//    let timeDurations = inputs
//        .map { duration in
//            var d = duration.last!
//            d.removeLast()
//            return Double(d)!
//        }
//    
//    var timeEnds: [Double] = []
//    var timeOverlaps: [(overlaps: Int, end: Double)] = []
//    for i in 0..<lines.count {
//        
//    }
//    
//    return 0
//}



//extension Date {
//    func toFullDate() -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "y-MM-dd HH:mm:ss.SSS"
//        return formatter.string(from: self)
//    }
//}
