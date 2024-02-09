//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/7/24.
//

import Foundation

// MARK: - 1차 시도: 단순 테이블 형성 풀이 -> 시간초과

//class Table {
//    var data: [Int]
//    var lastDeleted: [(cursor: Int, value: Int)] = []
//    var cursor: Int
//    
//    init(data: [Int], cursor: Int) {
//        self.data = data
//        self.cursor = cursor
//    }
//}
//
//extension Table {
//    func u(_ count: Int) {
//        self.cursor -= count
//    }
//    
//    func d(_ count: Int) {
//        self.cursor += count
//    }
//    
//    func c() {
//        let target = self.data[cursor]
//        var temp = cursor
//        if cursor == data.count - 1 { temp -= 1 }
//        self.lastDeleted.append((cursor, target))
//        self.data.remove(at: cursor)
//        cursor = temp
//    }
//    
//    func z() {
//        let restore = self.lastDeleted.removeLast()
//        if restore.cursor <= cursor { cursor += 1 }
//        self.data.insert(restore.value, at: restore.cursor)
//    }
//}
//
//func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
//    
//    var table = Table(data: Array(0..<n), cursor: k)
////    print(table.data)
//    for c in cmd {
//        switch String(c.first!) {
//        case "U": table.u(Int(String(c.last!))!)
//        case "D": table.d(Int(String(c.last!))!)
//        case "C": table.c()
//        case "Z": table.z()
//        default: continue
//        }
////        print(c, table.data, table.lastDeleted)
//    }
//    
//    var result = ""
//    var tableIndex = 0
//    var i = 0
//    while i < n {
//        guard tableIndex < table.data.count else {
//            result += "X"
//            i += 1
//            continue
//        }
//        
//        if table.data[tableIndex] == i {
//            result += "O"
//            tableIndex += 1
//        } else {
//            result += "X"
//        }
//        i += 1
//    }
//    
//    return result
//}


// MARK: - 2차 시도: 로직 오류

//class Row {
//    let id: Int
//    var prev: Row?
//    var next: Row?
//    
//    init(id: Int, prev: Row? = nil, next: Row? = nil) {
//        self.id = id
//        self.prev = prev
//        self.next = next
//    }
//}
//
//extension Row {
//    func linkPrev(_ row: Row) {
//        if let prev = self.prev {
//            prev.next = row
//            self.prev = row
//            row.next = self
//            row.prev = prev
//        } else {
//            self.prev = row
//            row.next = self
//        }
//    }
//    
//    func linkNext(_ row: Row) {
//        if let next = self.next {
//            self.next = row
//            next.prev = row
//            row.next = next
//            row.prev = self
//        } else {
//            self.next = row
//            row.prev = self
//        }
//    }
//    
//    func delete() -> Row {
//        self.prev?.next = self.next
//        self.next?.prev = self.prev
//        
//        return self
//    }
//}
//
//
//func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
//    
//    // 입력 및 세팅
//    var data = Array(0..<n).map { Row(id: $0) }
//    for i in 0..<n-1 {
//        data[i].linkNext(data[i+1])
//    }
//    
//    // 로직
//    var cursor = data[k]
//    var deletedStack: [Row] = []
//    
//    func U(_ count: Int) {
//        print("U - origin: \(cursor.id)")
//        for _ in 0..<count {
//            cursor = cursor.prev!
//        }
//        print("U - result: \(cursor.id)")
//    }
//    
//    func D(_ count: Int) {
//        print("D - origin: \(cursor.id)")
//        for _ in 0..<count {
//            cursor = cursor.next!
//        }
//        print("D - result: \(cursor.id)")
//    }
//    
//    func C() {
//        print("C - origin: \(cursor.id)")
//        let target = cursor
//        let deleted = cursor.delete()
//        deletedStack.append(deleted)
//        if let next = target.next { cursor = next }
//        else { cursor = target.prev! }
//        print("C - result: \(cursor.id)")
//    }
//    
//    func Z() {
//        print("Z - origin: \(cursor.id)")
//        let restore = deletedStack.removeLast()
//        print("Z - restore: \(restore.id)")
//        if let next = restore.next { restore.linkNext(next) }
//        if let prev = restore.prev { restore.linkPrev(prev) }
//        print("Z - result: \(cursor.id)")
//    }
//    
//    
//    for c in cmd {
//        switch String(c.first!) {
//        case "U": U(Int(String(c.last!))!)
//        case "D": D(Int(String(c.last!))!)
//        case "C": C()
//        case "Z": Z()
//        default: continue
//        }
//    }
//    
//    
//    while true {
//        guard let prev = cursor.prev, prev.id != cursor.id else { break }
//        cursor = prev
//    }
//    
//    var result = ""
//    var index = 0
//    while index < n {
//        print(index, cursor.id)
//        guard let next = cursor.next else {
//            result += "X"
//            index += 1
//            continue
//        }
//        
//        if index == cursor.id {
//            result += "O"
//            cursor = next
//        } else {
//            result += "X"
//        }
//        index += 1
//    }
//    
//    
//    return result
//}




