class Solution {
    fun romanToInt(s: String): Int {
        var result = 0
        var prev = ""
        for (c in s.reversed()) {
            val char = c.toString()
            when (char) {
                "I" -> if (prev == "V" || prev == "X") result -= 1 else result += 1
                "V" -> result += 5
                "X" -> if (prev == "L" || prev == "C") result -= 10 else result += 10
                "L" -> result += 50
                "C" -> if (prev == "D" || prev == "M") result -= 100 else result += 100
                "D" -> result += 500
                "M" -> result += 1000
                else -> return -1
            }
            prev = char
        }
        return result
    }
}