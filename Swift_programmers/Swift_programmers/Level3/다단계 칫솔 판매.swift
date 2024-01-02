//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/1/24.
//

import Foundation

// 각 판매원의 이름을 담은 배열 enroll
// 각 판매원을 다단계 조직에 참여시킨 다른 판매원의 이름을 담은 배열 referral
// 판매량 집계 데이터의 판매원 이름을 나열한 배열 seller
// 판매량 집계 데이터의 판매 수량을 나열한 배열 amount

func solution(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    
    var childParentMap: [String: String] = [:]
    var revenue: [String: Int] = ["-": 0]
    for e in enroll { revenue[e] = 0 }
    for i in 0..<enroll.count { childParentMap[enroll[i]] = referral[i] }
    print(childParentMap)
    
    // MARK: -
    
    func distributeRev(from seller: String, rev: Int) {
        let distToParent = rev / 10
        guard distToParent >= 1, let p = childParentMap[seller] else { return }
        revenue[seller]! -= distToParent
        revenue[p]! += distToParent
//        print("rev: \(rev)")
//        print("\(seller) -> \(p): \(distToParent)")
//        print("seller: \(revenue[seller]!)")
//        print("parent: \(revenue[p]!)")
//        print("----")
        distributeRev(from: p, rev: distToParent)
    }
    for i in 0..<seller.count {
        let rev = amount[i] * 100
        revenue[seller[i]]! += rev
        distributeRev(from: seller[i], rev: rev)
        print(revenue)
    }
    
    
    var result: [Int] = []
    for e in enroll {
        result.append(revenue[e]!)
    }
    
    
    return result
}

//print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10]))
