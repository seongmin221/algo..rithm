//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/10/24.
//

import Foundation

func solution(_ k: Int, _ ranges: [[Int]]) -> [Double] {
    
    var result: [Double] = []
    var arr = lotharArr(k)
    var n = arr.count
    
    var area: [Double] = []
    for i in 0..<n-1 { area.append((arr[i] + arr[i+1])/2) }
    
    for range in ranges {
        let r = [range[0], n + range[1] - 1]
        if r[0] > r[1] { result.append(-1); continue }
        if r[0] == r[1] { result.append(0); continue }
        
        var a = Double()
        for i in r[0]..<r[1] {
            a += area[i]
        }
        result.append(a)
    }
    
    return result
}

func lotharArr(_ k: Int) -> [Double] {
    var result = [k]
    
    var i = k
    while i > 1 {
        if i % 2 == 0 { i /= 2 }
        else { i = i * 3 + 1 }
        result.append(i)
        
        i = result.last!
    }
    return result.map { Double($0) }
}

print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))
