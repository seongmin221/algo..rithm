//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/9/24.
//

import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {
    
    var order = skill.map { String($0) }
    var trees = skill_trees.map { tree in tree.map { String($0) } }
    var ans = trees.count
    
    for tree in trees {
        var skillsInTree: [String] = []
        for s in tree {
            if order.contains(s) {
                skillsInTree.append(s)
            }
        }
        
        for i in 0..<skillsInTree.count {
            if order[i] == skillsInTree[i] { continue }
            else {
                ans -= 1
                break
            }
        }
    }
    
    return ans
}

//print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
