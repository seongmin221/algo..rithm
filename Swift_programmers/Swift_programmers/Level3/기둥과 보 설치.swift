//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/11/24.
//

import Foundation

// 기둥은 바닥 위에 있거나 보의 한쪽 끝 부분 위에 있거나, 또는 다른 기둥 위에 있어야 합니다.
// 보는 한쪽 끝 부분이 기둥 위에 있거나, 또는 양쪽 끝 부분이 다른 보와 동시에 연결되어 있어야 합니다.

// x, y는 기둥, 보를 설치 또는 삭제할 교차점의 좌표이며, [가로 좌표, 세로 좌표] 형태입니다.
// a는 설치 또는 삭제할 구조물의 종류를 나타내며, 0은 기둥, 1은 보를 나타냅니다.
// b는 구조물을 설치할 지, 혹은 삭제할 지를 나타내며 0은 삭제, 1은 설치를 나타냅니다.

// build_frame: [x, y, 기둥/보, 삭제/설치]
// a - 0: 기둥 / 1: 보
// b - 0: 삭제 / 1: 설치


//func solution(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
//    
//    var colMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//    var floorMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//    var structList: [[Int]] = []
//    
//    func isColPossible(at pos: [Int]) -> Bool {
//        if pos[1] == 0
//            || floorMap[pos[1]][pos[0]] == 1
//            || colMap[pos[1]][pos[0]] == 1 { return true }
//        else {
//            print("xxxx", pos)
//            for row in colMap { print(row) }
//            print("xxxx")
//            for row in floorMap { print(row) }
//            print("xxxx")
//            return false
//        }
//    }
//    
//    func isFloorPossible(at pos: [Int]) -> Bool {
//        if colMap[pos[1]][pos[0]] == 1 
//            || colMap[pos[1]][pos[0]+1] == 1
//            || (floorMap[pos[1]][pos[0]] == 1 && floorMap[pos[1]][pos[0]+1] == 1) { return true }
//        else { return false }
//    }
//    
//    func placeCol(at pos: [Int]) {
//        guard isColPossible(at: pos) else { return }
//        
//        colMap[pos[1]][pos[0]] += 1
//        colMap[pos[1]+1][pos[0]] += 1
//        structList.append(pos + [0])
//    }
//    func placeFloor(at pos: [Int]) {
//        guard isFloorPossible(at: pos) else { return }
//        
//        floorMap[pos[1]][pos[0]] += 1
//        floorMap[pos[1]][pos[0]+1] += 1
//        structList.append(pos + [1])
//    }
//    
//    func removeCol(at pos: [Int]) {
//        colMap[pos[1]][pos[0]] -= 1
//        colMap[pos[1]+1][pos[0]] -= 1
//        
//        if structList.allSatisfy({ $0[2] == 0 ? isColPossible(at: $0) : isFloorPossible(at: $0) }) {
//            structList.remove(at: structList.firstIndex(of: pos + [0])!)
//            print("삭제")
//        }
//        else {
//            colMap[pos[1]][pos[0]] += 1
//            colMap[pos[1]+1][pos[0]] += 1
//            print("삭제 실패")
//        }
//    }
//    func removeFloor(at pos: [Int]) { 
//        floorMap[pos[1]][pos[0]] -= 1
//        floorMap[pos[1]+1][pos[0]] -= 1
//        
//        if structList.allSatisfy({ $0[2] == 1 ? isColPossible(at: $0) : isFloorPossible(at: $0) }) {
//            structList.remove(at: structList.firstIndex(of: pos + [1])!)
//            print("삭제")
//        }
//        else {
//            floorMap[pos[1]][pos[0]] += 1
//            floorMap[pos[1]+1][pos[0]] += 1
//            print("삭제 실패")
//        }
//    }
//    
//    
//    
//    for frame in build_frame {
//        let pos = Array(frame[0..<2])
//        let structure = frame[2]
//        let action = frame[3]
//        
//        print(pos, structure == 0 ? "기둥" : "보", action == 0 ? "삭제" : "추가" )
//        
//        switch structure {
//        case 0: action == 1 ? placeCol(at: pos) : removeCol(at: pos)
//        case 1: action == 1 ? placeFloor(at: pos) : removeFloor(at: pos)
//        default: break
//        }
//        
////        for row in colMap.reversed() { print(row) }
////        print("--")
////        for row in floorMap.reversed() { print(row) }
////        print("--")
//    }
//    
//    return []
//}

//print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))

//print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))


