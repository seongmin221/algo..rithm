//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/17.
//

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    // priorities 에 현재 대기중인 문서들의 우선순위
    // location 에 내가 요청한 문서의 위치
    // 내가 요청한 문서는 몇 번째에 프린트 될 지 return
    
    // 1. 인쇄 대기목록의 가장 앞에 있는 문서(J)를 대기목록에서 꺼냅니다.
    // 2. 나머지 인쇄 대기목록에서 J보다 중요도가 높은 문서가 한 개라도 존재하면 J를 대기목록의 가장 마지막에 넣습니다.
    // 3. 그렇지 않으면 J를 인쇄합니다.
    
    var result = 0
    
    var priorities = priorities
    var loc = location
    
    var max = priorities.max()!
    
    if priorities[loc] == max {
        return 1
    }
    
    while priorities[loc] != max {
        print(loc, priorities)
        let i = priorities.firstIndex(of: max)!
        if i == 0 {
            priorities.removeFirst()
            result += 1
        } else {
            let temp = priorities[0..<i-1]
            priorities.append(contentsOf: temp)
            priorities.removeSubrange(0..<i+1)
            result += 1
            
            if loc < i {
                loc =  loc + priorities.count - i - 1
            } else if loc > i {
                loc = loc - i - 1
            }
        }
        max = priorities.max()!
    }
    
    return result
}

//print(solution([2, 1, 3, 2], 2))
print(solution([1, 1, 9, 1, 1, 1], 0))

//priorities    location    return
//[2, 1, 3, 2]    2    1
//[1, 1, 9, 1, 1, 1]    0    5


// 1 1 9 1 1 1/
// 9 1 1 1/ 1 1
// 1 1 1/ 1 1
// 1 1/ 1 1
// 1/ 1 1

