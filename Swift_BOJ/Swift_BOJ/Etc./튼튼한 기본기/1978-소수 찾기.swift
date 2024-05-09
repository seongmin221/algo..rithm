//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/3/23.
//

import Foundation

func solution() -> Int {
    _ = Int(readLine()!)!
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var result = 0
    for k in input {
        result += k.isPrime() ? 1 : 0
    }
    return result
}

extension Int {
    func isPrime() -> Bool {
        if self == 1 { return false }
        for i in Array(1...Int(sqrt(Double(self)))) {
            guard i != 1 else { continue }
            if self.isMultiple(of: i) { return false }
        }
        return true
    }
}

print(solution())
