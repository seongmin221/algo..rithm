import Foundation

var nums = readLine()!.components(separatedBy: " ").map { Int($0)! }
var result = 0

nums.forEach { num in
    result += num
}

print(result)
