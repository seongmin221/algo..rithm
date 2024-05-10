//
//  1027-고층 건물.swift
//  Swift_BOJ
//
//  Created by 이성민 on 5/10/24.
//

import Foundation

func solution() {
    
    var result: Int = 0
    
    let N = Int(readLine()!)!
    let buildings = readLine()!.split(separator: " ").map { Int($0)! }
    
    for x1 in 0..<N {
        let y1 = buildings[x1]
        var count: Int = N-1
        
        for x2 in 0..<x1 {
            let y2 = buildings[x2]
            for m in x2+1..<x1 {
                let n = buildings[m]
                if (y1-y2)*(m-x1) <= (x1-x2)*(n-y1) {
                    count -= 1
                    break
                }
            }
        }
        
        for x2 in x1+1..<N {
            let y2 = buildings[x2]
            for m in x1+1..<x2 {
                let n = buildings[m]
                if (y2-y1)*(m-x1) <= (x2-x1)*(n-y1) {
                    count -= 1
                    break
                }
            }
        }
        
        result = max(result, count)
    }
    
    print(result)
}

//solution()

//print("1: \(x1), \(y1)", "/ 2: \(x2), \(y2)", "/ \(m), \(n)")

