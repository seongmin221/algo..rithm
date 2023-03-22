//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/21.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var cnt = 0
    for babble in babbling {
        var parsed = babble
        for word in words {
            parsed = parsed.replacingOccurrences(of: word, with: "_")
        }
        parsed = parsed.replacingOccurrences(of: "_", with: "")
        if parsed == "" {
            cnt += 1
        }
    }
    return cnt
}

solution(["aya", "yee", "u", "maa", "wyeoo"])


//["aya", "yee", "u", "maa", "wyeoo"]    1
//["ayaye", "uuuma", "ye", "yemawoo", "ayaa"]    3
