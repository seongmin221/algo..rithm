//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/5/23.
//

/// 가르침
///
/// K 개의 단어를 가르침
/// 모든 단어는 anta 로 시작 / tica 로 끝
/// 남극언어에 단어는 N 개밖에 없음
///
/// 학생들이 읽을 수 있는 단어의 최댓값?

/// 3 6
/// antarctica
/// antahellotica
/// antacartica
/// 2

import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var n = input[0] // 제시되는 단어 수
var k = input[1] // 가르칠 수 있는 알파벳 수

var learnedChars = Set().union(["a", "n", "t", "i", "c"])
var words = [Set<String>]()
for _ in 0..<n {
    let word = readLine()!.map { String($0) }
    words.append(Set(word).subtracting(learnedChars))
}

let teachCount = k-5

var result = 0

func process(_ teachCount: Int, _ word: Set<String>, _ learnedChars: Set<String>, _ leftovers: [Set<String>], _ learnedCnt: Int) {
    let teachCount = teachCount - word.count
    guard teachCount >= 0 else {
        result = max(result, learnedCnt)
        return
    }
    
    guard result < learnedCnt + leftovers.count else { return }
    
    var learnedCnt = learnedCnt
    let learnedChars = learnedChars.union(word)
    var leftovers = leftovers.map { $0.subtracting(word) }
    leftovers = leftovers.filter {
        if $0.isEmpty {
            learnedCnt += 1
            return false
        } else {
            return true
        }
    }
    
    for word in leftovers {
        process(teachCount, word, learnedChars, leftovers, learnedCnt)
    }
    result = max(result, learnedCnt)
}

for leftWords in words {
    process(teachCount, leftWords, learnedChars, words, 0)
}

print(result)

//func process(_ teachingWord: Set<String>, _ learnedChars: Set<String>, _ remainingWords: [Set<String>], _ currentLearnedCnt: Int, _ teachedCount: Int) {
////    print(teachingWord, learnedChars, remainingWords, currentLearnedCnt)
//    let teachedCnt = teachedCount - teachingWord.count
//    guard teachedCnt >= 0 else {
//        results.append(currentLearnedCnt)
//        return
//    }
//    
////    guard !remainingWords.isEmpty else {
////        return
////    }
//    
//    var currentLearnedCnt = currentLearnedCnt
//    var temp = remainingWords
//    let learnedChars = learnedChars.union(teachingWord)
//    temp = temp.map { $0.subtracting(teachingWord) }
//    temp = temp.filter {
//        print($0)
//        if $0.isEmpty {
//            currentLearnedCnt += 1
//            return false
//        }
//        return true
//    }
//    
//    for word in temp {
//        process(word, learnedChars, temp, currentLearnedCnt, teachedCnt)
//    }
//    results.append(currentLearnedCnt)
//}
//
//process(Set(), learnedChars, words, 0, k)
//print(results)
//
//print(results.max() ?? 0)

//var words = [Set<String>]()
//for _ in 0..<n {
//    let word = readLine()!
//    let s = word.startIndex
//    let e = word.endIndex
//    let temp = word[word.index(s, offsetBy: 4)..<word.index(e, offsetBy: -4)].map { String($0) }
//    words.append(Set(temp))
//}
//
//var teachedCnt = k - 5
//var learnedChars = Set(["a", "n", "t", "i", "c"])
//words = words.map { $0.subtracting(learnedChars) }
//
//var results = [Int]()
//
//func process(_ teachingWord: Set<String>, _ learnedChars: Set<String>, _ remainingWords: [Set<String>], _ currentLearnedCnt: Int) {
//    print(teachingWord, learnedChars, remainingWords, currentLearnedCnt)
//    teachedCnt -= teachingWord.count
//    guard teachedCnt >= 0 else {
//        results.append(currentLearnedCnt)
//        return
//    }
//    
//    guard !remainingWords.isEmpty else {
//        return
//    }
//    
//    var currentLearnedCnt = currentLearnedCnt
//    var temp = remainingWords
//    let learnedChars = learnedChars.union(teachingWord)
//    temp = temp.map { $0.subtracting(teachingWord) }
//    temp = temp.filter {
//        if $0.isEmpty {
//            currentLearnedCnt += teachingWord.count
//            return false
//        }
//        return true
//    }
//    print(learnedChars)
//    for word in temp {
//        process(word, learnedChars, temp, currentLearnedCnt)
//    }
//    
//}
//
//process(Set(), learnedChars, words, 0)
//print(results)
//
//print(results.max() ?? 0)


//func c(_ neededChars: [Set<Character>], _ learnedChars: Set<Character>, _ currentWord: Set<Character>) {
//    var neededChars = neededChars
//    var learnedChars = learnedChars
//    for char in learnedChars {
//
//    }
//}
