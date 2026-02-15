import kotlin.math.min

class Solution {
    fun longestCommonPrefix(strs: Array<String>): String {
        var lcp = ""

        val strings = strs.sortedBy { it.length }
        lcp = strings.first()

        for (str in strings) {
            var temp = str.take(lcp.length)
            print(temp + "\n")
            while (lcp != temp) {
                print(lcp + "\n")
                lcp = lcp.dropLast(1)
                temp = temp.dropLast(1)
            }
        }

        return lcp
    }
}

class Solution2 {
    fun longestCommonPrefix(strs: Array<String>): String {
        var lcp = strs[0]

        for (index in 1 until strs.size) {
            var i = 0
            while (i < min(lcp.length, strs[index].length) && lcp[i] == strs[index][i]) {
                i ++
            }
            lcp = lcp.substring(0, i)
        }

        return lcp
    }
}

Solution().longestCommonPrefix(arrayOf("flower","flow","flight"))