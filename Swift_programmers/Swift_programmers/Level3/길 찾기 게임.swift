//
//  길 찾기 게임.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/19/24.
//

import Foundation

class Node {
    let index: Int
    let x: Int
    let y: Int
    var lc: Node?
    var rc: Node?

    init(
        _ index: Int,
        _ x: Int,
        _ y: Int,
        _ lc: Node? = nil,
        _ rc: Node? = nil
    ) {
        self.index = index
        self.x = x
        self.y = y
        self.lc = lc
        self.rc = rc
    }
}

struct BST {
    var root: Node? = nil
}

extension BST {
    mutating func insert(_ node: Node) {
        if self.root == nil {
            root = node
            return
        }

        var temp = self.root!
        while true {
            if temp.x > node.x {
                guard let lc = temp.lc else {
                    temp.lc = node
                    break
                }
                temp = lc
            } else {
                guard let rc = temp.rc else {
                    temp.rc = node
                    break
                }
                temp = rc
            }
        }
    }
}

func solution(_ nodeinfo: [[Int]]) -> [[Int]] {

    func sortNodes(
        _ node1: (index: Int, info: [Int]),
        _ node2: (index: Int, info: [Int])
    ) -> Bool {
        if node1.info[1] > node2.info[1] { return true }
        else if node1.info[1] == node2.info[1] {
            return node1.info[0] < node2.info[0]
        }
        else { return false }
    }

    var nodes: [Node] = nodeinfo
        .enumerated()
        .sorted(by: sortNodes)
        .map { Node($0.offset + 1, $0.element[0], $0.element[1]) }

    var bst: BST = .init()
    for node in nodes {
        bst.insert(node)
    }

    func preorder() -> [Int] {
        var result: [Int] = []
        func execute(_ node: Node) {
            result.append(node.index)
            if node.lc != nil { execute(node.lc!)  }
            if node.rc != nil { execute(node.rc!)  }
        }
        execute(bst.root!)
        return result
    }

    func postorder() -> [Int] {
        var result: [Int] = []
        func execute(_ node: Node) {
            if node.lc != nil { execute(node.lc!)  }
            if node.rc != nil { execute(node.rc!)  }
            result.append(node.index)
        }
        execute(bst.root!)
        return result
    }


    return [preorder(), postorder()]
}
