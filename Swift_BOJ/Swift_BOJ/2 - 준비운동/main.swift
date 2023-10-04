//
//  main.swift
//  Swift_BOJ
//
//  Created by 이성민 on 10/4/23.
//

import Foundation

/// 한 쌍의 괄호로만 이루어진 ‘()’와 ‘[]’는 올바른 괄호열이다.
/// 만일 X가 올바른 괄호열이면 ‘(X)’이나 ‘[X]’도 모두 올바른 괄호열이 된다.
/// X와 Y 모두 올바른 괄호열이라면 이들을 결합한 XY도 올바른 괄호열이 된다.
///
/// ‘()’ 인 괄호열의 값은 2이다.
/// ‘[]’ 인 괄호열의 값은 3이다.
/// ‘(X)’ 의 괄호값은 2×값(X) 으로 계산된다.
/// ‘[X]’ 의 괄호값은 3×값(X) 으로 계산된다.
/// 올바른 괄호열 X와 Y가 결합된 XY의 괄호값은 값(XY)= 값(X)+값(Y) 로 계산된다.
///

// (()[[]])([])

var input = readLine()!.split(separator: "").map { String($0) }
var cstack = [String]()
var rstack = [Int]()
var c = ""

var result = 0
var temp = 1


