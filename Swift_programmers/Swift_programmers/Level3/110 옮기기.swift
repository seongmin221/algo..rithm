//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/14/24.
//

import Foundation

func solution(_ s: [String]) -> [String] {
    
    var result: [String] = []
    
    for string in s {
        var stack: [String] = []
        var count110 = 0
        
        for c in string {
            if stack.count >= 2 && stack[stack.count-2] == "1" && stack[stack.count-1] == "1" && c == "0" {
                count110 += 1
                stack.removeLast()
                stack.removeLast()
            } else {
                stack.append(String(c))
            }
        }
        
        var array110 = Array(repeating: "110", count: count110).reduce("", { $0 + $1 })
        if let last0 = stack.lastIndex(of: "0") {
            stack.insert(array110, at: last0 + 1)
            result.append(stack.reduce("", { $0 + $1 }))
        } else {
            array110 += stack.reduce("", { $0 + $1 })
            result.append(array110)
        }
    }
    
    return result
}

//print(solution(["1110","100111100","0111111010"]))

// MARK: - 3차 시도: 9 ~ 17 통과 / 나머지 시간초과

//func solution(_ s: [String]) -> [String] {
//    
//    var result: [String] = []
//    
//    for string in s {
//        var stack = ""
//        var count110 = 0
//        for c in string {
//            if stack.count >= 2 && stack.suffix(2) == "11" && c == "0" {
//                stack.removeLast(2)
//                count110 += 1
//            } else {
//                stack.append(c)
//            }
//        }
//        
//        var array110 = Array(repeating: "110", count: count110).reduce("", { $0 + $1 })
//        if let last0 = stack.lastIndex(of: "0") {
//            stack.insert(contentsOf: array110, at: stack.index(last0, offsetBy: 1))
//            result.append(stack)
//        } else {
//            array110 += stack
//            result.append(array110)
//        }
//    }
//    
//    return result
//}


// MARK: - 2차 시도: 시간초과

//func solution(_ s: [String]) -> [String] {
//    
//    var result: [String] = []
//    
//    for string in s {
//        var stack: [Int] = []
//        var numCount = 0
//        
//        var dupString = string
//        while !dupString.isEmpty {
//            stack.append(Int(dupString.removeFirst().description)!)
//            if stack.suffix(3) == [1, 1, 0] {
//                stack.removeLast(3)
//                numCount += 1
//            }
//        }
//        
//        if stack.contains(0) {
//            for _ in 0..<numCount {
//                let i = Array(stack.reversed()).firstIndex(of: 0)!
//                stack.insert(contentsOf: [1, 1, 0], at: stack.count - i)
//            }
//        } else {
//            for _ in 0..<numCount {
//                stack.insert(contentsOf: [1, 1, 0], at: 0)
//            }
//        }
//        
//        result.append(stack.reduce("", { String($0) + String($1) }))
//    }
//    
//    return result
//}



// MARK: - 1차 시도: 시간초과 & 틀림

//func solution(_ s: [String]) -> [String] {
//    
//    var result: [String] = []
//    var strings = s
//    
//    for i in 0..<s.count {
//        while true {
//            print(strings[i])
//            guard let index = strings[i].find(string: "111", after: 0) else { break }
//            var distance = strings[i].distance(from: strings[i].startIndex, to: index)
//            
//            guard var start = strings[i].find(string: "110", after: distance) else { break }
//            var end = strings[i].index(start, offsetBy: 3)
//            
//            strings[i].replaceSubrange(start..<end, with: "")
//            strings[i].insert(contentsOf: "110", at: index)
//        }
//        result.append(strings[i])
//    }
//    
//    return result
//}
//
//extension String {
//    func find(string: String, after offset: Int) -> String.Index? {
//        guard offset + 3 <= self.count else { return nil }
//        for i in 0..<self.count - 2 - offset {
//            var start = self.index(self.startIndex, offsetBy: offset + i)
//            var end = self.index(start, offsetBy: 3)
//            if self[start..<end] == string { return start }
//        }
//        return nil
//    }
//}

//print(solution(["1110","100111100","0111111010"]))
