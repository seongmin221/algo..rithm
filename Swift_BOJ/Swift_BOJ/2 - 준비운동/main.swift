//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/9/23.
//

import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

var order = readLine()!.split(separator: " ").map { Int($0)! }



//var cnt = 0
//if n >= k { print(cnt) }
//else {
//    var temp = Array(repeating: 0, count: k+1)
//    for e in order {
//        temp[e] += 1
//    }
//    
//    let sortedOrderFreq = temp.enumerated().filter({ $0.1 != 0 }).sorted(by: { $0.element > $1.element }) // 사용 횟수 높은 순서대로 만든 (기기, 횟수) 배열
//    let eTypeCnt = sortedOrderFreq.count
//    var curMultitab = sortedOrderFreq.map { $0.offset }
//    var eCnt = sortedOrderFreq.map { $0.element }
//    
//    for e in order {
//        print(curMultitab, eCnt)
//        if let i = curMultitab[0..<n].firstIndex(of: e) {
//            eCnt[i] -= 1
//        } else if let i = curMultitab[n..<eTypeCnt].firstIndex(of: e) {
//            eCnt[i] -= 1
//            curMultitab.swapAt(n-1, i)
//            eCnt.swapAt(n-1, i)
//            cnt += 1
//            
//            var j = n-1
//        innerLoop: while j > 0 {
//            if eCnt[j] > eCnt[j-1] {
//                eCnt.swapAt(j-1, j)
//                curMultitab.swapAt(j-1, j)
//                j -= 1
//            } else {
//                break innerLoop
//            }
//        }
//        }
//    }
//}
//
//print(cnt)

/// 아직 사용 횟수가 가장 많이 남은 것들을 멀티탭에 꽂아두기


//var cnt = 0
//
//for e in order {
//    if multitab.contains(e) {
//        continue
//    } else {
//        multitab[1] = e
//        cnt += 1
//    }
//}
//cnts.append(cnt)
//
//for e in order {
//    if multitab.contains(e) {
//        continue
//    } else {
//        multitab[0] = multitab[1]
//        multitab[1] = e
//        cnt += 1
//    }
//}
//cnts.append(cnt)
//
//print(cnts.min()!)
