//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/06.
//

import Foundation

func solution(_ nums:[Int]) -> Int {
    
    // nums 에 있는 숫자 3개를 더해서 소수를 만드는 경우의 수를 계산하여 반환
    
    var answer = 0
    
    let numsCnt = nums.count
    for i in 0..<numsCnt {
        let iNum = nums[i]
        for j in i+1..<numsCnt {
            let jNum = nums[j]
            for k in j+1..<numsCnt {
                let kNum = nums[k]
                let num = iNum + jNum + kNum
                let limit = Int(sqrt(Double(num)))
                for div in 2...limit {
                    if num % div == 0 {
                        break
                    } else if div == limit {
                        answer += 1
                    }
                }
            }
        }
    }
    return answer
}

print(solution([1,2,7,6,4]))

//nums    result
//[1,2,3,4]    1
//[1,2,7,6,4]    4
