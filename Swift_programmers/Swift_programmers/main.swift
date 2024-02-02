//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/2/24.
//

import Foundation

//func solution(_ sequence: [Int], _ k: Int) -> [Int] {
//    
//    var seq = sequence
//    var start = 0
//    var end = 0
//    var sum = seq[start]
//    
//    var result: [[Int]] = []
//    while start < seq.count && end < seq.count && start <= end {
//        print(start, end)
//        if sum > k {
//            sum -= seq[start]
//            start += 1
//        } else if sum < k {
//            end += 1
//            guard end < seq.count else { break }
//            sum += seq[end]
//        } else {
//            result.append([start, end])
//            sum -= seq[start]
//            start += 1
//        }
//    }
//    
//    result.sort(by: {
//        if $0[1] - $0[0] < $1[1] - $1[0] { return true }
//        else if $0[1] - $0[0] == $1[1] - $1[0] {
//            return $0[0] < $1[0]
//        }
//        else { return false }
//    })
//    
//    return result.first!
//}
//
//print(solution([1, 2, 3, 4, 5], 7))


func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    var count = 0
    let max = r2 * r2
    let min = r1 * r1
    
    for x in 1..<r2 {
        if x < r1 {
            let upper = Float(max - x * x).squareRoot()
            let lower = Float(min - x * x).squareRoot()
            var temp = upper.rounded(.down) - lower.rounded(.down)
            if lower - lower.rounded(.down) == 0 { temp += 1 }
            count += Int(temp)
        }
        else if x >= r1 {
            let upper = Float(max - x * x).squareRoot().rounded(.down)
            count += Int(upper)
        }
    }
    
    count += r2 - r1 + 1
    count *= 4
    
    return Int64(count)
}
