//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 4/23/24.
//

import Foundation

//let input: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
//var A = input[0]
//var B = input[1]
//for _ in 0..<input[2] {
//    A ^= B
//}
//
//print(A)


extension Array where Element == Int {
    // worst: O(n^2)
    // best: O(n^2)
    // 안정
    func bubbleSort() -> [Element] {
        var arr = self
        for i in 0..<arr.count {
            for j in 0..<arr.count-1 {
                if arr[j] <= arr[j+1] { continue }
                arr.swapAt(j, j+1)
            }
        }
        return arr
    }
    
    // worst: O(n^2)
    // best: O(n^2)
    // 불안정
    func selectionSort() -> [Element] {
        var arr = self
        for i in 0..<arr.count {
            var minIndex: Element = i
            for j in i..<arr.count {
                if arr[j] < arr[minIndex] { minIndex = j }
            }
            arr.swapAt(minIndex, i)
        }
        return arr
    }
    
    // worst: O(n^2)
    // best: O(n)
    // 안정
    func insertionSort() -> [Element] {
        var arr = self
        for i in 1..<arr.count {
            let temp = arr[i]
            var prev = i - 1
            while prev >= 0 && arr[prev] > temp {
                arr.swapAt(prev, prev+1)
                prev -= 1
            }
        }
        return arr
    }
    
    // worst: O(n^2)
    // best: O(nlogn)
    // 불안정
    func quickSort() -> [Element] {
        func _quickSort(arr: [Element]) -> [Element] {
            guard let first = arr.first, arr.count > 1 else { return arr }
            
            let pivot = first
            let left = arr.filter { $0 < pivot }
            let right = arr.filter { $0 > pivot }
            
            return _quickSort(arr: left) + [pivot] + _quickSort(arr: right)
        }
        return _quickSort(arr: self)
    }
    
    
    func mergeSort() -> [Element] {
        func _merge(_ left: [Int], _ right: [Int]) -> [Int] {
            var left = left
            var right = right
            var result: [Int] = []
            
            while !left.isEmpty && !right.isEmpty {
                if left[0] > right[0] {
                    result.append(left.removeFirst())
                } else {
                    result.append(right.removeFirst())
                }
            }
            
            if !left.isEmpty { result += left }
            if !right.isEmpty { result += right }
            
            return result
        }
        
        func _mergeSort(_ arr: [Element]) -> [Int] {
            if arr.count <= 1 { return arr }
            let left = 0
            let right = arr.count
            let mid = (left + right) / 2
            let leftArr = Array(arr[0..<mid])
            let rightArr = Array(arr[mid+1..<right])
            return _merge(_mergeSort(leftArr), _mergeSort(rightArr))
        }
        
        return _mergeSort(self)
    }
    
}

var arr: [Int] = [2,6,8,2,4,71,7,23,2,5,7,1]
//var arr: [Int] = [623,7,82,8,92,45,346,4629,5428,45,32363,2,4315,2284,2,17,]
print(arr.bubbleSort())
print(arr.selectionSort())
print(arr.insertionSort())
print(arr.quickSort())
print(arr.mergeSort())

