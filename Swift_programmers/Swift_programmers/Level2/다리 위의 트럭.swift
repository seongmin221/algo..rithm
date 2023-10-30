//
//  main.swift
//  SOPT_Algorithm_Study
//
//  Created by 이성민 on 10/28/23.
//

import Foundation

// 1. 다리에 올라갈 수 있으면 가능한만큼 올라감 
// onBridge.totalWeight() <= weight && onBridge.count <= bridge_length
// 한 대 올라갈 때마다 1초 추가

// 2. 더 이상 못올라가면 맨 앞에 있는 트럭 내보내기
// onBridge.removeFirst() 를 overBridge 에 append
// 남은 트럭 수 만큼 시간 추가 -> bridge_length - onBridge.count

// bridge_length     weight    truck_weights                    return
// 2                 10        [7,4,5,6]                        8
// 100               100       [10]                             101
// 100               100       [10,10,10,10,10,10,10,10,10,10]  110

//func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
//    
//    var waiting: [Int] = truck_weights
//    var on: [Int] = []
//    var pos: [Int] = []
//    
//    var time = 0
//    
//    while true {
//        guard !on.isEmpty || !waiting.isEmpty else { break }
//        
//        if !waiting.isEmpty && on.totalWeight() + waiting.first! <= weight && on.count + 1 <= bridge_length {
//            
//            print("time: \(time)", "onBridge: \(on)", "waiting: \(waiting)")
//            print("pos: \(pos)")
//            print("-----")
//            
//            pos = pos.map { $0 + 1 }.filter {
//                if $0 <= bridge_length { return true }
//                else {
//                    on.removeFirst()
//                    return false
//                }
//            }
//            on.append(waiting.removeFirst())
//            pos.append(1)
//            time += 1
//        }
//        
//        if !on.isEmpty && !pos.isEmpty {
//            
//            print("time: \(time)", "onBridge: \(on)", "waiting: \(waiting)")
//            print("pos: \(pos)")
//            print("-----")
//            
//            var temp = bridge_length - pos.first!
//            pos = pos.map { $0 + temp }
//            time += temp
//            on.removeFirst()
//            pos = pos.map { $0 + 1 }.filter { $0 <= bridge_length }
//            time += 1
//        }
//    }
//    
//    return time
//}

//func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
//    
//    var waiting: [Int] = truck_weights
//    var on: [Int] = []
//    var pos: [Int] = []
//    var time = 0
//    var moveCnt = 0
//    
//    func goOn() {
//        guard !waiting.isEmpty && on.totalWeight() + waiting.first! <= weight && on.count + 1 <= bridge_length
//        else { return }
//        
//        on.append(waiting.removeFirst())
//        pos.append(0)
//        pos = pos.map { $0 + 1 }
//    }
//    
//    func move() -> Bool {
//        guard !on.isEmpty || !waiting.isEmpty 
//        else { return false }
//        
//        return true
//    }
//    
//    func goOut() {
//        guard !on.isEmpty
//        else { return }
//        
//        moveCnt = bridge_length - pos.first! + 1
//        pos.removeFirst()
//        on.removeFirst()
//        pos = pos.map { $0 + moveCnt }
//    }
//    
//    return time
//}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var waiting: [Int] = truck_weights
    var on: [Int] = []
    var pos: [Int] = []
    var time = 0
    var moveCnt = 0
    
    while !waiting.isEmpty || !on.isEmpty {
        
        pos = pos.map { $0 + 1 }.filter {
            if $0 <= bridge_length { return true }
            on.removeFirst()
            return false
        }
        
        if !waiting.isEmpty && on.totalWeight() + waiting.first! <= weight && on.count + 1 <= bridge_length {
            on.append(waiting.removeFirst())
            pos.append(1)
        }
        
        time += 1
    }
    
    return time
}

extension Array where Element == Int {
    func totalWeight() -> Int {
        return self.reduce(0, +)
    }
}

//print(solution(2, 10, [7, 4, 5, 6]))
//print(solution(100, 100, [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]))



//print("time: \(time)", "onBridge: \(on)", "waiting: \(waiting)")
//print("pos: \(pos)")
//print("-----")
