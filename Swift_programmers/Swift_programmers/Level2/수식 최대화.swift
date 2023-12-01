//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/30/23.
//

import Foundation

func calculate(expressions: [String], priority: [String]) -> Int {
    var exp = expressions
    var pri = priority
    while exp.count != 1 {
        let op = pri.removeFirst()
        while exp.contains(op) {
            let i = exp.firstIndex(of: op)!
            let temp = Array(exp[i-1...i+1])
            var newVal = 0
            switch op {
            case "+": newVal = Int(temp[0])! + Int(temp[2])!
            case "-": newVal = Int(temp[0])! - Int(temp[2])!
            case "*": newVal = Int(temp[0])! * Int(temp[2])!
            default: continue
            }
            exp.removeSubrange(i-1...i+1)
            exp.insert(String(newVal), at: i-1)
        }
    }
    
    return Int(exp.first!)!
}

func solution(_ expression:String) -> Int64 {
    
    var splitExp = [String]()
    var opSet = Set<String>()
    var temp = "".startIndex
    expression.enumerated().forEach { i, exp in
        if !exp.isNumber {
            let op = expression.index("".startIndex, offsetBy: i)
            splitExp.append(String(expression[temp..<op]))
            splitExp.append(String(exp))
            opSet.insert(String(exp))
            temp = expression.index(op, offsetBy: 1)
        }
        
        if i == expression.count - 1 {
            splitExp.append(String(expression[temp..<expression.endIndex]))
        }
    }
    
    var ops = Array(opSet)
    var results = [Int]()
    for i in 0..<opSet.count {
        ops.swapAt(i, (i+1) % opSet.count)
        results.append(calculate(expressions: splitExp, priority: ops))
        ops.swapAt(i, (i+2) % opSet.count)
        results.append(calculate(expressions: splitExp, priority: ops))
    }
    
    return results.map { Int64(abs($0)) }.max()!
}

extension Int {
    func fact() -> Int {
        if self == 1 { return self }
        else { return self * (self - 1) }
    }
}

//print(solution("100-200*300-500+20"))
