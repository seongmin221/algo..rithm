//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/17/24.
//

import Foundation

func solution(_ record: [String]) -> [String] {
    
//    enum Action: String {
//        case enter = "님이 들어왔습니다."
//        case leave = "님이 나갔습니다."
//        case change
//    }
    
    let enter: String = "님이 들어왔습니다."
    let leave: String = "님이 나갔습니다."
    
    var idMap: [String: String] = [:]
    var idOrder: [String] = []
    var actions: [String] = []
    
    for rec in record {
        let r = rec.split(separator: " ").map { String($0) }
        
        let action = r[0]
        let id = r[1]
        
        switch action {
        case "Enter":
            idOrder.append(id)
            actions.append(enter)
            idMap[id] = r[2]
        case "Leave":
            idOrder.append(id)
            actions.append(leave)
        case "Change":
            idMap[id] = r[2]
        default: break
        }
    }
    
    var result: [String] = []
    for i in 0..<actions.count {
        result.append(idMap[idOrder[i]]! + actions[i])
    }
    
    return result
}

//print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
