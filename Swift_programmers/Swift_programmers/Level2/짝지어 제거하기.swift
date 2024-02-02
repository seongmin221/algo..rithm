//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/2/24.
//

import Foundation

func solution(_ s: String) -> Int {
    
    var answer = 0
    
    var string = s.map { String($0) }
    var stack: [String] = []
    var index = 0
    while index < string.count {
        
        let char = string[index]
        index += 1
        guard let last = stack.last else {
            stack.append(char)
            continue
        }
        
        if last == char {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    if stack.isEmpty { answer = 1 }
    else { answer = 0 }
    
    return answer
}
