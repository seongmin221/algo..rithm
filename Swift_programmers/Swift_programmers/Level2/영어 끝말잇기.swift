//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/9/24.
//

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var ans = [0, 0]
    var w = words
    var i = 0
    
    var appeared: [String] = [w.removeFirst()]
    var start = String()
    var next = String()
    
    while true {
        guard i < words.count - 1 else { break }
        start = appeared.last!
        next = w.removeFirst()
        
        if start.last! == next.first! && !appeared.contains(next) {
            appeared.append(next)
            i += 1
            continue
        }
        else {
            ans = [(i+1)%n + 1, (i+1)/n + 1]
            break
        }
    }
    
    return ans
}

//print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
//print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
//print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
