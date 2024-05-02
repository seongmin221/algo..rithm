//
//  2. Add Two Numbers.swift
//  Swift_leetcode
//
//  Created by 이성민 on 5/2/24.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var lr: ListNode = .init()
        var nextDigit: Int = 0

        var temp: ListNode? = lr
        while true {
            var sum: Int = 0
            if let v1 = l1?.val, let v2 = l2?.val { sum = v1 + v2 + nextDigit }
            else if let v1 = l1?.val { sum = v1 + nextDigit }
            else if let v2 = l2?.val { sum = v2 + nextDigit }
            temp?.val = sum % 10

            if sum >= 10 { nextDigit = 1 }
            else { nextDigit = 0 }

            l1 = l1?.next
            l2 = l2?.next
            if l1 == nil && l2 == nil {
                if nextDigit == 1 { temp?.next = .init(1) }
                break
            }
            else {
                temp?.next = .init()
                temp = temp?.next
            }
        }

        return lr
    }
}
