//
//  계수기 만들기.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/12/24.
//

import Foundation

func makingDigit() {
    let n = Int(readLine()!)!
    let maxNums: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    var curNums: [Int] = readLine()!
        .split(separator: " ")
        .map { Int($0)! }

    let k = Int(readLine()!)!

    func increase(_ digit: Int) {
        guard digit >= 0 else {
            return
        }

        if curNums[digit] < maxNums[digit] {
            curNums[digit] += 1
        } else {
            curNums[digit] = 0
            increase(digit - 1)
        }
    }

    for _ in 0..<k {
        increase(n-1)
    }

    print(curNums.reduce("", { $0 + String($1) }))
}
