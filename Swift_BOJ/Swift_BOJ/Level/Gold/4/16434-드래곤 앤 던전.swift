//
//  16434-드래곤 앤 던전.swift
//  Swift_BOJ
//
//  Created by 이성민 on 6/9/24.
//

import Foundation

//struct Hero {
//    var atk: Int
//    var maxHP: Int
//    var curHP: Int
//
//    init(_ atk: Int, _ maxHP: Int) {
//        self.atk = atk
//        self.maxHP = maxHP
//        self.curHP = maxHP
//    }
//
//    mutating func drinkPotion(_ potion: Object) {
//        atk += potion.atk
//        curHP = min(maxHP, curHP + potion.hp)
//    }
//
//    mutating func fightMonster(_ monster: Object) {
//        let heroAtkCount = Int(ceil(Double(monster.hp) / Double(self.atk)))
//        let monsterAtkCount = Int(ceil(Double(self.curHP) / Double(monster.atk)))
//        if heroAtkCount <= monsterAtkCount {
//            self.curHP -= (heroAtkCount - 1) * monster.atk
//        } else {
//            self.curHP = -1
//        }
////        self.curHP -= (min(heroAtkCount, monsterAtkCount) - 1) * monster.atk
//    }
//}
//
//struct Object {
//    let type: Int
//    let atk: Int
//    let hp: Int
//
//    init(_ type: Int, _ atk: Int, _ hp: Int) {
//        self.type = type
//        self.atk = atk
//        self.hp = hp
//    }
//}
//
//func dragonAndDungeon() -> Int {
//
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let n = input[0]
//    let iAtk = input[1]
//
//    var rooms: [Object] = []
//    for _ in 0..<n {
//        let info = readLine()!.split(separator: " ").map { Int($0)! }
//        rooms.append(.init(info[0], info[1], info[2]))
//    }
//
//    func canSavePricess(_ hero: Hero) -> Bool {
//        var hero = hero
//        for object in rooms {
//            if object.type == 1 { hero.fightMonster(object) }
//            else { hero.drinkPotion(object) }
//            print("\(hero.curHP)" + "/" + "\(hero.maxHP)" + " - atk: " + "\(hero.atk)")
//            if hero.curHP <= 0 { return false }
//        }
//        return true
//    }
//
//    var le: Int = 0
//    var ri: Int = .max
//    while le <= ri {
//        let mid: Int = (le + ri) / 2
//        if canSavePricess(.init(iAtk, mid)) { ri = mid - 1 }
//        else { le = mid + 1 }
//        print("----")
//    }
//    print("----")
//    print("----")
//    var hero: Hero = .init(iAtk, ri)
//    while true {
//        if canSavePricess(hero) { break }
//        else { hero.maxHP += 1 }
//    }
//
//    return hero.maxHP + 1
//}
//
//print(dragonAndDungeon())

struct Hero {
    var atk: Int
    var curHP: Int
    var maxHP: Int
    
    init(_ atk: Int, _ maxHP: Int) {
        self.atk = atk
        self.curHP = maxHP
        self.maxHP = maxHP
    }
}

extension Hero {
    mutating func drinkPotion(_ potion: Object) {
        self.atk += potion.atk
        self.curHP = min(self.maxHP, self.curHP + potion.hp)
    }
    
    mutating func fightMonster(_ monster: Object) {
        let toKillMonster: Int = monster.hp % self.atk == 0
        ? monster.hp / self.atk
        : monster.hp / self.atk + 1
        
        self.curHP -= monster.atk * (toKillMonster - 1)
    }
}

struct Object {
    let type: Int
    let hp: Int
    let atk: Int
    
    init(_ type: Int, _ atk: Int, _ hp: Int) {
        self.type = type
        self.atk = atk
        self.hp = hp
    }
}

func dragonAndDungeon() -> Int {
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let initAtk = input[1]
    
    var rooms: [Object] = []
    for _ in 0..<n {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        rooms.append(.init(info[0], info[1], info[2]))
    }
    
    func canSavePrincess(_ hero: Hero) -> Bool {
        var hero = hero
        for object in rooms {
            if object.type == 1 { hero.fightMonster(object) }
            else if object.type == 2 { hero.drinkPotion(object) }
            print("\(hero.curHP)" + "/" + "\(hero.maxHP)" + " - atk: " + "\(hero.atk)")
            if hero.curHP <= 0 { return false }
        }
        return true
    }
    
    var le: Int = 0
    var ri: Int = .max
    var answer = 0
    while le <= ri {
        let mid = (le + ri) / 2
        let hero: Hero = .init(initAtk, mid)
        
        if canSavePrincess(hero) {
            ri = mid - 1
            answer = mid
        } else {
            le = mid + 1
        }
    }
    
    return answer
}

//print(dragonAndDungeon())
