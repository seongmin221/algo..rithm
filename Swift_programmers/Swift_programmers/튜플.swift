//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/11.
//

import Foundation

func solution(_ s:String) -> [Int] {
    
    var result: [Int] = []
    var temp: Set<String>
    
    var string = s
    let _ = string.removeFirst()
    let _ = string.removeLast()
    
    var substrings: [Set<String>] = []
    
    var start: String.Index = string.startIndex
    var end: String.Index = string.startIndex
    var newStart: String.Index = string.startIndex
    
    while string.count > 2 {
        let i = string.firstIndex(of: "{")!
        if let k = string.range(of: "},{")?.lowerBound {
            start = string.index(i, offsetBy: 1)
            end = string.index(k, offsetBy: -1)
            newStart = string.index(k, offsetBy: 2)
        } else if let k = string.range(of: "}")?.lowerBound {
            start = string.index(i, offsetBy: 1)
            end = string.index(k, offsetBy: -1)
            newStart = string.index(k, offsetBy: 1)
        }
        substrings.append(Set(string[start...end].components(separatedBy: ",")))
        string = String(string[newStart..<string.endIndex])
    }
    
    substrings.sort(by: { $0.count < $1.count })
    print(substrings)
    temp = substrings.removeFirst()
    result.append(Int(temp.first!)!)
    
    for substring in substrings {
        let subtractSet = substring.subtracting(temp)
        temp = substring.union(temp)
        result.append(Int(subtractSet.first!)!)
    }
    
    return result
}

print(solution("{{2,1},{2},{2,1,3},{2,1,3,4}}"))
print(solution("{{5}}"))

//s    result
//"{{2},{2,1},{2,1,3},{2,1,3,4}}"    [2, 1, 3, 4]
//"{{1,2,3},{2,1},{1,2,4,3},{2}}"    [2, 1, 3, 4]
//"{{20,111},{111}}"    [111, 20]
//"{{123}}"    [123]
//"{{4,2,3},{3},{2,3,4,1},{2,3}}"    [3, 2, 4, 1]
