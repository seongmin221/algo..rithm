//
//  main.swift
//  SOPT_Algorithm_Study
//
//  Created by 이성민 on 10/25/23.
//

import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    
    var result = [0, 0]
    
    func canCompress(_ size: Int, x: Int, y: Int) -> Int {
        guard size % 2 == 0 else {
            var val = arr[y][x]
            result[val] += 1
            return val
        }
        
        var k = size/2
        var lt = canCompress(k, x: x, y: y)
        var rt = canCompress(k, x: x + k, y: y)
        var lb = canCompress(k, x: x, y: y + k)
        var rb = canCompress(k, x: x + k, y: y + k)
        
        guard lt != -1 && lt != -1 && lt != -1 && rb != -1 else { return -1 }
        
        if lt == rt && rt == lb && lb == rb {
            var val = arr[y][x]
            result[val] -= 3 // -4 +1
            return val
        }
        
        return -1
    }
    
    _ = canCompress(arr.count, x: 0, y: 0)
    return result
}
