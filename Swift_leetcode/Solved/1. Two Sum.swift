//
//  1. Two Sum.swift
//  Swift_leetcode
//
//  Created by 이성민 on 5/2/24.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        if nums.count == 2 { return [0, 1] }
        
        var table: [Int: Int] = [:]
        for (i, n) in nums.enumerated() {
            if let index = table[target-n] {
                return [i, index]
            } else {
                table[n] = i
            }
        }
        
        return []
    }
}
