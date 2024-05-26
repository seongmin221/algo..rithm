//
//  268. Missing Number.swift
//  Swift_leetcode
//
//  Created by 이성민 on 5/26/24.
//

import Foundation

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = nums.reduce(0, +)
        for i in 0..<nums.count+1 {
            sum -= i
        }
        return -1 * sum
    }
}
