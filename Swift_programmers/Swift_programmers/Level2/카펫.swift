//
//  카펫.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/22/23.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    let half = brown / 2
    
    var width = half - 3
    var height = 1
    while width >= height {
        if width * height == yellow { break }
        else {
            width -= 1
            height += 1
        }
    }
    
    return [width + 2, height + 2]
}
