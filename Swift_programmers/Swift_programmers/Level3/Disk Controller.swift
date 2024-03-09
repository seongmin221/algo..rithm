//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/8/24.
//

import Foundation

struct Job: Comparable {
    let inputTime: Int
    let duration: Int
    
    static func < (lhs: Job, rhs: Job) -> Bool {
        lhs.duration < rhs.duration
    }
}

struct MinHeap<T: Comparable> {
    var elements: [T] = []
    
    var count: Int { elements.count }
    var root: T? { count == 1 ? nil : elements[1] }
    var isEmpty: Bool { count == 1 }
}

extension MinHeap {
    mutating func insert(_ e: T) {
        if elements.isEmpty {
            elements.append(e)
        }
        elements.append(e)
        sortUp()
    }
    
    mutating func pop() -> T? {
        guard count > 1 else { return nil }
        
        let element = elements[1]
        elements.swapAt(1, count - 1)
        elements.removeLast()
        sortDown()
        return element
    }
    
    mutating func sortDown() {
        var parent: Int = 1
        while true {
            let lc: Int = parent * 2
            let rc: Int = parent * 2 + 1
            // 더 이상 children 이 없을 때
            if lc > count - 1 {
                break
            }
            
            // 왼쪽 child 만 있을 때
            if lc == count - 1 {
                if elements[parent] > elements[lc] {
                    elements.swapAt(parent, lc)
                    parent = lc
                }
                break
            }
            
            // 양쪽 children 모두 있을 때
            if rc <= count - 1 {
                if elements[lc] <= elements[rc] {
                    guard elements[parent] > elements[lc] else { break }
                    elements.swapAt(parent, lc)
                    parent = lc
                }
                else {
                    guard elements[parent] > elements[rc] else { break }
                    elements.swapAt(parent, rc)
                    parent = rc
                }
                continue
            }
        }
    }
    
    mutating func sortUp() {
        var child: Int = count - 1
        var parent: Int = child / 2
        
        while parent > 0 {
            guard elements[parent] > elements[child] else { break }
            elements.swapAt(parent, child)
            child = parent
            parent = child / 2
        }
    }
}


func solution(_ jobs: [[Int]]) -> Int {
    
    var heap: MinHeap<Job> = .init()
    var jobs: [Job] = jobs
        .sorted(by: { $0[0] < $1[0] })
        .map { .init(inputTime: $0[0], duration: $0[1]) }
    let jobCount = jobs.count
    
    func insertHeap(currentTime: Int) {
        while let job = jobs.first, job.inputTime <= currentTime  {
            heap.insert(jobs.removeFirst())
        }
    }
    
    var accTime: Int = 0
    var currentJob: Job?
    var startTime: Int = 0
    for time in 0...1000000 {
        guard !heap.isEmpty || !jobs.isEmpty || currentJob != nil
        else { break }
        
        insertHeap(currentTime: time)
        
        // 지금 할당된 작업이 있을 때
        if let job = currentJob {
            // 할당된 작업이 지금 끝났을 때
            if startTime + job.duration <= time {
                accTime += time - job.inputTime
                currentJob = nil
            }
            // 할당된 작업이 진행 중일 때
            else { continue }
        }
        
        // 지금 할당된 작업이 없을 때
        if currentJob == nil {
            // 작업 할당
            guard let job = heap.pop() else { continue }
            currentJob = job
            startTime = time
        }
    }
    
    return accTime / jobCount
}

//print(solution([[0, 3], [1, 9], [2, 6]]))
