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

// MARK: - Solution
// 1. a, b 가 각각 집까지 도달할 수 있는 코스들의 최소값과 코스를 DFS 로 찾아내기
// 2. a, b 의 코스의 공통 코스를 찾아내기
// 3. a, b 코스의 값 - 공통 코스의 값

func solution(_ n: Int, _ s: Int, _ a: Int, _ b: Int, _ fares: [[Int]]) -> Int {
    
    class Path: Equatable {
        let points: Set<Int>
        let cost: Int
        
        init(points: Set<Int>, cost: Int) {
            self.points = points
            self.cost = cost
        }
        
        static func == (lhs: Path, rhs: Path) -> Bool {
            lhs.points == rhs.points
        }
        
        func contains(point: Int) -> Bool {
            return points.contains(point)
        }
        
        func print() -> String {
            return "points: \(points)" + " cost: \(cost)"
        }
    }
    
    func findPath(from start: Int, to end: Int) -> [Path] {
        var possibleCosts: [Int] = []
        
        var visitedQ: [Path] = []
        var needVisitS: [Path] = [.init(points: .init([start]), cost: 0)]
        var currentCosts: [Int] = [0]
        var prevPath: Path = .init(points: .init([0]), cost: 0)
        
        while !needVisitS.isEmpty {
            needVisitS.forEach { print($0.points) }
            let path: Path = needVisitS.removeLast()
            let dest = path.points.subtracting(prevPath.points)
            var cost: Int = currentCosts.removeLast()
            if visitedQ.contains(path) { continue }
            
            cost += path.cost
            print("start-\t", path.print(), "currentCost: \(cost)", "dest: \(dest)")
            
            if path.points.contains(end) {
                possibleCosts.append(cost)
                print("----------------")
                continue
            }
            
            visitedQ.append(path)
            let newPaths = paths
                .filter { !visitedQ.contains($0) }
                .filter { $0.points.intersection(path.points) == dest }
            let newPaths1 = paths
                .map { path in
                    
                }
            needVisitS += newPaths
            currentCosts += Array(repeating: cost, count: newPaths.count)
            prevPath = path
        }
        print(needVisitS)
        print(possibleCosts)
        return []
    }
    
    let paths = fares.map { Path(points: Set($0[0..<2]), cost: $0[2]) }
    
    let t = findPath(from: s, to: a)
    
    return 0
}

solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]])
