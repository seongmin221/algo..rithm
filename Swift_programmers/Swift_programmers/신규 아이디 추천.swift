//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/30.
//

import Foundation

func solution(_ new_id:String) -> String {
    var filteredId = new_id.lowercased()
    
    let allowedChars: Set<Character> = Set("abcdefghijklmnopqrstuvwxyz1234567890-_.")
    filteredId = String(filteredId.filter { allowedChars.contains($0) })
    
    while true {
        if filteredId.isEmpty {
            filteredId = "a"
        }
        
        if filteredId.contains("..") {
            filteredId = filteredId.replacingOccurrences(of: "..", with: ".")
        } else if filteredId.first! == "." {
            filteredId.removeFirst()
        } else if filteredId.last! == "." {
            filteredId.removeLast()
        } else if filteredId.count >= 16 {
            filteredId.removeLast()
        } else if filteredId.count <= 2 {
            filteredId += filteredId.last!.description
        } else {
            break
        }
    }
    
    return filteredId
}

print(solution("feqjoeigjf;aowjf/awlm/;fmweijfnwn.v.///fawn.,...w"))

// 3 <= id 길이 <= 15
// id는 a,b,c,..., 1,2,3..., -, _, . 만 사용 가능
// . 는 처음과 끝에는 사용 불가능, 연속 불가능


//no    new_id    result
//예1    "...!@BaT#*..y.abcdefghijklm"    "bat.y.abcdefghi"
//예2    "z-+.^."    "z--"
//예3    "=.="    "aaa"
//예4    "123_.def"    "123_.def"
//예5    "abcdefghijklmn.p"    "abcdefghijklmn"
