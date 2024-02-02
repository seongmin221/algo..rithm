//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 2/2/24.
//

import Foundation

func solution(_ data: [[Int]], _ col: Int, _ row_begin: Int, _ row_end: Int) -> Int {
    
    var table = data
    table.sort(by: {
        if $0[col-1] < $1[col-1] { return true }
        else if $0[col-1] == $1[col-1] { return $0[0] > $1[0] }
        else { return false }
    })
    
    var answer = 0
    for i in row_begin...row_end {
        var sum = table[i-1].reduce(0, { $0 + $1 % i })
        answer ^= sum
    }
    
    return answer
}


// func solution(
//     _ data: [[Int]],
//     _ col: Int,
//     _ row_begin: Int,
//     _ row_end: Int
// ) -> Int {

//     var datas: [[Int]] = []
//     for (i, d) in data.enumerated() {
//         datas.append([i] + d)
//     }

//     datas.sort(by: {
//         if $0[col] < $1[col] { return true }
//         else if $0[col] == $1[col] { return $0[0] > $1[0] }
//         else { return false }
//     })

//     var siArr: [Int] = []
//     for i in row_begin...row_end {
//         var temp = datas[i-1]
//         temp.removeFirst()
//         var si = temp.reduce(0, { $0 + $1 % i })
//         siArr.append(si)
//     }
    
//     let answer = siArr.reduce(0, { $0 ^ $1 })


//     return answer
// }
