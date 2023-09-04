//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/09/04.
//

import Foundation

//"hit"    "cog"    ["hot", "dot", "dog", "lot", "log", "cog"]
let begin = "hit"
let target = "cog"
let words = ["hot", "dot", "dog", "lot", "log", "cog"]

print(solution(begin, target, words))

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int? {
    var temp = words
    temp.sort()
    let result = convert(begin, to: target, words: temp, count: 0, countArr: [Int]())
    if result.isEmpty {
        return 0
    } else {
        return result.min()!
    }
}

func convert(_ begin: String,
             to target: String,
             words: [String],
             count: Int,
             countArr: [Int]
) -> [Int] {
    print(begin, target, words, count, countArr)
    var temp = countArr
    if begin == target {
        temp.append(count)
        return temp
    }
    var wordArr = words
    
    for word in words {
//        print("\(begin) -> \(word), \(canConvert(begin, to: word))")
        if canConvert(begin, to: word) {
            let index = wordArr.firstIndex(of: word)!
            wordArr.remove(at: index)
            temp = convert(word,
                           to: target,
                           words: wordArr,
                           count: count + 1,
                           countArr: temp)
        }
    }
    
//    for i in 0..<wordArr.count {
//        tar = wordArr[i]
//        print("\(begin) -> \(tar), \(canConvert(begin, to: tar))")
//        if canConvert(begin, to: tar) {
//            let index = wordArr.firstIndex(of: tar)!
//            wordArr.remove(at: index)
//            temp = convert(tar,
//                           to: target,
//                           words: wordArr,
//                           count: count + 1,
//                           countArr: temp)
//            print(temp)
//        }
//    }
    wordArr.append(tar)
    return temp
}

func canConvert(_ beg: String, to tar: String) -> Bool {
    var a = beg
    var b = tar
    var cnt = 0
    while !a.isEmpty {
        if a.removeFirst() != b.removeFirst() {
            cnt += 1
            if cnt >= 2 {
                return false
            }
        }
    }
    return true
}
