//
//  가사 검색.swift
//  Swift_programmers
//
//  Created by 이성민 on 5/1/24.
//

import Foundation


class Node {
    var dict: [Character: Node] = [:]
    var count: Int = 0
}

extension Node {
    func insert(_ string: String) {
        var temp = self
        temp.count += 1
        for c in string {
            if temp.dict[c] == nil { temp.dict[c] = .init() }
            temp = temp.dict[c]!
            temp.count += 1
        }
    }
    
    func match(_ query: String) -> Int {
        var temp = self
        for c in query {
            guard c != "?" else { break }
            guard temp.dict[c] != nil else { return 0 }
            temp = temp.dict[c]!
        }
        return temp.count
    }
}

func solution(_ words: [String], _ queries: [String]) -> [Int] {
    
    var trie: [Int: Node] = [:]
    var rTrie: [Int: Node] = [:]
    
    for word in words {
        let wc = word.count
        if trie[wc] == nil { trie[wc] = .init() }
        if rTrie[wc] == nil { rTrie[wc] = .init() }
        trie[wc]!.insert(word)
        rTrie[wc]!.insert(String(word.reversed()))
    }
    
    var result: [Int] = []
    for query in queries {
        let qc = query.count
        if query.first != "?" {
            guard let trie = trie[qc] else { result.append(0); continue }
            result.append(trie.match(query))
        }
        else {
            guard let trie = rTrie[qc] else { result.append(0); continue }
            result.append(trie.match(String(query.reversed())))
        }
    }
    
    return result
}

//print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))
//print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["????o"]))
//print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["?????"]))
