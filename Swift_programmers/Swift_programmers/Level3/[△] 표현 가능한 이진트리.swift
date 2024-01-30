//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/29/24.
//

import Foundation

struct Root {
    var node: Node
}

class Node {
    let val: String
    let leftChild: Node?
    let rightChild: Node?
    
    init(val: String, leftChild: Node? = nil, rightChild: Node? = nil) {
        self.val = val
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func solution(_ numbers: [Int64]) -> [Int] {
    
    func createFullBinaryTree(from input: [String]) {
        var (btArray, level) = input.creatArrayForBinaryTree()
        
        var index = 1
        let root = Root(node: .init(val: btArray[index]))
        while level > 0 {
            
        }
    }
    
    print(numbers[0].toBinaryArray().creatArrayForBinaryTree())
    return []
}

extension Int64 {
    func toBinaryArray() -> [String] {
        let stringForm = String(self, radix: 2)
        return stringForm.map { String($0) }
    }
}

extension Array where Element == String {
    func creatArrayForBinaryTree() -> (arr: [String], level: Int) {
        var selfCount = self.count
        var level = 1
        while selfCount > 1 {
            selfCount /= 2
            level += 1
        }
        
        var temp = Array(repeating: "0", count: Int(powf(2, Float(level))) - self.count)
        temp += self
        
        var array = ["0"]
        var offset = temp.count / 2
        var startingPoints: [Int] = [offset]
        while !startingPoints.isEmpty {
            let index = startingPoints.removeFirst()
            array.append(temp[index])
            
            if offset > 1 {
                startingPoints.append(index - offset/2)
                startingPoints.append(index + offset/2)
            }
            if index == temp.count - offset {
                offset /= 2
            }
        }
        
        return (array, level)
    }
}


//print(solution([7, 42, 5]))
