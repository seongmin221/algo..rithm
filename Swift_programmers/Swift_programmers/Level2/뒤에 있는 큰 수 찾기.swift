//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/2/24.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    
    var answer: [Int] = .init(repeating: -1, count: numbers.count)
    var stack: [Int] = [0]
    
    var index = 0
    while index < numbers.count {
        
        while !stack.isEmpty && numbers[stack.last!] < numbers[index] {
            answer[stack.removeLast()] = numbers[index]
        }
        
        stack.append(index)
        index += 1
    }
    
    return answer
}

//print(solution([9, 1, 5, 3, 6, 2]))
