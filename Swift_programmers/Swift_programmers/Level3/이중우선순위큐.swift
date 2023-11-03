//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/1/23.
//

import Foundation

// I n    큐에 n을 삽입합니다.
// D 1    큐에서 최댓값을 삭제합니다.
// D -1    큐에서 최솟값을 삭제합니다.

class MaxHeap {
    var data: [Int] = []
    
    func insert(num: Int) {
        if data.isEmpty {
            data.append(num)
            data.append(num)
            return
        }
        data.append(num)
        
        var child = data.count - 1
        var parent = child / 2
        while data[child] > data[parent] {
            guard parent >= 1 else { break }
            data.swapAt(child, parent)
            child = parent
            parent = child / 2
        }
    }
    
    func removeRoot() {
        var last = data.count - 1
        guard last >= 1 else { return } // root 가 없는 경우 ( 하지만 data 에는 값이 있을 수 있음 )
        
        // root 존재
        data.swapAt(1, last)
        data.removeLast()
        
        var upper = 1
        var left = 2
        var right = 3
        
        while true {
            // 더 이상 자식 노드가 없을 때
            if left > data.count - 1 { break }
            
            // 왼쪽 자식 노드만 있을 때
            if right > data.count - 1 {
                if data[upper] < data[left] { data.swapAt(upper, left) }
                break
            }
            
            // 부모 노드가 자식 노드들보다 작을 때 -> 끝
            if data[upper] >= data[left] && data[upper] >= data[right] { break }
            else {
                // 부모 노드가 자식 노드 둘 중 하나 이상보다 작을 때
                if data[left] > data[right] {
                    data.swapAt(upper, left)
                    upper = left
                }
                else {
                    data.swapAt(upper, right)
                    upper = right
                }
                left = upper * 2
                right = upper * 2 + 1
            }
        }
    }
}

class MinHeap {
    var data: [Int] = []
    
    func removeRoot() {
        var last = data.count - 1
        guard last >= 1 else { return } // root 가 없는 경우 ( 하지만 data 에는 값이 있을 수 있음 )
        
        // root 존재
        data.swapAt(1, last)
        data.removeLast()
        
        var upper = 1
        var left = 2
        var right = 3
        
        while true {
            // 더 이상 자식 노드가 없을 때
            if left > data.count - 1 { break }
            
            // 왼쪽 자식 노드만 있을 때
            if right > data.count - 1 {
                if data[upper] > data[left] { data.swapAt(upper, left) }
                break
            }
            
            // 부모 노드가 자식 노드들보다 작을 때 -> 끝
            if data[upper] <= data[left] && data[upper] <= data[right] { break }
            else {
                // 부모 노드가 자식 노드 둘 중 하나 이상보다 작을 때
                if data[left] < data[right] {
                    data.swapAt(upper, left)
                    upper = left
                }
                else {
                    data.swapAt(upper, right)
                    upper = right
                }
                left = upper * 2
                right = upper * 2 + 1
            }
        }
    }
    
    func insert(num: Int) {
        if data.isEmpty {
            data.append(num)
            data.append(num)
            return
        }
        data.append(num)
        
        var child = data.count - 1
        var parent = child / 2
        while data[child] < data[parent] {
            guard parent >= 1 else { break }
            data.swapAt(child, parent)
            child = parent
            parent = child / 2
        }
    }
}

func solution(_ operations:[String]) -> [Int] {
    
    var maxHeap = MaxHeap()
    var minHeap = MinHeap()
    var count = 0
    
    for operation in operations {
        var op = operation
        
        switch op.removeFirst() {
        case "I":
            count += 1
            op.removeFirst()
            maxHeap.insert(num: Int(op)!)
            minHeap.insert(num: Int(op)!)
        case "D":
            guard count >= 1 else { continue }
            count -= 1
            op.removeFirst()
            switch op {
            case "1": maxHeap.removeRoot()
            case "-1": minHeap.removeRoot()
            default: continue
            }
        default: continue
        }
    }
    if count <= 0 { return [0, 0] }
    maxHeap.data.removeFirst()
    minHeap.data.removeFirst()
    let set = Set(maxHeap.data).intersection(Set(minHeap.data))
    return [set.max()!, set.min()!]
}




//print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
//print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]))
print(solution(["I 4", "I 3", "I 2", "I 1", "D 1", "D 1", "D -1", "D -1", "I 5", "I 6"]))

