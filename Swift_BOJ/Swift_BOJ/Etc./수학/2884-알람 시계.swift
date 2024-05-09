//
//  File.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/12.
//

import Foundation

var time = readLine()!.components(separatedBy: " ").map { Int($0)! }
var fixedTime = [time[0], time[1]]

if time[1] < 45 && time[0] == 0 {
    fixedTime[0] = 23
    fixedTime[1] = fixedTime[1] + 15
} else if time[1] < 45 && time[0] != 0 {
    fixedTime[0] = fixedTime[0] - 1
    fixedTime[1] = fixedTime[1] + 15
} else {
    fixedTime[0] = fixedTime[0]
    fixedTime[1] = fixedTime[1] - 45
}

print("\(fixedTime[0]) \(fixedTime[1])")
