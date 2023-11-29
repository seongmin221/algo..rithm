//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/28/23.
//

import Foundation

//1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
//2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
//3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
//  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
//4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
//  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
//  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
//  4-3. ')'를 다시 붙입니다.
//  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
//  4-5. 생성된 문자열을 반환합니다.

func splitPar(_ par: [String]) -> ([String], [String]) {
    var endIndex = 0
    var balCount = 0
    for i in 0..<par.count {
        switch par[i] {
        case "(": balCount += 1
        case ")": balCount -= 1
        default: continue
        }
        if balCount == 0 {
            endIndex = i
            break
        }
    }
    let u = par[0...endIndex].map { String($0) }
    let v = par[endIndex+1..<par.count].map { String($0) }
    return (u, v)
}

func rec(_ par: [String]) -> [String] {
    if par.isEmpty { return [] }
    
    var (u, v) = splitPar(par)
    if u.first == "(" {
        u += rec(v)
        return u
    }
    else {
        var newPar = ["("]
        newPar += rec(v)
        newPar.append(")")
        
        u.removeFirst()
        u.removeLast()
        u = u.map {
            switch $0 {
            case "(": return ")"
            case ")": return "("
            default: return ""
            }
        }
        
        newPar += u
        return newPar
    }
}

func solution(_ p: String) -> String {
    
    let par = p.map { String($0) }
    let result = rec(par).reduce("", { $0 + $1 })
    return result
}

//print(solution("()))((()"))
