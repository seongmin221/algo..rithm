//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/9/23.
//

import Foundation

func solution(_ files:[String]) -> [String] {
    
    var files = files
    
    // getHead
    func getHead(from text: String) -> String {
        var index = text.startIndex
        for c in text {
            guard !c.isNumber else { break }
            index = text.index(after: index)
        }
        return String(text[text.startIndex..<index])
    }
    
    // getNum
    func getNumber(from text: String, starting start: Int) -> String {
        var index = text.index(text.startIndex, offsetBy: start)
        for c in text[index...] {
            guard c.isNumber else { break }
            index = text.index(after: index)
        }
        return String(text[text.index(text.startIndex, offsetBy: start)..<index])
    }
    
    files.sort(by: {
        var firstHead = getHead(from: $0).lowercased()
        var firstNum = getNumber(from: $0, starting: firstHead.count)
        var secondHead = getHead(from: $1).lowercased()
        var secondNum = getNumber(from: $1, starting: secondHead.count)
        
        if firstHead < secondHead { return true }
        else if firstHead == secondHead {
            if Int(firstNum)! < Int(secondNum)! { return true }
            else { return false }
        }
        else { return false }
    })
    
    return files
}
