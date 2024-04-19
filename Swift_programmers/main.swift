//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/22/24.
//

import Foundation

func solution(_ s:String) -> String {
    let strings = s.split(separator: " ").map { String($0) }
    
    var result: [String] = []
    for string in strings {
        var newString = ""
        for i in 0..<string.count {
            let start = string.startIndex
            let index = string.index(start, offsetBy: i)
            let newChar = i % 2 != 0 ? string[index].uppercased() : string[index]
        }
        result.append(newString)
    }
    
    var answer = ""
    let last = result.removeLast()
    for string in result {
        answer += string + " "
    }
    answer += last
    
    return answer
}

print(solution("try hello world"))
