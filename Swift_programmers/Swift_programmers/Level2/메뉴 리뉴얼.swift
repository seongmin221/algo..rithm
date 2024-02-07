//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/6/24.
//

import Foundation

//func solution(_ orders: [String], _ course: [Int]) -> [String] {
//    
//    var interDict: [String: Int] = [:]
//    
//    for i in 0..<orders.count {
//        let menu1 = orders[i].toSet()
//        for j in i+1..<orders.count {
//            let menu2 = orders[j].toSet()
//            let inter = menu1.intersection(menu2)
//            
//            guard course.contains(inter.count) else { continue }
//            
//            let interString = inter.toString()
//            if interDict[interString] == nil { interDict[interString] = 1 }
//            else { interDict[interString]! += 1 }
//        }
//    }
//    
//    print(interDict)
//    for (strings, count) in interDict.sorted(by: { $0.value > $1.value }) {
//        
//    }
//    
//    var result: [String] = []
//    for c in course {
//        let candidates = interDict
//            .filter { $0.key.count == c }
//            .sorted(by: { $0.value > $1.value })
//        guard let max = candidates.first?.value else { continue }
//        for candidate in candidates {
//            guard candidate.value == max else { break }
//            result.append(candidate.key)
//        }
//    }
//    
//    return []
//}


func combination(input: [String], targetCount: Int) -> [[String]] {
    var result: [[String]] = []
    
    func innerFunc(currentComb: [String], index: Int) {
        if currentComb.count == targetCount {
            result.append(currentComb.sorted())
            return
        }
        for i in index..<input.count {
            innerFunc(currentComb: currentComb + [input[i]], index: i + 1)
        }
    }
    
    innerFunc(currentComb: [], index: 0)
    return result
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    
    var menuDict: [[String]: Int] = [:]
    for order in orders {
        for count in course {
            for menu in combination(input: order.map { String($0) }, targetCount: count) {
                if menuDict[menu] == nil { menuDict[menu] = 1 }
                else { menuDict[menu]! += 1 }
            }
        }
    }
    for m in menuDict { print(m) }
    var result: [String] = []
    for c in course {
        let candidates = menuDict
            .filter { $0.key.count == c }
            .sorted(by: { $0.value > $1.value })
        guard let maxCount = candidates.first?.value, maxCount != 1 else { continue }
        
        for candidate in candidates {
            guard candidate.value == maxCount else { break }
            result.append(candidate.key.reduce("", { $0 + $1 }))
        }
    }

    return result.sorted()
}

//print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2, 3, 5]))
//print(solution(["XYZ", "XWY", "WXA"], [2, 3, 4]))

//extension String {
//    func toSet() -> Set<String> {
//        Set(self.map { String($0) })
//    }
//}
//
//extension Set where Element == String {
//    func toString() -> String {
//        Array(self).sorted().reduce("", { $0 + $1 })
//    }
//}
