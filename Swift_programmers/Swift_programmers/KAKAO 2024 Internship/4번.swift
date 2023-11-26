//
//  4번.swift
//  Swift_programmers
//
//  Created by 이성민 on 11/25/23.
//

func solution(_ coin:Int, _ cards:[Int]) -> Int {
    
    let cardCount = cards.count
    let goal = cardCount + 1
    
    var coins = coin
    var initCards = cards[0..<cardCount/3]
    
    var pair: [[Int]] = []
    var hand: [Int] = []
    for card in initCards {
        if hand.contains(goal - card) { pair.append([card, goal-card]) }
        hand.append(card)
    }
    
    var round = 0
    var leftCards = cards[cardCount/3..<cardCount]
    var futureCards = [Int]()
    while true {
        guard !hand.isEmpty else { break }
        round += 1
        
        var newCards = [leftCards.removeFirst(), leftCards.removeFirst()]
        let card1 = newCards[0]
        let card2 = newCards[1]
        
        if !pair.isEmpty {
            futureCards = Array(leftCards[leftCards.startIndex..<pair.count * 2])
            var futurePair = 0
            for card in newCards {
                if futureCards.contains(goal - card) {
                    futurePair += 1
                }
            }
        }
        else {
            
        }
    }
    
    
    return 0
}

//func solution(_ coin:Int, _ cards:[Int]) -> Int {
//
//    let cardCount = cards.count
//    let goal = cardCount + 1
//
//    var coins = coin
//    var initCards = cards[0..<cardCount/3]
//
//    var pair: [[Int]] = []
//    var hand: [Int] = []
//    for card in initCards {
//        if hand.contains(goal - card) { pair.append([card, goal-card]) }
//        hand.append(card)
//    }
//
//    var round = 0
//    var leftCards = cards[cardCount/3..<cardCount]
//    while true {
//        guard !hand.isEmpty || pair.isEmpty || coins != 0 else { break }
//        round += 1
//
//        if leftCards.isEmpty { break }
//        var newCards = [leftCards.removeFirst(), leftCards.removeFirst()]
//        let card1 = newCards[0]
//        let card2 = newCards[1]
//
//        if hand.contains(goal - newCards[0]) && coin >= 1 {
//            pair.append([card1, goal - card1])
//            hand.remove(at: hand.firstIndex(of: goal - card1)!)
//            newCards.remove(at: newCards.firstIndex(of: card1)!)
//            coins -= 1
//        }
//
//        if hand.contains(goal - card2) && coin >= 1 {
//            pair.append([card1, goal - card2])
//            hand.remove(at: hand.firstIndex(of: goal - card2)!)
//            newCards.remove(at: newCards.firstIndex(of: card2)!)
//            coins -= 1
//        }
//
//        if !newCards.isEmpty && !pair.isEmpty {
//            let start = leftCards.startIndex
//            var futureCards = [Int]()
//            if pair.count * 2 <= leftCards.count {
//                futureCards = Array(leftCards[start..<start+pair.count*2])
//            } else if start < leftCards.count {
//                futureCards = Array(leftCards[start..<leftCards.count])
//            }
//
//            for card in newCards {
//                if futureCards.contains(goal - card) && coins >= 1 {
//                    hand.append(card)
//                    coins -= 1
//                }
//            }
//        }
//
//        if pair.isEmpty { break }
//        else { pair.removeFirst() }
//    }
//
//    return round
//}

//print(solution(4, [3,6,7,2,1,10,5,9,8,12,11,4]))


//import Foundation
//
//func solution(_ coin:Int, _ cards:[Int]) -> Int {
//
//    let cardCount = cards.count
//    let goal = cardCount + 1
//    
//    var coins = coin
//    var initCards = cards[0..<cardCount/3]
//    
//    var pair: [[Int]] = []
//    var hand: [Int] = []
//    for card in initCards {
//        if hand.contains(goal - card) { pair.append([card, goal-card]) }
//        hand.append(card)
//    }
//    
//    var round = 0
//    var leftCards = cards[cardCount/3..<cardCount]
//    while true {
//        guard !hand.isEmpty || pair.isEmpty || coins != 0 else { break }
//        round += 1
//        
//        var newCards = [leftCards.removeFirst(), leftCards.removeFirst()]
//        let card1 = newCards[0]
//        let card2 = newCards[1]
//        
//        if hand.contains(goal - newCards[0]) && coin >= 1 {
//            pair.append([card1, goal - card1])
//            hand.remove(at: hand.firstIndex(of: goal - card1)!)
//            newCards.remove(at: 0)
//            coins -= 1
//        }
//        
//        if hand.contains(goal - card2) && coin >= 1 {
//            pair.append([card1, goal - card2])
//            hand.remove(at: hand.firstIndex(of: goal - card2)!)
//            newCards.remove(at: 1)
//            coins -= 1
//        }
//        
//        if !newCards.isEmpty && !pair.isEmpty {
//            let futureCards = leftCards[0..<pair.count*2]
//            for card in newCards {
//                if futureCards.contains(goal - card) && coins >= 1 {
//                    hand.append(card)
//                    coins -= 1
//                }
//            }
//        }
//        
//        if pair.isEmpty { break }
//        else { pair.removeFirst() }
//    }
//
//    return round
//}
//
//
