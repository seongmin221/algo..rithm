//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/02.
//

import Foundation

//func solution(_ s:String, _ skip:String, _ index:Int) -> String {
//    let alphaAscii = 97...122
//    let skipAscii = skip.map { $0.asciiValue! }
//    let allowedAscii = alphaAscii.filter { !skipAscii.contains(UInt8($0)) }
//    let stringAscii = s.map { $0.asciiValue! }
//    var result: [Int] = []
//    for c in stringAscii {
//        result.append(allowedAscii.firstIndex(of: ClosedRange<Int>.Element(c))!)
//    }
//    let allowedAlphabets = allowedAscii.map { UnicodeScalar($0)! }

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alphabets = [
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "m", "o", "p",
        "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
    ]
    let allowedAlphabets = alphabets.filter { !skip.contains($0) }
    let allowedAlphabetsCount = allowedAlphabets.count
    let string = s.map { $0.description }
    var result = ""
    for s in string {
        let i = allowedAlphabets.firstIndex(of: s)!
        result += allowedAlphabets[(i + index) % allowedAlphabetsCount]
    }
    return result
}

print(solution("aukks", "wbqd", 5))

//s    skip    index    result
//"aukks"    "wbqd"    5    "happy"

//let alphabets = [
//    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "m", "o", "p",
//    "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
//]
