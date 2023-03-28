//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/27.
//

import Foundation

// X, Y 중 하나를 배열로, 나머지 하나는 겹치는 문자를
// replacingOccurences로 없애면서 Array에 기록해두기
// Array를 거꾸로 정렬하면 완성

//func solution(_ X:String, _ Y:String) -> String {
//    let xArray = X.split(separator: "")
//    var yArray = Y.split(separator: "")
//    var result = ""
//    var commonComp: [String] = []
//    for comp in xArray {
//        if let i = yArray.firstIndex(of: comp) {
//            yArray.remove(at: i)
//            commonComp.append(comp.description)
//        }
//    }
//    if commonComp.isEmpty {
//        return "-1"
//    } else if !commonComp.contains(["1","2","3","4","5","6","7","8","9"]) {
//        return "0"
//    } else {
//        commonComp = commonComp.sorted(by: >)
//        for comp in commonComp {
//            result += comp
//        }
//        return result
//    }
//}
// 무슨 이유에서인지 split은 사용되지 않고 contains에는 배열이 들어가지 않음


//func solution(_ X:String, _ Y:String) -> String {
//    let xArray = X.map { $0 }
//    var yArray = Y.map { $0 }
//    var commonComp: [String] = []
//    var result = ""
//    for comp in xArray {
//        if yArray.contains(comp) {
//            commonComp.append(comp.description)
//            yArray.remove(at: yArray.firstIndex(of: comp)!)
//        }
//    }
//    if commonComp.isEmpty {
//        return "-1"
//    } else {
//        commonComp = commonComp.sorted(by: >)
//        for comp in commonComp {
//            result += comp
//        }
//        if result.replacingOccurrences(of: "0", with: "") == "" {
//            return "0"
//        }
//        return result
//    }
//}
// 시간초과..!


func solution(_ X:String, _ Y:String) -> String {
    var result = ""
    let commonComp = Y.map { $0 }.filter { X.contains($0) }.sorted(by: >)
    if commonComp.isEmpty {
        return "-1"
    }
    for comp in commonComp {
        result += comp.description
    }
    if result.replacingOccurrences(of: "0", with: "") == "" {
        return "0"
    }
    return result
}
// 3, 5, 8, 10 - 실패
// 11 ~ 15 - 시간 초과

print(solution("12321", "42531"))

//X    Y    result
//"100"    "2345"    "-1"
//"100"    "203045"    "0"
//"100"    "123450"    "10"
//"12321"    "42531"    "321"
//"5525"    "1255"    "552"
