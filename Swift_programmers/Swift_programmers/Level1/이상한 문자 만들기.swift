//
//  이상한 문자 만들기.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/19/24.
//

import Foundation

func solution(_ s: String) -> String {

    var result = ""

    var chars = s.map { String($0) }

    var index = 0
    for char in chars {
        guard char != " " else {
            index = 0
            result += " "
            continue
        }
        if index % 2 == 0 {
            result += char.uppercased()
        } else {
            result += char.lowercased()
        }
        index += 1
    }

    return result
}

