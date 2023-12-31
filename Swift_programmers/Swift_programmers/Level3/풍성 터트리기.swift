//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/30/23.
//

import Foundation

func solution(_ a: [Int]) -> Int {
    
    var rightMin: [Int] = Array(repeating: Int.max, count: a.count)
    for i in (0..<a.count-1).reversed() {
        rightMin[i] = min(rightMin[i+1], a[i+1])
    }
    
    var result = 0
    var leftMin = Int.max
    
    for (index, num) in a.enumerated() {
        if leftMin < num && rightMin[index] < num { continue }
        result += 1
        
        leftMin = min(leftMin, num)
    }
    
    return result
}

//print(solution([-16,27,65,-2,58,-92,-71,-68,-61,-33]))

// MARK: - 3차 시도: 더한 시간초과

//func solution(_ a: [Int]) -> Int {
//    
//    var a = a
//    var result = 1
//    var leftMin = Int.max
//    var hasSmallerNum = false
//    var rightMin = a.min()!
//    
//    while !a.isEmpty {
//        var num = a.removeFirst()
//        
//        if num == rightMin { rightMin = a.min()! }
//        
//        if leftMin < num && hasSmallerNum { continue }
//        result += 1
//
//        leftMin = min(leftMin, num)
//    }
//    
//    return result
//}

// MARK: - 2차 시도: 개선된 시간초과

//func solution(_ a: [Int]) -> Int {
//    
//    var result = 0
//    var leftMin = Int.max
//    var rightMin = a.min()!
//    
//    for (index, num) in a.enumerated() {
//        switch index {
//        case a.count-1:
//            result += 1
//        default:
//            if num == rightMin { rightMin = a[index+1..<a.count].min()! }
//
//            if leftMin < num && rightMin < num { continue }
//            result += 1
//
//            leftMin = min(leftMin, num)
//        }
//    }
//    
//    return result
//}



// MARK: - 1차 시도: 시간초과

//func solution(_ a: [Int]) -> Int {
//    
//    var result = 0
//    
//    for (index, num) in a.enumerated() {
//        switch index {
//        case 0, a.count-1:
//            result += 1
//        default:
//            let left = a[0..<index].min()!
//            let right = a[index+1..<a.count].min()!
//            if left < num && right < num { continue }
//            result += 1
//        }
//    }
//    
//    return result
//}
