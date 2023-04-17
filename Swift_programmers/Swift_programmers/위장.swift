//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/16.
//

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    // 입력값으로 들어오는 clothes는 [<의상 이름>, <의상 종류>]로 들어옴
    // 의상 이름은 겹칠 수 없음
    
    var typeDict: Dictionary<String, Int> = [:]
    for e in Set(clothes.map { $0[1] }) {
        typeDict[e] = 0
    }
    for cloth in clothes {
        typeDict[cloth[1]]! += 1
    }
    
    var result = 1
    for val in typeDict.values {
        result *= val + 1
    }
    return result - 1
}

print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))


//clothes    return
//[["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]    5
//[["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]    3
