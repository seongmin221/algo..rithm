//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/21/23.
//

import Foundation

// MARK: - 2차 시도

func solution(_ words:[String]) -> Int {
    
    var result = 0
    
    var copied = words.sorted()
    
    while !copied.isEmpty {
        
    }
    
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
    
    return result
}

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
