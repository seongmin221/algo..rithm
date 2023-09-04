//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2023/04/27.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var result = [Int]()
    
    let letters = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
    var dict = letters.components(separatedBy: " ")
    var message = msg
    
    var temp = ""
    var firstChar = ""
    
    while !message.isEmpty {
        firstChar = String(message.removeFirst())
        temp += firstChar
        if dict.contains(temp) {
            continue
        } else {
            dict.append(temp)
            _ = temp.removeLast()
            result.append(dict.firstIndex(of: temp)! + 1)
            message = firstChar + message
            temp = ""
        }
    }
    
    result.append(dict.firstIndex(of: temp)! + 1)
    
    return result
}
