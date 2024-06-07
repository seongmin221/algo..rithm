//
//  2467-용액.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/8/24.
//

import Foundation

func liquid() -> String {
    
    let n = Int(readLine()!)!
    let liquids: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    
    var le: Int = 0
    var ri: Int = n-1
    
    var leLi: Int = liquids[le]
    var riLi: Int = liquids[ri]
    while le < ri {
        let sum = liquids[le] + liquids[ri]
        
        if abs(leLi + riLi) > abs(sum) {
            leLi = liquids[le]
            riLi = liquids[ri]
        }
        
        if sum > 0 {
            ri -= 1
        } else if sum < 0 {
            le += 1
        } else {
            return "\(leLi) \(riLi)"
        }
    }
    
    return "\(leLi) \(riLi)"
}

//print(liquid())
