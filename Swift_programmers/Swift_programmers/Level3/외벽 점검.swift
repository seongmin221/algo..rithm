//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/15/24.
//

import Foundation

//func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
//    
//    if dist.contains(where: { $0 >= n }) { return 1 }
//    
//    var map: [Int] = Array(repeating: 0, count: n)
//    for w in weak { map[w] = 1 }
//    
//    var weaksInDist: [Int: [Set<Int>]] = [:]
//    for d in dist {
//        var maxWeaks: [Set<Int>] = []
//        for w in weak {
//            var e = w + d
//            var weaks = Set<Int>()
//            if e >= n {
//                e = e % n
//                var weaks1 = Set(map[w...n-1].enumerated()
//                    .filter { $0.element == 1 }
//                    .map { $0.offset + w })
//                var weaks2 = Set(map[0...e].enumerated()
//                    .filter { $0.element == 1 }
//                    .map { $0.offset })
//                weaks = weaks1.union(weaks2)
//            }
//            else {
//                weaks = Set(map[w...e].enumerated()
//                    .filter { $0.element == 1 }
//                    .map { $0.offset + w })
//            }
//            
//            if maxWeaks.isEmpty { maxWeaks.append(weaks); continue }
//            
//            if weaks.count > maxWeaks.first!.count { maxWeaks = [weaks] }
//            else if weaks.count == maxWeaks.first!.count { maxWeaks.append(weaks) }
//        }
//        weaksInDist[d] = maxWeaks
//    }
//    
//    if weaksInDist.values.contains(where: { $0.count == weak.count }) {
//        return 1
//    }
//    
//    for val in weaksInDist.values { print(val) }
//    
//    return 0
//}


// MARK: - 1차 시도: 3,4,6,10~14,20,23,24 틀림

//func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
//    
//    var map: [Int] = Array(repeating: 0, count: n)
//    for w in weak { map[w] = 1 }
//    
//    var minDist = Int.max
//    var weakToVisit = weak
//    while !weakToVisit.isEmpty {
//        var s = weakToVisit.removeFirst()
//        var weaks = weak
//        var distC = Array(dist.reversed())
//        
//        while true {
//            if distC.isEmpty { break }
//            let e = s + distC.removeFirst()
//            
//            if e < n { weaks = weaks.filter { e < $0 || $0 < s } }
//            else { weaks = weaks.filter { e%n < $0 && $0 < s } }
//            
//            if weaks.isEmpty { break }
//            s = weaks.removeFirst()
//        }
//        minDist = min(minDist, dist.count - distC.count)
//    }
//    
//    return minDist
//}


// MARK: - 2차 시도: 5,6,10~12,14,20,22 틀림

//func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
//    
//    var map: [Int] = Array(repeating: 0, count: n)
//    for w in weak { map[w] = 1 }
//    
//    var minDist = Int.max
//    var weakToVisit = weak
//    while !weakToVisit.isEmpty {
//        var s = weakToVisit.removeFirst()
//        var weaks = weak
//        var distC = Array(dist.reversed())
//        
//        while true {
//            if distC.isEmpty { break }
//            let e = s + distC.removeFirst()
//            
//            if e < n { weaks = weaks.filter { e < $0 || $0 < s } }
//            else { weaks = weaks.filter { e%n < $0 && $0 < s } }
//            
//            if weaks.isEmpty { break }
//            s = weaks.removeFirst()
//        }
//        
//        if distC.isEmpty { continue }
//        minDist = min(minDist, dist.count - distC.count)
//    }
//    
//    if minDist > dist.count { return -1 }
//    return minDist
//}



// MARK: - 3차 시도: 3,10~15 시간초과

//func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
//    
//    var minDist = Int.max
//    func recur(weaks: [Int], friends: [Int]) {
//        if weaks.isEmpty {
//            minDist = min(minDist, dist.count - friends.count)
//            return
//        }
//        if friends.isEmpty { return }
//        if minDist <= dist.count - friends.count { return }
//        
//        var weaksToVisit = weaks
//        var friends = friends
//        var f = friends.removeFirst()
//        while !weaksToVisit.isEmpty {
//            let s = weaksToVisit.removeFirst()
//            let e = s + f
//            
//            var weaks = weaks
//            if e < n { weaks = weaks.filter { e < $0 || $0 < s } }
//            else { weaks = weaks.filter { e%n < $0 && $0 < s } }
//            
//            recur(weaks: weaks, friends: friends)
//        }
//    }
//    
//    var weak = weak
//    var dist = dist.sorted(by: { $0 > $1 })
//    recur(weaks: weak, friends: dist)
//    
//    if minDist > dist.count { return -1 }
//    return minDist
//}



// MARK: - 4차 시도: 3, 11~14 시간초과

//func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
//    
//    var minDist = Int.max
//    func recur(weaks: Set<Int>, friends: [Int]) {
//        if weaks.isEmpty {
//            minDist = min(minDist, dist.count - friends.count)
//            return
//        }
//        if friends.isEmpty { return }
//        if minDist <= dist.count - friends.count { return }
//        
//        
//        var weaksToVisit = weaks
//        var friends = friends
//        var f = friends.removeFirst()
//        while !weaksToVisit.isEmpty {
//            let s = weaksToVisit.removeFirst()
//            let e = s + f
//            
//            var weaks = weaks
//            if e < n { weaks.subtract(weaks.filter { s <= $0 || $0 <= e }) }
//            else { weaks.subtract(weaks.filter { $0 <= e%n || s <= $0 }) }
//            
//            recur(weaks: weaks, friends: friends)
//        }
//    }
//    
//    var weak = Set(weak)
//    var dist = dist.sorted(by: { $0 > $1 })
//    recur(weaks: weak, friends: dist)
//    
//    if minDist > dist.count { return -1 }
//    return minDist
//}


func solution(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
    
    let dist = dist.sorted(by: >)
    var set: Set<[Int]> = Set()
    set.insert(weak)
    
    for i in 0..<dist.count {
        let d = dist[i]
        
        var temp = Set<[Int]>()
        
        for weak in set {
            for w in weak {
                let s = w
                let e = (s + d) % n
                
                var newWeak: [Int]
                if s < e { newWeak = weak.filter { e < $0 || $0 < s } }
                else { newWeak = weak.filter{ e < $0 && $0 < s } }
                
                if newWeak.isEmpty { return i + 1 }
                temp.insert(newWeak)
            }
        }
        set = temp
    }
    
    return -1
}




//print(solution(12, [1,5,6,10], [1,2,3,4]))
//print(solution(12, [1, 3, 4, 9, 10], [3, 5, 7]))
//print(solution(200, [0, 10, 50, 80, 120, 160], [1, 10, 5, 40, 30]))
//16, [1,2,3,4,5,7,8,10,11,12,14,15], [4,2,1,1], 4
