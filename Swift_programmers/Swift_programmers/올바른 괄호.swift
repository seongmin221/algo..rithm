//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/07.
//

import Foundation

func solution(_ s:String) -> Bool {
    var lp = 0
    
    if s.last! == "(" || s.first! == ")" {
        return false
    }
    for p in s {
        if p == "(" {
            lp += 1
        } else {
            lp -= 1
        }
        if lp < 0 {
            return false
        }
    }
    if lp > 0 {
        return false
    } else {
        return true
    }
}

print(solution("(()("))

//s    answer
//"()()"    true
//"(())()"    true
//")()("    false
//"(()("    false
