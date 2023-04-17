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
    
    var priorities = priorities
    var loc = location
    var cnt = 0
    while true {
        let i = priorities.firstIndex(of: priorities.max()!)!
        if i == loc {
            cnt += 1
            break
        }
        
        if i == 0 {
            priorities.removeFirst()
            cnt += 1
            loc -= 1
        } else {
            let sub = priorities[0..<i]
            priorities.removeSubrange(0..<i)
            priorities.append(contentsOf: sub)
            if loc < i {
                loc = loc + priorities.count - i
            } else if loc > i {
                loc = loc - i
            }
            priorities.removeFirst()
            loc -= 1
            cnt += 1
        }
    }
    
    return cnt
}

print(solution([2, 1, 3, 2], 2))
//print(solution([1, 1, 9, 1, 1, 1], 0))

//priorities    location    return
//[2, 1, 3, 2]    2    1
//[1, 1, 9, 1, 1, 1]    0    5


// 1 1 9 1 1 1/
// 9 1 1 1/ 1 1
// 1 1 1/ 1 1
// 1 1/ 1 1
// 1/ 1 1