//class Row {
//    let id: Int
//    var prev: Row?
//    var next: Row?
//    
//    init(id: Int, prev: Row? = nil, next: Row? = nil) {
//        self.id = id
//        self.prev = prev
//        self.next = next
//    }
//}
//
//extension Row {
//    func delete() {
//        if let prev { prev.next = next }
//        if let next { next.prev = prev }
//    }
//    
//    func restore() {
//        if let prev {
//            prev.next = self
//            self.prev = prev
//        }
//        if let next {
//            next.prev = self
//            self.next = next
//        }
//    }
//}
//
//
//func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
//    
//    var data = Array(0..<n).map { Row(id: $0) }
//    for i in 0..<n-1 {
//        data[i].next = data[i+1]
//        data[i+1].prev = data[i]
//    }
//    var cursor = data[k]
//    var deletedStack: [Row] = []
//    
//    func U(_ count: Int) {
//        for _ in 0..<count {
//            cursor = cursor.prev!
//        }
//    }
//    
//    func D(_ count: Int) {
//        for _ in 0..<count {
//            cursor = cursor.next!
//        }
//    }
//    
//    func C() {
//        cursor.delete()
//        deletedStack.append(cursor)
//    }
//    
//    func Z() {
//        let restore = deletedStack.removeLast()
//        restore.restore()
//    }
//    
//    for c in cmd {
//        switch String(c.first!) {
//        case "U": U(Int(String(c.last!))!)
//        case "D": D(Int(String(c.last!))!)
//        case "C": C()
//        case "Z": Z()
//        default: continue
//        }
//    }
//    
//    
//    while true {
//        guard let prev = cursor.prev else { break }
//        cursor = prev
//    }
//    
//    var result = ""
//    var index = 0
//    while index < n {
////        print(index, cursor.id)
//        guard let next = cursor.next else {
//            if index == cursor.id { result += "O" }
//            else { result += "X" }
//            index += 1
//            continue
//        }
//        
//        if index == cursor.id {
//            result += "O"
//            cursor = next
//        } else {
//            result += "X"
//        }
//        index += 1
//    }
//    
//    return result
//}


func solution(_ n: Int, _ k: Int, _ cmd: [String]) -> String {
    
    var dict: [Int: [Int?]] = [:]
    dict[0] = [nil, 1]
    dict[n-1] = [n-2, nil]
    for i in 1..<n-1 {
        dict[i] = [i-1, i+1]
    }
    
    var cursor = k
    var deletedStack: [(key: Int, links: [Int?])] = []
    
    func U(_ count: Int) {
        for _ in 0..<count {
            cursor = dict[cursor]![0]!
        }
    }
    
    func D(_ count: Int) {
        for _ in 0..<count {
            cursor = dict[cursor]![1]!
        }
    }
    
    func C() {
        let deleted = dict[cursor]!
        deletedStack.append((cursor, dict[cursor]!))
        
        if cursor == dict.keys.max()! {
            dict[deleted[0]!]![1] = nil
            dict[cursor] = nil
            cursor = deleted[0]!
        } else if cursor == dict.keys.min()! {
            dict[deleted[1]!]![0] = nil
            dict[cursor] = nil
            cursor = deleted[1]!
        } else {
            dict[deleted[0]!]![1] = deleted[1]!
            dict[deleted[1]!]![0] = deleted[0]!
            dict[cursor] = nil
            cursor = deleted[1]!
        }
    }
    
    func Z() {
        let restore = deletedStack.removeLast()
        let key = restore.key
        let links = restore.links
        
        if key < dict.keys.min()! {
            dict[key] = links
            dict[links[1]!]![0] = key
        } else if key > dict.keys.max()! {
            dict[key] = links
            dict[links[0]!]![1] = key
        } else {
            dict[key] = links
            dict[links[0]!]![1] = key
            dict[links[1]!]![0] = key
        }
    }
    
    for c in cmd {
//        print(cursor, c)
//        for (key, value) in dict.sorted(by: { $0.key < $1.key }) {
//            print(key, value)
//        }
//        print("---")
        switch String(c.first!) {
        case "U": U(Int(String(c.last!))!)
        case "D": D(Int(String(c.last!))!)
        case "C": C()
        case "Z": Z()
        default: continue
        }
    }
    
    while dict[cursor]![0] != nil {
        cursor = dict[cursor]![0]!
    }
//    print(cursor)
    
    var result = ""
    for i in 0..<n {
        guard let next = dict[cursor]![1] else {
            if i == cursor { result += "O" }
            else { result += "X" }
            continue
        }
        
        if i == cursor {
            result += "O"
            cursor = next
        } else {
            result += "X"
        }
    }
    
    
    return result
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))
