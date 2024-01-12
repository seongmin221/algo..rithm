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

func solution(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
    
    var colMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var floorMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    
    func placeCol(at pos: [Int]) {
        guard pos[1] == 0 // 바닥 위
                || floorMap[pos[1]][pos[0]] == 1 // 보의 한쪽 끝 위
                || colMap[pos[1]][pos[0]] == 1 // 다른 기둥 위
        else { return }
        
        colMap[pos[1]][pos[0]] += 1
        colMap[pos[1] + 1][pos[0]] += 1
    }
    
    func placeFloor(at pos: [Int]) {
        guard colMap[pos[1]][pos[0]] == 1 || colMap[pos[1]][pos[0] + 1] == 1 // 한 쪽 기둥 위
                || (floorMap[pos[1]][pos[0]] == 1 && floorMap[pos[1]][pos[0] + 1] == 1) // 양쪽이 다른 보 위
        else { return }
        
        floorMap[pos[1]][pos[0]] += 1
        floorMap[pos[1]][pos[0] + 1] += 1
    }
    
    func removeCol(at pos: [Int]) {
        colMap[pos[1]][pos[0]] -= 1
        colMap[pos[1] + 1][pos[0]] -= 1
        
        if isPossible(move: 0, at: pos) {
            colMap[pos[1]][pos[0]] += 1
            colMap[pos[1] + 1][pos[0]] += 1
        }
    }
    
    func removeFloor(at pos: [Int]) {
        floorMap[pos[1]][pos[0]] -= 1
        floorMap[pos[1]][pos[0] + 1] -= 1
        
    }
    
    func isPossible(move: Int, at pos: [Int]) -> Bool {
        switch move {
        case 0:
            if colMap[pos[1] + 1][pos[0]] == 2 // 삭제할 기둥 위에 기둥이 있을 때
                || (floorMap[pos[1] + 1][pos[0]] == 1) { return false } // 삭제할 기둥 위에 보 1개 있을 때
            else { return true }
        case 1:
            if (colMap[pos[1]][pos[0]] == 1 && floorMap[pos[1]][pos[0]] == 1) // 삭제할 보 좌측에 기둥 있을 때
                || (colMap[pos[1]][pos[0] + 1] == 1 && floorMap[pos[1]][pos[0] + 1] == 1) // 삭제할 보 우측에 기둥 있을 때
                || (floorMap[pos[1]][pos[0] + 1] == 2)
                
        default: return false
        }
    }
    
    for frame in build_frame {
        let pos = Array(frame[0..<2])
        let structure = frame[2]
        let action = frame[3]
        print(pos, structure == 0 ? "기둥" : "보", action == 0 ? "삭제" : "추가" )
        
        switch structure {
        case 0: action == 1 ? placeCol(at: pos) : removeCol(at: pos)
        case 1: action == 1 ? placeFloor(at: pos) : removeFloor(at: pos)
        default: break
        }
        
        print("col")
        for row in colMap.reversed() { print(row) }
        print("")
        print("floor")
        for row in floorMap.reversed() { print(row) }
        print("----------")
    }
    
    return []
}

print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))

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
