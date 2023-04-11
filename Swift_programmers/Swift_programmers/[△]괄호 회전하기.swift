//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/09.
//

import Foundation

func solution(_ s:String) -> Int {
    
    // (, ), {, }, [, ] 로 이루어진 s가 주어졌을 때
    // s 를 왼쪽으로 (회전)이동시켜 올바른 괄호 쌍이 나오는 경우의 수
    // 단, 0 이상 s 미만으로 이동 가능
    
    // left shift를 할 때 연속으로 괄호 쌍이 알맞게 나올 수는 없음
    // 가장 바깥쪽의 괄호가 모두 left shift를 통해 넘어가야지 알맞은 괄호 쌍이 생성됨
    
    // for 문 한 바퀴 돌리고, lsp, lmp, llp 값이 모두 0 이어야지 알맞은 괄호 쌍일 가능성이 있음
    
    // 가장 뒤에 있는 괄호 쌍 remove
    
    var result = 0
    var string = s
    let cnt = s.count
    var shiftCnt = 0
    
    let pSet = Set(["()", "{}", "[]"])
    
    for _ in 0..<cnt {
        
        // 마지막 두 괄호가 쌍인지 확인
        if pSet.contains(string.suffix(2).description) {
            string.popLast()
            string.popLast()
        }
        
        if shiftCnt == 1 || shiftCnt == 0 {
            result += 1
        } else if shiftCnt == 2 {
            result += 1
            shiftCnt = 0
        }
        
        if string.isEmpty {
            break
        }
        // left shift
        string.append(string.first!)
        string.removeFirst()
        shiftCnt += 1
    }
    
    return result
}

print(solution("[](){}"))
print("-----")
print(solution("}]()[{"))

//s    result
//"[](){}"    3
//"}]()[{"    2
//"[)(]"    0
//"}}}"    0



//let smallP = ["(", ")"]
//let mediumP = ["{", "}"]
//let largeP = ["[", "]"]
//
//var lsp = 0
//var lmp = 0
//var llp = 0