//func solution(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
//    
//    var colMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//    var floorMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//    
//    func placeCol(at pos: [Int]) {
//        guard pos[1] == 0 // 바닥 위
//                || floorMap[pos[1]][pos[0]] == 1 // 보의 한쪽 끝 위
//                || colMap[pos[1]][pos[0]] == 1 // 다른 기둥 위
//        else { return }
//        
//        colMap[pos[1]][pos[0]] += 1
//        colMap[pos[1] + 1][pos[0]] += 1
//    }
//    
//    func placeFloor(at pos: [Int]) {
//        guard colMap[pos[1]][pos[0]] == 1 || colMap[pos[1]][pos[0] + 1] == 1 // 한 쪽 기둥 위
//                || (floorMap[pos[1]][pos[0]] == 1 && floorMap[pos[1]][pos[0] + 1] == 1) // 양쪽이 다른 보 위
//        else { return }
//        
//        floorMap[pos[1]][pos[0]] += 1
//        floorMap[pos[1]][pos[0] + 1] += 1
//    }
//    
//    func removeCol(at pos: [Int]) {
//        colMap[pos[1]][pos[0]] -= 1
//        colMap[pos[1] + 1][pos[0]] -= 1
//        
//        if !isPossible() {
//            colMap[pos[1]][pos[0]] += 1
//            colMap[pos[1] + 1][pos[0]] += 1
//        }
//    }
//    
//    func removeFloor(at pos: [Int]) {
//        floorMap[pos[1]][pos[0]] -= 1
//        floorMap[pos[1]][pos[0] + 1] -= 1
//    }
//    
//    func isPossible() -> Bool {
//        for
//    }
//    
//    for frame in build_frame {
//        let pos = Array(frame[0..<2])
//        let structure = frame[2]
//        let action = frame[3]
//        print(pos, structure == 0 ? "기둥" : "보", action == 0 ? "삭제" : "추가" )
//        
//        switch structure {
//        case 0: action == 1 ? placeCol(at: pos) : removeCol(at: pos)
//        case 1: action == 1 ? placeFloor(at: pos) : removeFloor(at: pos)
//        default: break
//        }
//        
//        print("col")
//        for row in colMap.reversed() { print(row) }
//        print("")
//        print("floor")
//        for row in floorMap.reversed() { print(row) }
//        print("----------")
//    }
//    
//    return []
//}

//print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
//
//print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))



//func solution(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
//    
//    var map: [[Int]] = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
//    
//    for frame in build_frame {
//        let pos = Array(frame[0..<2])
//        let structure = frame[2]
//        let action = frame[3]
//        
//        switch structure {
//        case 0:
//            action == 1 ? map.placeCol(at: pos) : map.removeCol(at: pos)
//            
//        case 1:
//            action == 1 ? map.placeFloor(at: pos) : map.removeFloor(at: pos)
//            
//        default: break
//        }
//        
//        for row in map.reversed() { print(row) }
//        print("--")
//    }
//    
//    return []
//}
//
//extension Array where Element == [Int] {
//    mutating func placeCol(at pos: [Int]) {
//        guard self[pos[1]][pos[0]] == 1 || pos[1] == 0 else { return }
//        
//        self[pos[1]][pos[0]] = 0
//        self[pos[1] + 1][pos[0]] = 0
//    }
//    
//    mutating func placeFloor(at pos: [Int]) {
//        guard self[pos[1]][pos[0]] == 0 || self[pos[1]][pos[0] + 1] == 0 // 한쪽 끝이 기둥 위
//                || (self[pos[1]][pos[0]] == 1 && self[pos[1]][pos[0] + 1] == 1) // 양쪽이 보 위
//        else { return }
//        
//        self[pos[1]][pos[0]] = 1
//        self[pos[1]][pos[0] + 1] = 1
//    }
//    
//    mutating func removeCol(at pos: [Int]) {
//        self[pos[1]][pos[0]] = -1
//        self[pos[1] + 1][pos[0]] = -1
//    }
//    
//    mutating func removeFloor(at pos: [Int]) {
//        self[pos[1]][pos[0]] = -1
//        self[pos[1]][pos[0] + 1] = -1
//    }
//}

//print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
//
//print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))




//build_frame의 원소는 [x, y, a, b]형태입니다.
//  x, y는 기둥, 보를 설치 또는 삭제할 교차점의 좌표이며, [가로 좌표, 세로 좌표] 형태입니다.
//  a는 설치 또는 삭제할 구조물의 종류를 나타내며, 0은 기둥, 1은 보를 나타냅니다.
//  b는 구조물을 설치할 지, 혹은 삭제할 지를 나타내며 0은 삭제, 1은 설치를 나타냅니다.
//  벽면을 벗어나게 기둥, 보를 설치하는 경우는 없습니다.
//  바닥에 보를 설치 하는 경우는 없습니다.

enum ObjectType {
    case column
    case row
}

struct Position: Hashable {
    let x: Int
    let y: Int
}

extension Position {
    var left: Position? { x != 0 ? .init(x: self.x - 1, y: self.y) : nil }
    var down: Position? { y != 0 ? .init(x: self.x, y: self.y - 1) : nil }
    func right(n: Int) -> Position? { x != n ? .init(x: self.x + 1, y: self.y) : nil } // 벗어나게 설치하지 않음
    func up(n: Int) -> Position? { y != n ? .init(x: self.x, y: self.y + 1) : nil }
}

class Object {
    let type: ObjectType
    let pos: Position
    
    init(type: ObjectType, pos: Position) {
        self.type = type
        self.pos = pos
    }
}


class Board {
    var objects: [Position: [Object]] = [:]
}

