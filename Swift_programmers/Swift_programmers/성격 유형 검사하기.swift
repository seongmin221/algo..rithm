//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/31.
//

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var personalities: Dictionary<String, Int> = [
        "R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0,
    ]
    let surveyCnt = survey.count
    var result = ""
    for i in 0..<surveyCnt {
        let choice = choices[i]
        if choice < 4 {
            personalities[survey[i].first!.description]! += 4-choice
        } else if choice > 4 {
            personalities[survey[i].last!.description]! += choice-4
        } else {
            continue
        }
    }
    
    result += personalities["R"]! >= personalities["T"]! ? "R" : "T"
    result += personalities["C"]! >= personalities["F"]! ? "C" : "F"
    result += personalities["J"]! >= personalities["M"]! ? "J" : "M"
    result += personalities["A"]! >= personalities["N"]! ? "A" : "N"
    
    return result
}
