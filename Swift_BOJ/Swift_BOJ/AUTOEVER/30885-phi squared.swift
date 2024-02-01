//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2/1/24.
//

import Foundation

//class Germ {
//    let index: Int
//    var size: Int
//    var prev: Germ?
//    var next: Germ?
//    
//    init(index: Int, size: Int, prev: Germ? = nil, next: Germ? = nil) {
//        self.index = index
//        self.size = size
//        self.prev = prev
//        self.next = next
//    }
//}
//
//extension Germ {
//    
//    func takeAction() {
//        var absorbedSize = 0
//        if let next = self.next {
//            if self.size >= next.size {
//                self.next = next.next
//                next.next?.prev = self
//                absorbedSize += next.size
//            }
//        }
//        
//        if let prev = self.prev {
//            if self.size >= prev.size {
//                self.prev = prev.prev
//                prev.prev?.next = self
//                absorbedSize += prev.size
//            }
//        }
//        
//        self.size += absorbedSize
//    }
//    
//    func backToFirst() -> Germ {
//        var currentGerm = self
//        while true {
//            guard let prev = currentGerm.prev else { return currentGerm}
//            currentGerm = prev
//        }
//    }
//}
//
//let count = Int(readLine()!)!
//let germs = readLine()!
//    .split(separator: " ")
//    .map { Int(String($0))! }
//    .enumerated()
//    .map { Germ(index: $0.offset, size: $0.element) }
//
//for i in 0..<count-1 {
//    germs[i].next = germs[i+1]
//    germs[i+1].prev = germs[i]
//}
//
//var currentGerm = germs.first!
//while currentGerm.next != nil || currentGerm.prev != nil {
//    currentGerm.takeAction()
//    if let next = currentGerm.next {
//        currentGerm = next
//    } else {
//        currentGerm = currentGerm.backToFirst()
//    }
//}
//
//print(currentGerm.size)
//print(currentGerm.index + 1)


// MARK: - 1차 시도: 시간초과

//var temp = Array(germs.enumerated())
//var index = 0
//var nextDay: [(offset: Int, element: Int)] = []
//while temp.count != 1 {
//    
//    if index >= temp.count { index = 0 }
//    
//    if index == 0 {
//        if temp[index].element >= temp[index+1].element {
//            temp[index] = (temp[index].offset, temp[index].element + temp.remove(at: index+1).element)
//        }
//    } else if index == temp.count - 1 {
//        if temp[index - 1].element <= temp[index].element {
//            temp[index-1] = (temp[index].offset, temp[index].element + temp.remove(at: index-1).element)
//            index -= 1
//        }
//    } else {
//        var new = temp[index].element
//        if temp[index].element >= temp[index-1].element {
//            new += temp.remove(at: index-1).element
//            index -= 1
//        }
//        if temp[index].element >= temp[index+1].element {
//            new += temp.remove(at: index+1).element
//        }
//        temp[index] = (temp[index].offset, new)
//    }
//    index += 1
//}
//
//print(temp[0].element)
//print(temp[0].offset + 1)


