//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/4/23.
//

import Foundation

let dim = readLine()!.components(separatedBy: " ").map { Int($0)! }
var blocks = readLine()!.components(separatedBy: " ").map { Int($0)! }
let blockCnt = blocks.count
let blockMax = blocks.max()!
let blockMin = blocks.min()!

var map = Array(repeating: Array(repeating: 1, count: dim[1]), count: dim[0])
var posBlocks = [Int]()
for i in 0..<dim[0] {
    blocks.enumerated()
        .filter {
            $0.element < i+1
        }
        .map { $0.offset }
        .forEach { map[i][$0] = 0 }
}

func findRange(at height: Int, offset: Int) -> ClosedRange<Int>? {
    guard var temp = map[height].suffix(from: offset).firstIndex(of: 1) else { return nil }
    guard temp < dim[1], var start = map[height].suffix(from: temp).firstIndex(of: 0) else { return nil }
    guard start < dim[1], var end = map[height].suffix(from: start).firstIndex(of: 1) else { return nil }
    return start-1...end
}

var peak = blockMax-1
var start = 0
var ranges = [ClosedRange<Int>]()

var count = 0

while peak >= 0 {
    guard let range = findRange(at: peak, offset: start) else {
        peak -= 1
        start = 0
        continue
    }
    start = range.last!
    count += range.count - 2
}

print(count)

//var map = Array(repeating: Array(repeating: 0, count: dim[0]+1), count: dim[1])
//for i in 0..<dim[1] {
//    for j in 0..<blocks[i] {
//        map[i][j] = 1
//    }
//}
//
//func findRange(of height: Int, start: Int) -> ClosedRange<Int>? {
//    let map = map.suffix(from: start).map { $0[height] }
//    guard let temp = map.firstIndex(of: 1),
//          let start = map.suffix(from: temp).firstIndex(of: 0),
//          let end = map.suffix(from: start).firstIndex(of: 1)
//    else { return nil }
//    
//    return start-1...end
//}

//var ranges = [ClosedRange<Int>]()
//var temp = blocks
//var peak = blockMax
//var start = 0
//
//while peak >= blockMin {
//    if let range = findRange(of: peak, start: start) {
//        print(range, temp)
//        ranges.append(range)
//        peak = temp.max()!
//        start = range.last!
//    } else {
//        peak -= 1
//    }
//}
//
//print(ranges)

//func findRange(of height: Int, start: Int) -> Range<Int>? {
//    let map = map.suffix(from: start).map { $0[height] }
//    guard let temp = map.firstIndex(of: 1),
//          let start = map.suffix(from: temp).firstIndex(of: 0),
//          let end = map.suffix(from: start).firstIndex(of: 1)
//    else { return nil }
//    
//    return start-1..<end
//}
//
//var peaks = [Range<Int>]()
//var peak = blockMax
//var start = 0
//var isContained = false
//
//while peak >= blockMin {
//    guard let range = findRange(of: peak, start: start) else {
//        start = 0
//        peak -= 1
//        continue
//    }
//    peaks.forEach {
//        if $0.contains(range) { isContained = true }
//    }
//    print(peak, range)
//    if !isContained {
//        peaks.append(range)
//    }
//    start = range.startIndex
//    peak -= 1
//}
//
//var count = 0
//
//if !peaks.isEmpty {
//    
//    for range in peaks {
//        let curMax = min(blocks[range.startIndex], blocks[range.endIndex])
//        var newRange = range
//        newRange.removeFirst()
//        for k in newRange {
//            count += curMax - blocks[k]
//        }
//    }
//}
//
//print(count)

//func findFirstCreek(of depth: Int, start: Int) -> (Int, Int)? {
//    let map = map.suffix(from: start).map { $0[depth] }
//    guard let temp = map.firstIndex(of: 1),
//          let start = map.suffix(from: temp).firstIndex(of: 0),
//          let end = map.suffix(from: start).firstIndex(of: 1)
//    else { return nil }
//    
//    return (start, end)
//}

//var count = 0
//var start = 0
//var hasCreek = true
//
//for i in 0..<blockMax {
//    hasCreek = true
//    start = 0
//    while hasCreek {
//        if let range = findFirstCreek(of: i, start: start) {
//            start = range.1
//            count += range.1 - range.0
//        } else {
//            hasCreek = false
//        }
//    }
//}
//
//print(count)







//var blockTemp = [0]
//var index = 0
//var inc = 0
//var dec = 0
//var turningPt = [0]

//while index < blockCnt-1 {
//    blockTemp = Array(blocks.suffix(from: index))
//    inc = blockTemp.isIncUntil()
//    dec = blockTemp.isDecUntil()
//    index = max(inc, dec) + turningPt.last!
//    turningPt.append(index)
//}

//var count = 0
//var line = 0

//if blocks[turningPt.first!] < blocks[turningPt[1]] {
//    turningPt.removeFirst()
//}
//if blocks[turningPt.last!] < blocks[turningPt.last!-1] {
//    turningPt.removeLast()
//}

//print(turningPt)
//
//if turningPt.count >= 3 {
//    
//    for i in 0..<turningPt.count-2 {
//        if blocks[turningPt[i]] < blocks[turningPt[i+1]] {
//            continue
//        } else {
//            line = min(blocks[turningPt[i]], blocks[turningPt[i+2]])
//            for j in turningPt[i]+1...turningPt[i+2]-1 {
//                count += line - blocks[j]
//            }
//        }
//    }
//    print(count)
//} else {
//    print(0)
//}
//
//
//extension Array where Element == Int {
//    func isIncUntil() -> Int {
//        var max = Int.min
//        for i in 0..<self.count {
//            if self[i] >= max {
//                max = self[i]
//                continue
//            } else {
//                return i - 1
//            }
//        }
//        return self.count - 1
//    }
//    
//    func isDecUntil() -> Int {
//        var min = Int.max
//        for i in 0..<self.count {
//            if self[i] <= min {
//                min = self[i]
//                continue
//            } else {
//                return i - 1
//            }
//        }
//        return self.count - 1
//    }
//}
//
