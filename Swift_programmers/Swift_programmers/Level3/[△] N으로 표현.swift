//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/4/24.
//

import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    
    if number == N { return 1 }
    
    var answer = -1
    func bfs(num: Int, count: Int) {
        guard count <= 8 else { return }
        if num == number {
            if answer == -1 { answer = count }
            else { answer = min(answer, count) }
            return
        }
        
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i { break }
            NN = NN * 10 + N
            bfs(num: num + NN, count: count + 1 + i)
            bfs(num: num - NN, count: count + 1 + i)
            bfs(num: num * NN, count: count + 1 + i)
            bfs(num: num / NN, count: count + 1 + i)
        }
    }
    
    bfs(num: 0, count: 0)
    
    return answer
}

//print(solution(5, 12))
