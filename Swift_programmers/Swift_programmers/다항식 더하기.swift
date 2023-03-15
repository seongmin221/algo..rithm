//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/03/15.
//

import Foundation

func solution(_ polynomial:String) -> String {
    let elems = polynomial.components(separatedBy: " + ")
    var result: String
    var intX: Int = 0
    var intConst: Int = 0
    var stringX: String
    
    for elem in elems {
        if elem.contains("x") {
            let param = elem.dropLast()
            if param == "" {
                intX += 1
            } else {
                intX += Int(param)!
            }
        } else {
            intConst += Int(elem)!
        }
    }
    if intX == 1 {
        stringX = ""
    } else {
        stringX = String(intX)
    }
    if intX != 0 && intConst != 0 {
        result = stringX + "x + " + String(intConst)
    } else if intX == 0 && intConst != 0 {
        result = String(intConst)
    } else if intX != 0 && intConst == 0 {
        result = stringX + "x"
    } else {
        result = "0"
    }
    return result
}
