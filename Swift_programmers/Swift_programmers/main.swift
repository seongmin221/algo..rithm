//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/14.
//

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    
    // str1 과 str2 를 두 글자씩 끊어서 생긴 다중집합의 원소로 만듬
    // 이때, 영어 외의 문자가 들어있다면 원소에서 제외
    
    // 두 다중집합의 자카드 유사도를 구하기
    // 자카드 유사도 = 교집합 / 합집합
    // 두 집합의 원소의 개수가 모두 0 이면 자카드유사도 = 1 로 정의
    
    var result: Float = 0
    
    var string1 = str1
    var string2 = str2
    
    var array1: [String] = []
    for _ in 0..<string1.count-1 {
        var element = ""
        element.append(string1.removeFirst())
        element.append(string1.first!)
        if element.isOnlyEnglish() {
            array1.append(element.lowercased())
        }
    }
    
    var array2: [String] = []
    for _ in 0..<string2.count-1 {
        var element = ""
        element.append(string2.removeFirst())
        element.append(string2.first!)
        if element.isOnlyEnglish() {
            array2.append(element.lowercased())
        }
    }
    
    if array1.count == 0 && array2.count == 0 {
        return 65536
    }
    
    let set1 = Set(array1)
    let intersect = Array(set1.intersection(array2))
    var dict1: [String: Int] = [:]
    var dict2: [String: Int] = [:]
    var mini: [Int] = []
    var maxi: [Int] = []
    for e in intersect {
        dict1[e] = 0
        dict2[e] = 0
        let _ = array1.map { if $0 == e { dict1[e]! += 1 } }
        let _ = array2.map { if $0 == e { dict2[e]! += 1 } }
        mini.append(min(dict1[e]!, dict2[e]!))
        maxi.append(max(dict1[e]!, dict2[e]!))
    }
//    print(mini)
//    print(maxi)
//    print(intersect)
//    result = floor(Float(unionCnt) / Float(set1.count + set2.count - unionCnt) * 65536)
    result = floor(Float() / Float() * 65536)
    return Int(result)
}

extension String {
    func isOnlyEnglish() -> Bool {
        let pattern = "^[a-zA-Z]*$"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
}

print(solution("aa1+aa2", "AAAA12"))

//str1    str2    answer
//FRANCE    french    16384
//handshake    shake hands    65536
//aa1+aa2    AAAA12    43690
//E=M*C^2    e=m*c^2    65536
