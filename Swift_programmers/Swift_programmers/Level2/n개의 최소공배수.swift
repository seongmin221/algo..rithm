//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/10/24.
//

import Foundation

func solution(_ arr: [Int]) -> Int {
    return arr.reduce(1, { findLCM($0, $1) })
}

func findLCM(_ n1: Int, _ n2: Int) -> Int {
    
    let x = max(n1, n2)
    let y = min(n1, n2)
    
    if x % y == 0 { return x }
    
    var mx = x
    var my = y
    while mx != my {
        if mx > my { my += y }
        else if mx < my { mx += x }
        else { break }
    }
    
    return mx
}

//print(solution([2,6,8,14]))
