//
//  바탕화면 정리.swift
//  Swift_programmers
//
//  Created by 이성민 on 4/19/24.
//

import Foundation

func solution(_ wallpaper: [String]) -> [Int] {

    var lux: Int = .max
    var luy: Int = .max
    var rdx: Int = .min
    var rdy: Int = .min

    for (y, row) in wallpaper.enumerated() {
        for (x, c) in row.enumerated() {
            if String(c) == "#" {
                luy = min(luy, y)
                lux = min(lux, x)
                rdy = max(rdy, y+1)
                rdx = max(rdx, x+1)
            }
        }
    }

    return [luy, lux, rdy, rdx]
}
