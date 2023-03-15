//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/03.
//

import Foundation

public func progressTime(_ closure: () -> ()) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}

print(progressTime {
    var cnt = Int(readLine()!)!
//    var nums: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    var nums: [Int] = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    print("\(nums.min()!) \(nums.max()!)")
})
//var cnt = Int(readLine()!)!
//var nums: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
//print("\(nums.min()!) \(nums.max()!)")
