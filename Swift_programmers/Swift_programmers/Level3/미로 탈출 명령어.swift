//
//  미로 탈출 명령어.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/15/24.
//

import Foundation

func solution(_ n: Int, _ m: Int, _ x: Int, _ y: Int, _ r: Int, _ c: Int, _ k: Int) -> String {
    
    guard (x + y + r + c) % 2 == k % 2 && abs(r - x) + abs(c - y) <= k
    else { return "impossible" }
    
    let dx: [Int] = [1, 0, 0, -1]
    let dy: [Int] = [0, -1, 1, 0]
    
    func execute() -> String {
        var result = ""
        func dfs(curX: Int, curY: Int, destX: Int, destY: Int, moves: String) {
            guard 1 <= curX, curX <= n, 1 <= curY, curY <= m, // 격자 내부에 존재해야 함
                  abs(destX - curX) + abs(destY - curY) <= k - moves.count, // 갈 수 있는 거리
                  result == "" // 아직 길을 못 찾은 상태
            else { return }
            
            if destX == curX && destY == curY && moves.count == k {
                result = moves
                return
            }
            
            dfs(curX: curX + dx[0], curY: curY + dy[0], destX: destX, destY: destY, moves: moves + "d")
            dfs(curX: curX + dx[1], curY: curY + dy[1], destX: destX, destY: destY, moves: moves + "l")
            dfs(curX: curX + dx[2], curY: curY + dy[2], destX: destX, destY: destY, moves: moves + "r")
            dfs(curX: curX + dx[3], curY: curY + dy[3], destX: destX, destY: destY, moves: moves + "u")
        }
        dfs(curX: x, curY: y, destX: r, destY: c, moves: "")
        
        return result
    }
    
    return execute()
}
