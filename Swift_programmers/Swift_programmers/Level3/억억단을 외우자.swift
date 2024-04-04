//
//  억억단을 외우자.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/5/24.
//

import Foundation

// 소인수분해
// nC2 계산

//extension Int {
//    func factorization() -> [Int: Int] {
//        guard self != 1 else { return [1: 1]}
//
//        var factors: [Int: Int] = [:]
//
//        var n = self
//        var divisor: Int = 2
//        while divisor <= n {
//            if n % divisor == 0 {
//                n /= divisor
//                if factors[divisor] == nil { factors[divisor] = 1 }
//                else { factors[divisor]! += 1 }
//            }
//            else {
//                divisor += divisor == 2 ? 1 : 2
//            }
//        }
//        return factors
//    }
//}
//
//func solution(_ e: Int, _ starts: [Int]) -> [Int] {
//
//    func freq(of factorized: [Int: Int]) -> Int {
//        factorized.values.reduce(1, { $0 * ($1 + 1) })
//    }
//
//    func findMax(_ first: (Dictionary<Int, Int>.Element), _ second: (Dictionary<Int, Int>.Element)) -> Bool {
//        if first.value < second.value { return true }
//        else if first.value == second.value { return first.key > second.key }
//        else { return false }
//    }
//
//    let minStart: Int = starts.min()!
//    var freqMap: [Int: Int] = [:]
//    for num in minStart...e {
//        freqMap[num] = freq(of: num.factorization())
//    }
//
//    var result: [Int] = []
//    var currentMax = freqMap.max(by: findMax)!.key
//    for start in starts {
//        if start <= currentMax {
//            result.append(currentMax)
//            continue
//        }
//        currentMax = freqMap
//            .filter({ $0.key >= start })
//            .max(by: findMax)!.key
//        result.append(currentMax)
//    }
//
//    return result
//}

//extension Int {
//
//    func primeFactorization() -> [Int: Int] {
//        var temp = self
//        var divisor = 2
//        var factors: [Int: Int] = [:]
//        while divisor * divisor <= temp {
//            while temp % divisor == 0 {
//                if factors[divisor] == nil { factors[divisor] = 1 }
//                else { factors[divisor]! += 1 }
//                temp /= divisor
//            }
//            divisor += divisor == 2 ? 1 : 2
//        }
//        if temp > 1 { factors[temp] = 1 }
//
//        return factors
//    }
//
//    func primeFactorizedFreq() -> [Int] {
//        var temp = self
//        var times = 0
//        var divisor = 2
//        var factorFreq: [Int] = []
//        while divisor * divisor <= temp {
//            while temp % divisor == 0 {
//                times += 1
//                temp /= divisor
//            }
//            factorFreq.append(times)
//            times = 0
//            divisor += divisor == 2 ? 1 : 2
//        }
//        if temp > 1 { factorFreq.append(1) }
//
//        return factorFreq
//    }
//
//    func freq() -> Int {
//        if self == 1 { return 1 }
//
//        var temp = self
//        var count = 2
//        var divisor = 2
//        while divisor * divisor < self {
//            while temp % divisor == 0 {
//                temp /= divisor
//                count += 2
//            }
//            temp = self
//            divisor += divisor == 2 ? 1 : 2
//        }
//        if divisor * divisor == self { count += 1 }
//
//        return count
//    }
//}
//
//func solution(_ e: Int, _ starts: [Int]) -> [Int] {
//
//    func freq(of factorized: [Int]) -> Int {
//        return factorized.reduce(1, { $0 * ($1 + 1) })
//    }
//
//    var test: [Int] = .init(repeating: 0, count: e+1)
//    for i in 2..<e+1 {
//        for j in 1..<min(e/i+1, i) {
//            test[i*j] += 2
//        }
//    }
//    for i in 1..<Int(sqrt(Double(e)))+1 {
//        test[i * i] += 1
//    }
//    print(test)
//
//    var freqArray: [Int] = [0]
//    for num in 1...e {
//        freqArray.append(num.freq())
//    }
//
//    var dp: [Int] = .init(repeating: e, count: e+1)
//    var currentMaxFreq = freqArray.last!
//    var currentMax = e
//    for i in stride(from: e, to: 0, by: -1) {
//        if freqArray[i-1] < currentMaxFreq { dp[i-1] = currentMax }
//        else {
//            currentMaxFreq = freqArray[i-1]
//            currentMax = i-1
//            dp[i-1] = currentMax
//        }
//    }
//
//    return starts.map { dp[$0] }
//}

func solution(_ e: Int, _ starts: [Int]) -> [Int] {
    
    var divisors: [Int] = .init(repeating: 0, count: e+1)
    for i in 2..<e+1 {
        for j in 1..<min(e/i+1, i) {
            divisors[i*j] += 2
        }
    }
    for i in 1..<Int(sqrt(Double(e)))+1 {
        divisors[i * i] += 1
    }
    
    var dp: [Int] = .init(repeating: e, count: e+1)
    var currentMaxFreq = divisors.last!
    var currentMax = e
    for i in stride(from: e, to: 0, by: -1) {
        if divisors[i-1] < currentMaxFreq { dp[i-1] = currentMax }
        else {
            currentMaxFreq = divisors[i-1]
            currentMax = i-1
            dp[i-1] = currentMax
        }
    }
    
    return starts.map { dp[$0] }
}

//print(solution(8, [1,3,7]))
