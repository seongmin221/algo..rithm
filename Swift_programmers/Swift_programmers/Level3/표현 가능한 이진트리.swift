//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/29/24.
//

import Foundation

//struct Root {
//    var node: Node
//}
//
//class Node {
//    let val: String
//    let leftChild: Node?
//    let rightChild: Node?
//    
//    init(val: String, leftChild: Node? = nil, rightChild: Node? = nil) {
//        self.val = val
//        self.leftChild = leftChild
//        self.rightChild = rightChild
//    }
//}
//
//func solution(_ numbers: [Int64]) -> [Int] {
//    
//    func createFullBinaryTree(from input: [String]) {
//        var (btArray, level) = input.creatArrayForBinaryTree()
//        
//        var index = 1
//        let root = Root(node: .init(val: btArray[index]))
//        while level > 0 {
//            
//        }
//    }
//    
//    print(numbers[0].toBinaryArray().creatArrayForBinaryTree())
//    return []
//}
//
//extension Int64 {
//    func toBinaryArray() -> [String] {
//        let stringForm = String(self, radix: 2)
//        return stringForm.map { String($0) }
//    }
//}
//
//extension Array where Element == String {
//    func creatArrayForBinaryTree() -> (arr: [String], level: Int) {
//        var selfCount = self.count
//        var level = 1
//        while selfCount > 1 {
//            selfCount /= 2
//            level += 1
//        }
//        
//        var temp = Array(repeating: "0", count: Int(powf(2, Float(level))) - self.count)
//        temp += self
//        
//        var array = ["0"]
//        var offset = temp.count / 2
//        var startingPoints: [Int] = [offset]
//        while !startingPoints.isEmpty {
//            let index = startingPoints.removeFirst()
//            array.append(temp[index])
//            
//            if offset > 1 {
//                startingPoints.append(index - offset/2)
//                startingPoints.append(index + offset/2)
//            }
//            if index == temp.count - offset {
//                offset /= 2
//            }
//        }
//        
//        return (array, level)
//    }
//}

extension Int64 {
    func toFullBinaryString() -> (value: String, level: Int) {
        if self == 1 { return ("1", 0)}
        
        let binString: String = .init(self, radix: 2)
        var level: Int = 0
        var temp: Int = 1
        
        while temp - 1 < binString.count {
            level += 1
            temp *= 2
        }
        temp -= 1
        
        var value: String = String(repeating: "0", count: temp) + binString
        value = String(value.suffix(temp))
        
        return (value, level)
    }
}

func solution(_ numbers: [Int64]) -> [Int] {
    
    func check(fbt: String, level: Int) -> Bool {
        var result: Bool = true
        
        let digits: [String] = ["0"] + fbt.map { String($0) }
        func dfs(rootIndex: Int, childIndex: Int) {
            let diff = abs(rootIndex - childIndex)
            guard diff != 0 else { return }
            
            print(rootIndex, childIndex, digits[rootIndex], digits[childIndex])
            if digits[rootIndex] == "0" && digits[childIndex] == "1" {
                result = false
            }
            dfs(rootIndex: childIndex, childIndex: childIndex - diff / 2)
            dfs(rootIndex: childIndex, childIndex: childIndex + diff / 2)
        }
        
        let length = digits.count
        let rootIndex = length / 2
        let initialDiff = length / 4
        dfs(rootIndex: rootIndex, childIndex: rootIndex - initialDiff)
        dfs(rootIndex: rootIndex, childIndex: rootIndex + initialDiff)
        
        return result
    }
    
    var result: [Int] = []
    for num in numbers {
        let (fbt, level) = num.toFullBinaryString()
        let isPossible: Bool = check(fbt: fbt, level: level)
        print("-", isPossible)
        result.append(isPossible ? 1 : 0)
    }
    
    return result
}

//print(solution([1, 111, 95]))


//print(solution([7, 42, 5]))
