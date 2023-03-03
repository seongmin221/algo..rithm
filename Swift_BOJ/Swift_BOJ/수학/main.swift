//
//  1000-A+B.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/03.
//

import Foundation

var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = 0
nums.forEach { num in
    result += num
}
print(result)

