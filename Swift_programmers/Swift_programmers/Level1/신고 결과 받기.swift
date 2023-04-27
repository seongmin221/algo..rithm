//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/04.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let allUsers = id_list
    let reports = report.map { $0.components(separatedBy: " ") }
    
    var sentReports: Dictionary<String, Set<String>> = [:]
    for user in allUsers {
        sentReports[user] = []
    }
    
    var receivedReports: Dictionary<String, Set<[String]>> = [:]
    for user in allUsers {
        receivedReports[user] = []
    }
    
    var bannedUsers = Set<String>()
    var result: [Int] = Array(repeating: 0, count: allUsers.count)
    
    for rp in reports {
        sentReports[rp[0]]!.insert(rp[1])
        receivedReports[rp[1]]!.insert([rp[0], rp[1]])
        if receivedReports[rp[1]]!.count >= k {
            bannedUsers.insert(rp[1])
        }
    }
    
    var cnt = 0
    for user in allUsers {
        result[cnt] = sentReports[user]!.intersection(bannedUsers).count
        cnt += 1
    }
    
    return result
}

print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))

//id_list    report    k    result
//["muzi", "frodo", "apeach", "neo"]    ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]    2    [2,1,1,0]
//["con", "ryan"]    ["ryan con", "ryan con", "ryan con", "ryan con"]    3    [0,0]
