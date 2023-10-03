import Foundation
//
//print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
//
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
//let semaphore = DispatchSemaphore(value: 1)
//
//for i in 1...3 {
//  semaphore.wait() //semaphore 감소
//  DispatchQueue.global().async() {
//    //임계 구역(critical section)
//    print("공유 자원 접근 시작 \(i) 🌹")
//    sleep(3)
//    print("공유 자원 접근 종료 \(i) 🥀")
//    semaphore.signal() //semaphore 증가
//  }
//}

//DispatchSemaphore 초기값 0으로 설정
let semaphore = DispatchSemaphore(value: 0)
print("task A가 끝나길 기다림")
// 다른 스레드에서 task A 실행
DispatchQueue.global(qos: .background).async {
 //task A
 print("task A 시작!")
 print("task A 진행중..")
 print("task A 끝!")
 //task A 끝났다고 알려줌
 semaphore.signal()
}
// task A 끝날때까지는 value 가 0이라, task A 종료까지 block
semaphore.wait()
print("task A 완료됨")
