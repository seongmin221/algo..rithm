//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/28.
//

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [[3,1], [0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]]
    var fingerPos: Dictionary<String, [Int]> = [
        "left": [3, 0],
        "right": [3, 2]
    ]
    var fingerList = ""
    
    for num in numbers {
        var distL = 0
        var distR = 0
        switch num {
        case 1, 4, 7:
            fingerPos["left"] = keypad[num]
            fingerList.append("L")
        case 3, 6, 9:
            fingerPos["right"] = keypad[num]
            fingerList.append("R")
        case 2, 5, 8, 0:
            distL = abs(fingerPos["left"]![0] - keypad[num][0]) + abs(fingerPos["left"]![1] - keypad[num][1])
            distR = abs(fingerPos["right"]![0] - keypad[num][0]) + abs(fingerPos["right"]![1] - keypad[num][1])
            if distL < distR {
                fingerPos["left"] = keypad[num]
                fingerList.append("L")
            } else if distL > distR {
                fingerPos["right"] = keypad[num]
                fingerList.append("R")
            } else {
                if hand == "left" {
                    fingerPos["left"] = keypad[num]
                    fingerList.append("L")
                } else if hand == "right" {
                    fingerPos["right"] = keypad[num]
                    fingerList.append("R")
                }
            }
        default:
            continue
        }
    }
    return fingerList
}

print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))

//numbers    hand    result
//[1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]    "right"    "LRLLLRLLRRL"
//[7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]    "left"    "LRLLRRLLLRR"
//[1, 2, 3, 4, 5, 6, 7, 8, 9, 0]    "right"    "LLRLLRLLRL"

//func moveFinger(to num: Int) -> [Int] {
//    switch num {
//    case 1:
//        return [0, 0]
//    case 2:
//        return [1, 0]
//    case 3:
//        return [2, 0]
//    case 4:
//        return [0, 1]
//    case 5:
//        return [1, 1]
//    case 6:
//        return [2, 1]
//    case 7:
//        return [0, 2]
//    case 8:
//        return [1, 2]
//    case 9:
//        return [2, 2]
//    case 0:
//        return [3, 1]
//    default:
//        return [-1, -1]
//    }
//}
