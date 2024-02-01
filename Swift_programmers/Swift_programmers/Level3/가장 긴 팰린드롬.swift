//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/31/24.
//

import Foundation

func solution(_ s: String) -> Int {
    
    let array = s.map { String($0) }
    let arrayCount = array.count
    for len in stride(from: arrayCount, to: 1, by: -1) {
        for s in 0...arrayCount-len {
            let start = s
            let end = len + start - 1
            
            var isPalindrome = true
            var offset = 0
            while offset <= len/2 {
                if array[start+offset] != array[end-offset] {
                    isPalindrome = false
                    break
                }
                offset += 1
            }
            
            if isPalindrome { return len }
        }
    }
    
    return 1
}

//print(solution("abcdcba"))
//print(solution("abacde"))
