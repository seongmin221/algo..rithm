//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/05.
//

import Foundation

//func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    // 1. stage n 남아있는 사람 = stage n-2 남은 사람 - stage n-1 남은 사람
    // 2. stage n 실패율 = stage n에 있는 사람 / stage n 클리어 한 사람
    // 3. stage n 클리어 한 사람 =
//
//    var stagePeople: Dictionary<Int, Float> = [:]
//    for i in 1...N {
//        stagePeople[i] = 0
//    }
//    var stageFailure: Dictionary<Int, Float> = [:]
//    for i in 1...N {
//        stageFailure[i] = 0
//    }
//    var totalPeople: Float = Float(stages.count)
//
//    for stage in stages {
//        if stagePeople[stage] == nil {
//            stagePeople[stage] = 1
//        } else {
//            stagePeople[stage]! += 1
//        }
//    }
//    for stage in 1...N {
//        if stage >= 2 && stagePeople[stage-1] != nil {
//            totalPeople -= stagePeople[stage-1]!
//        }
//        stageFailure[stage] = stagePeople[stage]! / totalPeople
//    }
//
//    let result = stageFailure.sorted { val1, val2 in
//        if val1.1 == val2.1 {
//            return val1.0 < val2.0
//        } else {
//            return val1.1 > val2.1
//        }
//    }.map { $0.0 }
//
//    return result
//}

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    // N: 스테이지 개수
    // N+1: 모든 스테이지 클리어 한 경우
    // stages: 유저가 어느 스테이지에 남아있는지를 나타낸 배열
    
    // 스테이지의 실패율 구하기
    // n번째 스테이지에 남아있는 유저 수 / n번째 스테이지 이상으로 간 사람 수
    
    // 스테이지의 실패율이 높은 순서로 정렬하여 스테이지 배열 반환
    // 스테이지의 실패율이 같다면 더 낮은 스테이지부터
    
    var totalUser = Float(stages.count)
    var userAtStage: Dictionary<Int, Float> = [:]
    for i in 1...N+1 {
        userAtStage[i] = 0.0
    }
    for stage in stages {
        userAtStage[stage]! += 1.0
    }
    
    var failure: Dictionary<Int, Float> = [:]
    for i in 1...N {
        failure[i] = userAtStage[i]! / totalUser
        if totalUser == 0 {
            failure[i] = 0
        }
        totalUser -= userAtStage[i]!
    }
    print(failure)
    
    let result = failure.sorted {
        if $0.1 == $1.1 {
            return $0.0 < $1.0
        } else {
            return $0.1 > $1.1
        }
    }.map { $0.0 }
    
    return result
}

print(solution(5, [2, 1, 2, 2, 4, 3, 3]))
print(solution(4, [4, 4, 4, 4, 4]))

//N    stages                       result
//5    [2, 1, 2, 6, 2, 4, 3, 3]     [3,4,2,1,5]
//4    [4,4,4,4,4]                  [4,1,2,3]
