//
//  Z.swift
//  Swift_BOJ
//
//  Created by 이성민 on 5/6/24.
//

import Foundation

//func solution() {
//
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//
//    let N = input[0]
//    let r = input[1]
//    let c = input[2]
//
//    func remainderByTwo(_ tar: Int) -> [Int] {
//        var result: [Int] = []
//        var left = 0
//        var right = 1 << N - 1
//
//        while left <= right {
//            let mid = (left + right) / 2
//            print(left, mid, right)
//            if tar <= mid {
//                result.append(0)
//                right = mid - 1
//            }
//            else {
//                result.append(1)
//                left = mid + 1
//            }
//        }
//        return result
//    }
//
//    var result: Int = 0
//
//    let rRem: [Int] = remainderByTwo(r)
//    var rMul: Int = 1
//    for r in rRem {
//        result += r * rMul * 2
//        rMul *= 2
//    }
//
//    let cRem: [Int] = remainderByTwo(c)
//    var cMul: Int = 1
//    for c in cRem {
//        result += c * cMul
//        cMul *= 4
//    }
//    print(rRem)
//    print(cRem)
//    print(result)
//}

extension Int {
    func toReverseBinary(digitCount: Int) -> [Int] {
        var count = digitCount
        var temp = self
        var result: [Int] = []
        while count > 0 {
            result.append(temp % 2)
            temp /= 2
            count -= 1
        }
        return result
    }
}

func solution() {
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    let N = input[0]
    let r = input[1]
    let c = input[2]
    
    let rBin = r.toReverseBinary(digitCount: N)
    let cBin = c.toReverseBinary(digitCount: N)
    
    var result: Int = 0
    var index: Int = 0
    while index < 2 * N {
        if index % 2 == 0 { // cBin
            result ^= (cBin[index/2] << index)
        } else { // rBin
            result ^= (rBin[index/2] << index)
        }
        index += 1
    }
    print(result)
}

//solution()
