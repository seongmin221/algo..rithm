import kotlin.math.max

class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        if (s.isEmpty()) return 0
        if (s.isBlank()) return 1

        var ans = 0
        var start = 0
        var end = 1

        val temp = mutableMapOf(s[start] to start)
        while (end < s.length) {
            val index = temp[s[end]]
            if (index != null) {
                ans = max(ans, end - start)
                start = index + 1
                end = start
                temp.clear()
                continue
            } else {
                temp[s[end]] = end
                end += 1
            }
        }

        ans = max(ans, end - start)

        return ans
    }
}