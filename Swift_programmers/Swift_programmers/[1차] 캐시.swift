//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/11.
//

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    // 0 <= cacheSize <= 30
    // cities: 도시 이름으로 이루어진 문자 배열 <= 100,000
    // cities 에는 공백, 숫자, 특수문자 없음, 대소문자 구분 없음, 최대 20자
    
    // 캐시 조건은 LRU (Least Recently Used)
    // cache hit - 1
    // cache miss - 5
    
    // 총 걸린 시간 계산
    
    var cache: [String] = []
    var time: Int = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for city in cities {
        let lowercasedCity = city.lowercased()
        
        if let index = cache.firstIndex(of: lowercasedCity) {
            time += 1
            cache.append(cache.remove(at: index))
        } else {
            time += 5
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
            cache.append(lowercasedCity)
        }
    }
    return time
}

print(solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))


//캐시크기(cacheSize)    도시이름(cities)    실행시간
//3    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    50
//3    ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]    21
//2    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    60
//5    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]    52
//2    ["Jeju", "Pangyo", "NewYork", "newyork"]    16
//0    ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]    25
