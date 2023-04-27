//
//  mina.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/27.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    // numbers 가 주어지고, 여기에 있는 숫자들을 + / - 하여
    // target 을 만들 수 있는 경우의 수
    
    var result = 0
    let numLength = numbers.count
    
    func dfs(_ current: Int, _ index: Int) {
        if index == numLength {
            if current == target {
                result += 1
            }
            return
        }
        
        let currentAdd = current + numbers[index]
        let currentSub = current - numbers[index]
        
        dfs(currentAdd, index + 1)
        dfs(currentSub, index + 1)
    }
    
    dfs(0, 0)
    
    return result
}

print(solution([1, 1, 1, 1, 1], 3))
print(solution([4, 1, 2, 1], 4))

//numbers    target    return
//[1, 1, 1, 1, 1]    3    5
//[4, 1, 2, 1]    4    2
