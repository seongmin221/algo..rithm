//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/13.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    // progresses: 먼저 배포 되어야 하는 순서대로 작업의 진도가 적힌 배열
    // speeds: 각 작업의 개발 속도가 적힌 배열
    
    // 먼저 배포되어야 할 작업이 완료되지 않은 상태면 뒤에 있는 기능도 배포 못함
    // 배포마다 몇 개의 기능이 배포되는지?
    
    let progressCnt = progresses.count
    var daysNeeded: [Int] = []
    
    for i in 0..<progressCnt {
        daysNeeded.append(Int(ceil(Double(100 - progresses[i])/Double(speeds[i]))))
    }
    print(daysNeeded)
    
    var result: [Int] = []
    var flag = daysNeeded.first!
    var idx = 0
    
    repeat {
        flag = daysNeeded[idx]
        var cnt = 0
        while flag >= daysNeeded[idx] {
            cnt += 1
            idx += 1
            if idx >= progressCnt {
                break
            }
        }
        result.append(cnt)
    } while idx < progressCnt
    
    return result
}

print(solution([93, 30, 55], [1, 30, 5]))
print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))

//progresses    speeds    return
//[93, 30, 55]    [1, 30, 5]    [2, 1]
//[95, 90, 99, 99, 80, 99]    [1, 1, 1, 1, 1, 1]    [1, 3, 2]
