import Foundation


// 지점의 개수 n
// 출발지점을 나타내는 s
// A의 도착지점을 나타내는 a
// B의 도착지점을 나타내는 b
// 지점 사이의 예상 택시요금을 나타내는 fares

// 이때, A, B 두 사람이 s에서 출발해서 각각의 도착 지점까지 택시를 타고 간다고 가정할 때,
// 최저 예상 택시요금을 계산해서 return 하도록 solution 함수를 완성해 주세요
// 아예 합승을 하지 않고 각자 이동하는 경우의 예상 택시요금이 더 낮다면, 합승을 하지 않아도 됩니다

// fares 배열의 각 행은 [c, d, f] 형태 -> c지점과 d지점 사이의 예상 택시요금이 f원

// 각 코스의 최소값 - 처음부터 이어지는 공통 코스
// cost 가 같은 코스가 있는 경우, 단순 최소값 구하는게

// MARK: - Solution -> Wrong !
// 1. a, b 가 각각 집까지 도달할 수 있는 코스들의 최소값과 코스를 DFS 로 찾아내기
// 2. a, b 의 코스의 공통 코스를 찾아내기
// 3. a, b 코스의 값 - 공통 코스의 값
// -> a, b 각각으로 생각하면 안됨, 공통으로 갔다가 헤어지는게 더 적은 돈 소비할 수도 있음

// MARK: - Solution
// 1.

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    
    var minDist = Array(repeating: Array(repeating: 999999, count: n), count: n)
    for i in 0..<n {
        minDist[i][i] = 0
    }
    
    for fare in fares {
        minDist[fare[0]-1][fare[1]-1] = fare[2]
        minDist[fare[1]-1][fare[0]-1] = fare[2]
    }
    
    for t in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                minDist[i][j] = min(minDist[i][j], minDist[i][t] + minDist[t][j])
            }
        }
    }
    
    var minCost = Int.max
    for t in 0..<n {
        minCost = min(minCost, minDist[s-1][t] + minDist[t][a-1] + minDist[t][b-1])
    }
    
    return minCost
}

print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))

//func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
//
//    func individualMinCost(from: Int, to: Int, withoutPos: [Int]) -> Int {
//        var visited = withoutPos
//        var needVisit = [from]
//
//        var currentCosts = [0]
//        var currentMin = Int.max
//
//        while !needVisit.isEmpty {
//            var pos = needVisit.removeLast()
//            var cost = currentCosts.removeLast()
//            if visited.contains(pos) || pos == to { continue }
//
//            for fare in fares.filter({ $0[0..<2].contains(pos) }) {
//                let i = fare.firstIndex(of: pos)!
//                var nextPos = fare[(i + 1) % 2]
//                var nextCost = cost + fare.last!
//
//                if visited.contains(nextPos) {
//                    visited.removeLast()
//                    continue
//                }
//
//                if nextCost >= currentMin {
//                    continue
//                }
//
//                if nextPos == to {
//                    currentMin = min(currentMin, nextCost)
//                    continue
//                }
//
//                needVisit.append(nextPos)
//                currentCosts.append(nextCost)
//            }
//
//            visited.append(pos)
//        }
//
//        return currentMin
//    }
//
//    var totalMin = Int.max
//    // s->commonStartPos + commonStartPos->a + commonStartPos->b 의 최소
//
//    var bothVisited = [Int]() // a, b
//    var bothNeedVisit = [s] // 여기서부터 a, b 로 갈라짐
//    var bothCost = [0]
    
//    while !bothNeedVisit.isEmpty {
//        var abStartPos = bothNeedVisit.removeFirst()
//        var currentBothCost = bothCost.removeLast()
//        print("abStartPos: \(abStartPos)")
//        print("bothVisited: \(bothVisited)")
//        print("bothCost: \(bothCost)")
//
//        let aMinCost = individualMinCost(from: abStartPos, to: a, withoutPos: bothVisited)
//        let bMinCost = individualMinCost(from: abStartPos, to: b, withoutPos: bothVisited)
//        var currentMin = currentBothCost + aMinCost + bMinCost
//        totalMin = min(totalMin, currentMin)
//        print("aMinCost: \(aMinCost), bMinCost: \(bMinCost)")
//        print("totalMin: \(totalMin)")
//
//        for fare in fares.filter({ $0[0..<2].contains(abStartPos) }) {
//            let i = fare.firstIndex(of: abStartPos)!
//            var nextPos = fare[(i + 1) % 2]
//            var nextCost = currentBothCost + fare.last!
//
//            if bothVisited.contains(nextPos) {
//                bothVisited.removeLast()
//                continue
//            }
//
//            if nextCost >= totalMin {
//                continue
//            }
//
//            bothNeedVisit.append(nextPos)
//            bothCost.append(nextCost)
//        }
//    }
//    print(individualMinCost(from: 1, to: b, withoutPos: []))
//    return totalMin
//}

//func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
//
//    func findMinCost(from: Int, to: Int) -> Int {
//        var visited = [Int]()
//        var needVisit = [from]
//
//        var currentCosts = [0]
//        var finalCosts = [Int]()
//
//        while !needVisit.isEmpty {
//            var currentPos = needVisit.removeFirst()
//            var cost = currentCosts.removeFirst()
//            if visited.contains(currentPos) { continue }
//
//            for fare in fares.filter({ $0[0..<2].contains(currentPos) }) {
//                guard let i = fare.firstIndex(of: currentPos) else { continue }
//                var next = fare[(i + 1) % 2]
//                if next == to {
//                    finalCosts.append(cost + fare.last!)
//                }
//                needVisit.append(next)
//                currentCosts.append(cost + fare.last!)
//            }
//            visited.append(currentPos)
//
//            print("finalCosts: \(finalCosts)")
//        }
//        return finalCosts.min()!
//    }
//
//    findMinCost(from: s, to: a)
//    return 0
//}

//func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
//
//    class Path: Equatable {
//        static func == (lhs: Path, rhs: Path) -> Bool {
//            return lhs.points == rhs.points && lhs.fare == rhs.fare
//        }
//
//        var points: [Int]
//        var fare: Int
//        init(_ points: [Int], _ fare: Int) {
//            self.points = points
//            self.fare = fare
//        }
//    }
//
//    func createTree() -> [Int: [Path]] {
//        var tree = [Int: [Path]]()
//        for fare in fares {
//            if tree.keys.contains(fare[0]) {
//                tree[fare[0]]?.append(Path(fare[1], fare[2]))
//            } else {
//                tree[fare[0]] = [Path(fare[1], fare[2])]
//            }
//
//            if tree.keys.contains(fare[1]) {
//                tree[fare[1]]?.append(Path(fare[0], fare[2]))
//            } else {
//                tree[fare[1]] = [Path(fare[0], fare[2])]
//            }
//        }
//        return tree
//    }
//
//    func bfs() {
//        var visited = [Path]()
//        var needVisit = [Path(s, 0)]
//
//        while !needVisit.isEmpty {
//            var node = needVisit.removeFirst()
//            if visited.contains(node) { continue }
//
//
//        }
//    }
//
//    var fares = fares
//    let tree = createTree()
//
//    return 0
//}


//func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
//
//    var takenCourse = [[Int]]()
//
//
//    func bfs() {
//        var visited = [Int]()
//        var needVisit = [s]
//
//        while !needVisit.isEmpty {
//            var currentPos = needVisit.removeFirst()
//            if visited.contains(currentPos) { continue }
//
//
//        }
//    }
//
//    return 0
//}