//protocol Heap {
//    var data: [Int] { get set }
//    var lastIndex: Int { get }
//    mutating func reorderLast()
//    mutating func insert(_ num: Int)
//    mutating func removeRoot()
//}
//
//extension Heap {
//    mutating func insert(_ num: Int) {
//        if data.isEmpty {
//            data.append(num)
//            data.append(num)
//            return
//        } else {
//            data.append(num)
//        }
//        reorderLast()
//    }
//}
//
//class MaxHeap: Heap {
//    var data = [Int]()
//    var lastIndex: Int { return data.count - 1 }
//    
//    func reorderLast() {
//        var child = lastIndex
//        var parent = child / 2
//        while true {
//            if parent == 0 { break }
//            if data[child] > data[parent] {
//                data.swapAt(child, parent)
//                child = parent
//                parent = child / 2
//            } else {
//                break
//            }
//        }
//    }
//    
//    func removeRoot() {
//        guard lastIndex > 0 else { return }
//        data.swapAt(1, lastIndex)
//        data.remove(at: lastIndex)
//        
//        var upper = 1
//        var left: Int = 0
//        var right: Int = 0
//        
//        while true {
//            guard lastIndex > 0 else { break }
//            left = upper * 2
//            right = upper * 2 + 1
//            if left > lastIndex { break }
//            else if left == lastIndex {
//                if data[upper] >= data[left] { break }
//                else {
//                    data.swapAt(upper, left)
//                    upper = left
//                }
//            }
//            else {
//                if data[upper] >= data[left] && data[upper] >= data[right] { break }
//                else {
//                    if data[left] >= data[right] {
//                        data.swapAt(upper, left)
//                        upper = left
//                    }
//                    else {
//                        data.swapAt(upper, right)
//                        upper = right
//                    }
//                }
//            }
//        }
//    }
//}
//
//class MinHeap: Heap {
//    var data = [Int]()
//    var lastIndex: Int { return data.count - 1 }
//    
//    func reorderLast() {
//        var child = lastIndex
//        var parent = child / 2
//        while true {
//            if parent == 0 { break }
//            if data[child] < data[parent] {
//                data.swapAt(child, parent)
//                child = parent
//                parent = child / 2
//            } else {
//                break
//            }
//        }
//    }
//    
//    func removeRoot() {
//        guard lastIndex > 0 else { return }
//        data.swapAt(1, lastIndex)
//        data.remove(at: lastIndex)
//        
//        var upper = 1
//        var left: Int = 0
//        var right: Int = 0
//        
//        while true {
//            guard lastIndex > 0 else { break }
//            left = upper * 2
//            right = upper * 2 + 1
//            if left > lastIndex { break }
//            else if left == lastIndex {
//                if data[upper] <= data[left] { break }
//                else {
//                    data.swapAt(upper, left)
//                    upper = left
//                }
//            }
//            else {
//                if data[upper] <= data[left] && data[upper] <= data[right] { break }
//                else {
//                    if data[left] <= data[right] {
//                        data.swapAt(upper, left)
//                        upper = left
//                    }
//                    else {
//                        data.swapAt(upper, right)
//                        upper = right
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//
//func solution(_ operations:[String]) -> [Int] {
//    
//    var maxHeap = MaxHeap()
//    var minHeap = MinHeap()
//    
//    var count = 0
//    for operation in operations {
//        var op = operation
//        switch op.removeFirst() {
//        case "I":
//            count += 1
//            op.removeFirst()
//            maxHeap.insert(Int(op)!)
//            minHeap.insert(Int(op)!)
//        case "D":
//            guard count > 0 else { continue }
//            count -= 1
//            op.removeFirst()
//            var opType = op.removeFirst()
//            switch opType {
//            case "1": maxHeap.removeRoot()
//            case "-": minHeap.removeRoot()
//            default: continue
//            }
//        default:
//            continue
//        }
//    }
//    
//    maxHeap.data.removeFirst()
//    minHeap.data.removeFirst()
//    if maxHeap.data.isEmpty || minHeap.data.isEmpty || count <= 0 {
//        return [0, 0]
//    } else {
//        return [maxHeap.data.first!, minHeap.data.first!]
//    }
//}

//print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
//solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])

//guard count > 0 else { return }
//
//data.swapAt(1, count)
//data.removeLast()
//
//var upperIndex = 1
//var leftIndex: Int { upperIndex * 2 }
//var rightIndex: Int { upperIndex * 2 + 1 }
//while true {
//    if count <= upperIndex { break }
//    else if count == leftIndex {
//        if data[upperIndex] > data[leftIndex] { break }
//        else { data.swapAt(upperIndex, leftIndex) }
//        upperIndex = leftIndex
//    }
//    else if count >= rightIndex {
//        if data[upperIndex] > data[leftIndex] && data[upperIndex] > data[rightIndex] { break }
//        else {
//            if data[leftIndex] > data[rightIndex] {
//                data.swapAt(upperIndex, leftIndex)
//                upperIndex = leftIndex
//            }
//            else {
//                data.swapAt(upperIndex, rightIndex)
//                upperIndex = rightIndex
//            }
//        }
//    }
//}