extension Board {
    func sortedObjects() -> [Object] {
        objects.sorted(by: {
            if $0.key.x < $1.key.x { return true }
            else if $0.key.x == $1.key.x {
                if $0.key.y < $1.key.y { return true }
                else { return false }
            }
            else { return false }
        })
        .map { objects in
            objects.value.sorted(by: {
                if $0.type == .column && $1.type == .row { return true }
                else { return false }
            })
        }
        .flatMap { $0 }
    }
    
    func checkPossible(_ type: ObjectType, at pos: Position, n: Int, objects: [Position: [Object]]) -> Bool {
        
        switch type {
        case .column:
            // pos 위치에 있는 보의 한쪽 끝에 설치
            if objects[pos] != nil && objects[pos]!.contains(where: { $0.type == .row }) {
                return true
            }
            // pos의 왼쪽 위치에 있는 보의 한쪽 끝에 설치
            if let left = pos.left, objects[left] != nil,
               objects[left]!.contains(where: { $0.type == .row }) {
                return true
            }
            // pos의 아래에 있는 기둥의 위에 설치
            if let down = pos.down, objects[down] != nil,
               objects[down]!.contains(where: { $0.type == .column }) {
                return true
            }
            // 위 모두 해당하지 않는 경우
            return false
            
        case .row:
            let left: Position = pos
            
            // 보의 왼쪽 위치가 기둥의 위일 때
            if let leftDown = left.down, objects[leftDown] != nil,
                objects[leftDown]!.contains(where: { $0.type == .column }) {
                return true
            }
            
            guard let right = pos.right(n: n) else { return false }
            // 보의 오른쪽 위치가 기둥의 위일 때
            if let rightDown = right.down, objects[rightDown] != nil,
                objects[rightDown]!.contains(where: { $0.type == .column }) {
                return true
            }
            // 보의 양쪽이 보 위일 때
            if let leftLeft = left.left, objects[leftLeft] != nil, objects[right] != nil,
               objects[leftLeft]!.contains(where: { $0.type == .row }),
               objects[right]!.contains(where: { $0.type == .row }) {
                return true
            }
            // 위 모두 해당하지 않는 경우
            return false
        }
    }
    
    func addObject(_ type: ObjectType, at pos: Position, n: Int) {
        let newObject: Object = .init(type: type, pos: pos)
        
        switch type {
        case .column:
            // 바닥 또는 가능
            guard pos.y == 0 || checkPossible(type, at: pos, n: n, objects: self.objects) else { return }
            
        case .row:
            // 가능
            guard checkPossible(type, at: pos, n: n, objects: self.objects) else { return }
        }
        
        if objects[pos] == nil { objects[pos] = [newObject] }
        else { objects[pos]!.append(newObject) }
    }
    
    func removeObject(_ type: ObjectType, at pos: Position, n: Int) {
        var removedState = self.objects
        let index = removedState[pos]!.firstIndex(where: { $0.type == type })!
        removedState[pos]!.remove(at: index)
        
        var checkNeedObjects: [Object] = []
        switch type {
        case .column:
            guard let up = pos.up(n: n) else { return }
            checkNeedObjects += objects[up] ?? []
            
            if let upLeft = up.left {
                checkNeedObjects += objects[upLeft] ?? []
            }
            
        case .row:
            guard let right = pos.right(n: n) else { return }
            checkNeedObjects += objects[pos] ?? []
            checkNeedObjects += objects[right] ?? []
            
            if let left = pos.left {
                checkNeedObjects += objects[left] ?? []
            }
        }
        
        var isRemovable: Bool = true
        for object in checkNeedObjects {
            guard checkPossible(object.type, at: object.pos, n: n, objects: removedState) else {
                isRemovable = false
                break
            }
        }
        
        if isRemovable {
            self.objects = removedState
        }
    }
}

func solution(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
    
    let board: Board = .init()
    for frame in build_frame {
        let type: ObjectType = frame[2] == 0 ? .column : .row
        let pos: Position = .init(x: frame[0], y: frame[1])
        if frame[3] == 1 {
            board.addObject(type, at: pos, n: n)
        } else {
            board.removeObject(type, at: pos, n: n)
        }
    }
    
    var result: [[Int]] = []
    for object in board.sortedObjects() {
        result.append([object.pos.x, object.pos.y, object.type == .column ? 0 : 1])
    }
    
    return result
}


//print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
//print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))
// 출력값 [[0, 0, 0], [0, 1, 1], [1, 1, 1], [2, 0, 0], [2, 1, 1], [3, 1, 1], [4, 0, 0]]
// ㄹㄹㄹ [[0, 0, 0], [0, 1, 1], [2, 1, 1], [3, 1, 1], [4, 0, 0]]
// ㄷㄷㄷ [[0, 0, 0], [0, 1, 1], [2, 1, 1], [3, 1, 1], [4, 0, 0]]
// 기대값 [[0, 0, 0], [0, 1, 1], [1, 1, 1], [2, 1, 1], [3, 1, 1], [4, 0, 0]]
