//
//  장마.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/11/24.
//

import Foundation

func rain() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    // let n = input[0]
    let m = input[1]

    var k: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

    var houses: Set<Int> = []
    for day in 1...m {
        let range = readLine()!.split(separator: " ").map { Int($0)! }
        let s = range[0]
        let e = range[1]

        for i in s...e {
            k[i-1] += 1
            houses.insert(i)
        }

        if day % 3 == 0 {
            for house in houses {
                k[house-1] -= 1
            }
            houses.removeAll()
        }
    }

    var result: String = ""
    for h in k {
        result += " \(h)"
    }
    print(result)

}
