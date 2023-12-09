//
//  main.swift
//  Swift_programmers
//
//  Created by 이성민 on 12/4/23.
//

import Foundation

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
    
    var users = user_id
    var bans = banned_id
    
    var possibleBanList: [[String]] = []
    
    for ban in bans {
        var possibleBan = users.filter { $0.count == ban.count }
//        print("ban: \(ban)")
        ban.enumerated().forEach { i, c in
//            print("ban.enumerated(): currentLetter: \(c)")
//            print("ban.enumerated(): possibleBan: \(possibleBan)")
            possibleBan = possibleBan.filter {
                let index = $0.index("".startIndex, offsetBy: i)
                if $0[index] == c || c == "*" { return true }
                else { return false }
            }
        }
        possibleBanList.append(possibleBan)
    }
    
    print(possibleBanList)
    
    var initList = possibleBanList.removeFirst()
    var banSet = Set(initList.map { Set([$0]) })
    var tempSet = banSet
    
    while !possibleBanList.isEmpty {
        var banList = possibleBanList.removeFirst()
        tempSet.forEach { s in
            banList.forEach {
                var s = s
                s.insert($0)
                tempSet.insert(s)
            }
        }
    }
    
    return tempSet.filter { $0.count == bans.count }.count
}

//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))


// MARK: - 예전 트라이

//func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
//    var result = 1
//    let userIDs = user_id
//    let banIDs = banned_id
//    var duplicateBanIDs: [String: Int] = [:]
//    
//    var set = Set<SetModel>()
//    
//    for banID in banIDs {
//        if duplicateBanIDs.keys.contains(banID) {
//            duplicateBanIDs[banID]! += 1
//        } else {
//            duplicateBanIDs.updateValue(1, forKey: banID)
//        }
//        for userID in userIDs {
//            if isPossibleSet(userID, banID) {
//                set.insert(.init(user: userID, ban: banID))
//            }
//        }
//    }
//    
//    for key in duplicateBanIDs.keys {
//        let k = duplicateBanIDs[key]
//        let n = set.filter { $0.ban == key }.count
//        result *= binomial(n: n, k!)
//    }
//    
//    return result
//}
//
//struct SetModel: Hashable {
//    let user: String
//    let ban: String
//}
//
//func isPossibleSet(_ id1: String, _ id2: String) -> Bool {
//    var user = id1
//    var ban = id2
//    print(user, ban)
//    
//    guard user.count == ban.count
//    else { return false }
//    
//    let start = ban.startIndex
//    user = ban.removeStars(and: user)
//    while ban != "" {
//        print(user, ban)
//        guard let i = ban.firstIndex(of: "*")
//        else {
//            return user == ban ? true : false
//        }
//        if user.prefix(upTo: i) == ban.prefix(upTo: i) {
//            user.removeSubrange(start..<i)
//            ban.removeSubrange(start..<i)
//            user = ban.removeStars(and: user)
//        } else {
//            return false
//        }
//    }
//    return true
//}
//
//func binomial(n: Int, _ k: Int) -> Int {
//    precondition(k >= 0 && n >= 0)
//    if (k > n) { return 0 }
//    var result = 1
//    for i in 0 ..< min(k, n-k) {
//        result = (result * (n - i))/(i + 1)
//    }
//    return result
//}
//
//
//extension String {
//    mutating func removeStars(and id: String) -> String {
//        var temp = id
//        while self.first == "*" {
//            _ = self.removeFirst()
//            _ = temp.removeFirst()
//        }
//        return temp
//    }
//}
//
