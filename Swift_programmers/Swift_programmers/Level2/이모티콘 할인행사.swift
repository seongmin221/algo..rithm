//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/19/24.
//

import Foundation

/// users의 원소는 [비율, 가격]의 형태
///     비율% 이상의 할인이 있는 이모티콘을 모두 구매한다는 의미
///     가격이상의 돈을 이모티콘 구매에 사용한다면, 이모티콘 구매를 모두 취소하고 이모티콘 플러스 서비스에 가입
/// emoticons[i]는 i+1번 이모티콘의 정가를 의미
/// 이모티콘 할인율은 정해지지 않음
///
/// 아래 목표를 최대한 달성해야 함
/// 1. 이모티콘 플러스 서비스 가입자를 최대한 늘리는 것.
/// 2. 이모티콘 판매액을 최대한 늘리는 것.

func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
    
    let saleConst: [Int] = [10, 20, 30, 40]
    var saleAmount: [Int] = .init(repeating: 0, count: emoticons.count)
    
    var maxSubsCount = 0
    var maxProfit = 0
    
    func dfs(_ nth: Int) {
        if nth == saleAmount.count {
            var subsCount = 0
            var profit = 0
            
            users.forEach { user in
                var userPrice = 0
                zip(emoticons, saleAmount).forEach { price, sale in
                    if user[0] <= sale { userPrice += price * (100 - sale) / 100 }
                }
                
                if userPrice >= user[1] { subsCount += 1; userPrice = 0 }
                profit += userPrice
            }
            
            if maxSubsCount < subsCount {
                maxSubsCount = subsCount
                maxProfit = profit
            }
            else if maxSubsCount == subsCount && maxProfit < profit {
                maxProfit = profit
            }
            
            return
        }
        
        saleConst.forEach {
            saleAmount[nth] = $0
            dfs(nth + 1)
        }
    }
    
    dfs(0)
    
    return [maxSubsCount, maxProfit]
}

//print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
//print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
