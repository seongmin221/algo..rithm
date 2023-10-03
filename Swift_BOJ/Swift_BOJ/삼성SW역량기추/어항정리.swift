//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 2023/03/03.
//

/// 1. 맨 좌측 1개 90도 회전하는 방식으로 쌓기
/// 2. 맨 좌측 쌓여있는 2개짜리를 다시 90도 회전하여 쌓기
/// 3. 2층짜리 어항들을 같은 방식으로 90도 회전하여 쌓기
/// 4. 이 과정을 가능할떄까지 반복 -> 함수로 선언하기?
///
/// < 함수로 선언 >
/// 5. ( 인접한 어항의 물고기 수 차이 ) / 5 의 몫(d) 가 0보다 크면, 더 적은 양의 물고기 있는 곳으로 d 만큼 이동
/// 6. 5번 과정은 모든 어항에서 "동시에" 발생
/// 7. 맨 좌측 하단 어항부터 바닥에 둠
///
/// 8. 가운데를 중심으로 왼쪽 반을 오른쪽 반으로 접음
/// 9. 8 과정을 두 번 진행
/// 10. 5~7 과정 반복
///

import Foundation

//var time = readLine()!.components(separatedBy: " ").map { Int($0)! }
var info = readLine()!.components(separatedBy: " ").map { Int($0)! }
var fb = readLine()!.components(separatedBy: " ").map { Int($0)! }

var n = info[0]
var k = info[1]

func rotate90() {
    
}

