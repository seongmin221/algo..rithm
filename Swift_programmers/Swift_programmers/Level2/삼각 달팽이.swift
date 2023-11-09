//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/9/23.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    
    func leftAppend(count: Int, level: Int) {
        let top = 2 * level
        for i in 0..<count {
            snail[top + i][level] = num
            num += 1
        }
    }
    
    func bottomAppend(count: Int, level: Int) {
        for i in 0..<count {
            snail[n - 1 - level][i + level] = num
            num += 1
        }
    }
    
    func rightAppend(count: Int, level: Int) {
        for i in 0..<count {
            var last = snail[n - 1 - i - level].count
            snail[n - 1 - i - level][last - 1 - level] = num
            num += 1
        }
    }
    
    var snail: [[Int]] = []
    var level = 0
    var num = 1
    var count = n - 1
    
    for i in 0..<n {
        snail.append(.init(repeating: 0, count: i + 1))
    }
    
    while true {
        if count == 0 {
            let center = snail[level * 2].count / 2
            snail[level * 2][center] = num
        }
        guard count >= 0 else { break }
        leftAppend(count: count, level: level)
        bottomAppend(count: count, level: level)
        rightAppend(count: count, level: level)
        count -= 3
        level += 1
    }
    
    return snail.flatMap { $0 }
}

print(solution(4))

//func solution(_ n:Int) -> [Int] {
//    var snail = Array(repeating: [Int](), count: n)
//    var level = 0
//    var count = n - 1
//    var num = 1
//    
//    func leftAppend(level: Int, count: Int) {
//        let start = level
//        for i in 0..<count {
//            snail[start + i].insert(num, at: level)
//            num += 1
//        }
//    }
//    
//    func bottomAppend(level: Int, count: Int) {
//        let start = level
//        for _ in 0..<count {
//            snail[n - 1 - level].append(num)
//            num += 1
//        }
//    }
//    
//    func rightAppend(level: Int, count: Int) {
//        let start = n - 1 - level
//        for i in 0..<count {
//            var index = snail[n - 1 - i].count
//            snail[n - 1 - i].insert(num, at: index)
//            num += 1
//        }
//    }
//    
//    while true {
//        guard count > 0 else { break }
//        leftAppend(level: level, count: count)
//        bottomAppend(level: level, count: count)
//        rightAppend(level: level, count: count)
//        level += 1
//        count -= 3
//    }
//    
//    snail.forEach {
//        print($0)
//    }
//    
//    return []
//}

//func solution(_ n:Int) -> [Int] {
//    
//    func appendLeft(level: Int, start: Int, count: Int) -> Int {
//        var top = level
//        var bottom = n - level
//        var num = start
//        for i in top..<bottom {
//            snail[i].insert(num, at: level)
//            num += 1
//        }
//        return num
//    }
//    
//    func appendBottom(level: Int, start: Int, count: Int) -> Int {
//        var num = start
//        for i in 0..<count {
//            snail[n-1].append(start + i)
//        }
//        return start + count
//    }
//    
//    func appendRight(level: Int, start: Int, count: Int) -> Int {
//        let bottom = n - level
//        let top = 2 * level + 1
//        var num = start
//        for i in top..<bottom {
//            let index = snail[n - level - i].count - level
//            snail[n - level - i].insert(num, at: index)
//            num += 1
//        }
//        return num
//    }
//    
//    var snail = Array(repeating: [Int](), count: n)
//    var level = 0
//    var n = n
//    var bottomStart = 0
//    var rightStart = 0
//    var leftStart = 1
//    
//    while true {
//        bottomStart = appendLeft(level: level, start: leftStart, count: n)
//        n -= 1
//        guard n != 0 else { break }
//        rightStart = appendBottom(level: level, start: bottomStart, count: n)
//        n -= 1
//        guard n != 0 else { break }
//        leftStart = appendRight(level: level, start: rightStart, count: n)
//        n -= 1
//        guard n != 0 else { break }
//        level += 1
//    }
//    
//    snail.forEach {
//        print($0)
//    }
//    
//    return []
//}

//solution(5)
