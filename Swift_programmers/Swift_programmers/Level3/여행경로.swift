//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/1/24.
//

import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    
    var ticketMap: [String: [String]] = [:]
    for ticket in tickets {
        if ticketMap[ticket[0]] == nil { ticketMap[ticket[0]] = [ticket[1]] }
        else { ticketMap[ticket[0]]!.append(ticket[1]) }
    }
    for (key, value) in ticketMap { ticketMap[key] = value.sorted() }
    
    
    var isFinished: Bool = false
    var result: [String] = []
    func dfs(from: String, visited: [String], remaining: [String: [String]]) {
        if isFinished { return }
        print("from: \(from), visited: \(visited), tickets: \(tickets)")
        var visited = visited
        visited.append(from)
        if visited.count == tickets.count + 1 {
            isFinished = true
            result = visited
            return
        }
        
        guard let dests = remaining[from] else { return }
        for (i, d) in dests.enumerated() {
            var remaining = remaining
            remaining[from]!.remove(at: i)
            
            dfs(from: d, visited: visited, remaining: remaining)
        }
    }
    
    
    dfs(from: "ICN", visited: [], remaining: ticketMap)
    
    
    return result
}


//print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
//print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL", "SFO"]]))
