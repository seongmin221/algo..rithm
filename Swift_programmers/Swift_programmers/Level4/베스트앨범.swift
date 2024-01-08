//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 1/7/24.
//

import Foundation

// 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
// 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
// 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    
    let totalCount = genres.count
    var playedCountMap: [String: Int] = [:]
    var songMap: [String: [Int]] = [:]
    for genre in Set(genres) {
        playedCountMap[genre] = 0
        songMap[genre] = []
    }
    
    for i in 0..<totalCount {
        playedCountMap[genres[i]]! += plays[i]
        
        var songs = songMap[genres[i]]!
        songs.append(i)
        songs.sort(by: { plays[$0] > plays[$1] })
        if songs.count > 2 { songs = Array(songs.prefix(upTo: 2)) }
        songMap[genres[i]]! = songs
    }
    
    let sorted = playedCountMap
        .sorted(by: { $0.value > $1.value })
        .map { $0.key }
    
    var result: [Int] = []
    for genre in sorted {
        result += songMap[genre]!
    }
    
    return result
}

//print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
