//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/21/23.
//

import Foundation

// MARK: - 3차 시도

class Node {
    var key: Character?
    var word: String?
    var children: [Character: Node] = [:]
    var count: Int = 0
    
    init(key: Character?, word: String? = nil) {
        self.key = key
        self.word = word
    }
}

class Trie {
    var root: Node
    
    init() {
        self.root = Node(key: nil)
    }
}

extension Trie {
    func insert(_ word: String) {
        var cur = self.root
        for c in word {
            if cur.children[c] == nil {
                cur.children[c] = Node(key: c)
            }
            cur.count += 1
            cur = cur.children[c]!
        }
        cur.word = word
    }
    
    func minSearchCount(of word: String) -> Int {
        var cur = self.root
        var count = 0
        for c in word {
            cur = cur.children[c]!
            count += 1
            
            if cur.word == word || (cur.count == 1 && cur.word == nil) {
                return count
            }
        }
        return count
    }
}


func solution(_ words: [String]) -> Int {
    
    var trie = Trie()
    for word in words {
        trie.insert(word)
    }
    
    var count = 0
    for word in words {
        count += trie.minSearchCount(of: word)
    }
    return count
}



// MARK: - 2차 시도

//func solution(_ words: [String]) -> Int {
//    
//    var copied = words.sorted()
//    var wordIndex = 0
//    
//    while wordIndex < copied.count {
//        var word = copied[wordIndex]
//        var char = word.first!
//        var charIndex = word.startIndex
//        
//        let filtered = words.filter { $0.first! == char }
//        let filteredCount = filtered.count
//        
//        var searched = [String]()
//        while filteredCount == searched.count {
//            if filtered.count == 1 {
//                searched.append(String(filtered.first![charIndex]))
//                continue
//            }
//            if filtered.contains(where: { $0.endIndex == charIndex }) {
//                searched += filtered.filter { $0.endIndex == charIndex }
//                continue
//            }
//            
//            
//        }
//        
//        wordIndex += searched.count
//    }
//    
//    
//    
//    return 0
//}


//func solution(_ words: [String]) -> Int {
//    
//    var result: [Int] = []
//    
//    var copied = words.sorted()
//    
//    func recur(word: String, at index: Int, filtered: [String], count: Int) {
//        guard !filtered.isEmpty else { return }
//        
//        let newFiltered = filtered.filter { $0.prefix(index) == word.prefix(index) }
//        print("-----", word.prefix(index), newFiltered)
//        if newFiltered.count == 1 && filtered.contains(word) {
//            print("1")
//            result.append(count + 1)
//        }
//        else if newFiltered.count == 1  {
//            print("2")
//            copied.remove(at: copied.firstIndex(of: word)!)
//            result.append(count + 1)
//        }
//        else {
//            print("3")
//            recur(word: word, at: index+1, filtered: newFiltered, count: count+1)
//        }
//    }
//    
//    while !copied.isEmpty {
//        let word = copied.removeFirst()
//        print(word)
//        recur(word: word, at: 1, filtered: words, count: 0)
//    }
//    
//    var copied = words.sorted()
//    while !copied.isEmpty {
//        let word = copied.removeFirst()
//        var filtered = words
//        for (index, char) in word.enumerated() {
//            filtered = filtered.filter { $0.charAtIndex(index) == String(char) }
//        }
//    }
    
//    var result = 0
//    var copiedWords = words.sorted()
//    
//    var wordIndex = 0
//    while wordIndex < copiedWords.count {
//        var word = copiedWords[wordIndex]
//        var filteredWords = copiedWords.filter { $0.prefix(word.count) == word }
//        
//        if filteredWords.count >= 2 {
//            result += word.count
//        } else {
//            
//        }
//        print(word, filteredWords)
//        wordIndex += 1
//    }
//    
//    return result.reduce(0, { $0 + $1 })
//}


//func solution(_ words:[String]) -> Int {
//    
//    var result = 0
//    for (wordIndex, word) in words.enumerated() {
//        var wordsCopy = words
//        var temp = ""
//        for (i, c) in word.enumerated() {
//            if wordsCopy.count == 1 || words[wordIndex] == temp { break }
//            temp += String(c)
//            wordsCopy = wordsCopy.filter { $0.prefix(i+1) == temp }
//        }
//        result += temp.count
//    }
//    
//    return result
//}



// MARK: - 1차 시도: 6, 8, 12, 13, 16, 17, 20 시간초과

//func solution(_ words:[String]) -> Int {
//    
//    var result = 0
//    for (wordIndex, word) in words.enumerated() {
//        var wordsCopy = words
//        var temp = ""
//        for (i, c) in word.enumerated() {
//            if wordsCopy.count == 1 || words[wordIndex] == temp { break }
//            wordsCopy = wordsCopy.filter { $0.prefix(i+1) == word.prefix(i+1) }
//            temp += String(c)
////            print(c, word, wordsCopy)
//        }
//        result += temp.count
//    }
//    
//    return result
//}

print(solution(["go","gone","guild"]))
print(solution(["word","war","warrior","world"]))
