//
//  progressTime.swift
//  Swift_programmers
//
//  Created by 이성민 on 3/17/24.
//

import Foundation

public func progressTime(_ closure: () -> Void) -> TimeInterval {
    let start = CFAbsoluteTimeGetCurrent()
    closure()
    let diff = CFAbsoluteTimeGetCurrent() - start
    return (diff)
}
