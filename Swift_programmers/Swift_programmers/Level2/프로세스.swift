//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/4/23.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    print(priorities, location)
    var priorities = priorities
    var indexes = Array(0..<priorities.count)
    var count = 1
    
    while !priorities.isEmpty {
        let curP = priorities.removeFirst()
        let curI = indexes.removeFirst()
        if priorities.allSatisfy({ curP >= $0 }) {
            if curI == location { break }
            else { count += 1}
        } else {
            priorities.append(curP)
            indexes.append(curI)
        }
    }
    return count
}
