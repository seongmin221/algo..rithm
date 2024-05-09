//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/3/23.
//

// 최대 : - / + *
// 최소 : + / - *

import Foundation

//func solution() {
//    _ = Int(readLine()!)!
//    let nums = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
//    let opsCnt = readLine()!.components(separatedBy: " ").map { Int($0)! }
//    let ops = opsCnt.enumerated().map { (index, opCnt) -> (String, Int) in
//        switch index {
//        case 0: return ("+", opCnt)
//        case 1: return ("-", opCnt)
//        case 2: return ("*", opCnt)
//        case 3: return ("/", opCnt)
//        default: return ("", 0)
//        }
//    }
//    
//    let max = calculate(with: nums, and: ops, with: [1, 3, 0, 2])
//    let min = calculate(with: nums, and: ops, with: [0, 3, 1, 2])
//    
//    print(max)
//    print(min)
//}
//
//func sortOps(_ ops: [(String, Int)]) -> [(String, Int)] {
//    var ops = ops
//    
//}
//
//func calculate(with nums: [Int], and ops: [(String, Int)], with order: [Int]) -> Int {
//    var nums = nums
//    var ops = ops
//    var order = order
//    var orderIndex = order.removeFirst()
//    var temp = nums.removeFirst()
//    
//    while !nums.isEmpty {
//        guard ops[orderIndex].1 != 0 else {
//            orderIndex = order.removeFirst()
//            continue
//        }
//        temp = singleCalcuation(of: temp, nums.removeFirst(), ops[orderIndex].0)
//        ops[orderIndex].1 -= 1
//    }
//    
//    return temp
//}
//
//func singleCalcuation(of num1: Int, _ num2: Int, _ op: String) -> Int {
//    switch op {
//    case "+": return num1 + num2
//    case "-": return num1 - num2
//    case "*": return num1 * num2
//    case "/": if num1 < 0 { return (-num1) / num2 * (-1) } else { return num1 / num2 }
//    default: return 0
//    }
//}
//
//solution()


let n = Int(readLine()!)!
var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var ops = readLine()!.components(separatedBy: " ").map { Int($0)! }

var maxV = Int.min
var minV = Int.max

func calculate(_ input: Int, _ index: Int) {
    if index == n {
        maxV = max(input, maxV)
        minV = min(input, minV)
        return
    }
    
    for i in 0...3 {
        if ops[i] == 0 {
            continue
        }
        ops[i] -= 1
        var value = input
        value = singleCalculation(value, nums[index], i)
        calculate(value, index + 1)
        ops[i] += 1
    }
}


func singleCalculation(_ num1: Int, _ num2: Int, _ op: Int) -> Int {
    switch op {
    case 0: return num1 + num2
    case 1: return num1 - num2
    case 2: return num1 * num2
    case 3: return num1 / num2
    default: return 0
    }
}

calculate(nums.first!, 1)
print(maxV)
print(minV)
