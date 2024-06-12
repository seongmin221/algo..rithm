//
//  0커플.swift
//  Swift_goorm
//
//  Created by 이성민 on 6/12/24.
//

import Foundation

func zeroCouple() {
    let _ = readLine()
    print(
        readLine()!
            .split(separator: " ")
            .map { Int($0)! }
            .reduce(0, { $0 + $1 })
    )
}
