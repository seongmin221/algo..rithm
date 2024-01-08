//
//  1,2,3 떨어트리기.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/8/24.
//

import Foundation

class Tree {
    var root: Node
    
    init(root: Node) { self.root = root }
}

extension Tree {
    func add(child: Int, to parent: Int) {
        var needVisit = [self.root]
        while !needVisit.isEmpty {
            let node = needVisit.removeLast()
            if node.key == parent {
                let child = Node(key: child)
                node.children.append(child)
                child.parent = node
                break
            }
            needVisit += node.children
        }
    }
    
//    func add(value: Int, to childKey: Int) -> Int {
//        var needVisit = [self.root]
//        var child: Node = Node(key: 0)
//        while true {
//            let node = needVisit.removeLast()
//            if node.key == childKey {
//                child = node
//                break
//            }
//            needVisit += node.children
//        }
//
//        child.value += value
//        while child != self.root {
//            guard let parent = child.parent else { break }
//            parent.validRouteIndex = (parent.validRouteIndex + 1) % parent.children.count
//            child = parent
//        }
//
//        return child.value
//    }
    
    func insert(value: Int) -> Int {
        var node = root
        while !node.children.isEmpty {
            let child = node.children[node.validRouteIndex]
            node.validRouteIndex += 1
            node.validRouteIndex %= node.children.count
            node = child
        }
        node.value += value
        
        return node.value
    }
    
    func printAll() {
        var needVisit = [self.root]
        while !needVisit.isEmpty {
            let node = needVisit.removeFirst()
            print(node.key, node.value)
            needVisit += node.children
        }
    }
    
    func printChildVal() {
        var needVisit = [self.root]
        while !needVisit.isEmpty {
            let node = needVisit.removeFirst()
            if node.children.isEmpty {
                print(node.key, node.value)
            }
            needVisit += node.children
        }
    }
}

class Node: Equatable {
    let key: Int
    var parent: Node?
    
    var value: Int = 0
    var validRouteIndex: Int = 0
    var children: [Node] = []
    
    init(key: Int) {
        self.key = key
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        lhs.key == rhs.key
    }
}


func solution(_ edges: [[Int]], _ target: [Int]) -> [Int] {
    
    let root = Node(key: 1)
    var tree = Tree(root: root)
    
    for edge in edges.sorted(by: { $0[0] < $1[0] }) {
        tree.add(child: edge[1], to: edge[0])
    }
    
    var validTargets: [[Int]] = target
        .enumerated()
        .filter({ $0.element != 0 })
        .map { [$0.0 + 1, $0.1] }
    
    for i in 0..<target.count {
        tree.insert(value: 1)
    }
    
    return []
}

print(solution([[2, 4], [1, 2], [6, 8], [1, 3], [5, 7], [2, 5], [3, 6], [6, 10], [6, 9]], [0, 0, 0, 3, 0, 0, 5, 1, 2, 3]))
