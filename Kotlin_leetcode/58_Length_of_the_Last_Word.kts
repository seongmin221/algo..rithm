class Solution {
    fun lengthOfLastWord(s: String): Int {
        val regex = Regex("\\s+")
        return s.trim().split(regex).last().length
    }
}

class Solution2 {
    fun lengthOfLastWord(s: String): Int {
        var started = false
        var result = 0
        for (i in s.length-1 downTo 0) {
            if (s[i] != ' ') {
                started = true
                result ++
            } else {
                started = false
            }

            if (!started && result > 0) {
                break
            }
        }
        return result
    }
}