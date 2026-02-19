class Solution {
    fun strStr(haystack: String, needle: String): Int {
        if (haystack.length < needle.length) return -1
        if (haystack.length == needle.length) return if (haystack == needle) 0 else -1

        for (i in 0..<(haystack.length - needle.length)) {
            if (haystack.slice(i..<i + needle.length) == needle) {
                return i
            }
        }
        return -1
    }
}

class Solution2 {
    fun strStr(haystack: String, needle: String): Int {
        val n = needle.length
        for (i in 0 until (haystack.length - needle.length + 1)) {
            if (haystack.substring(i, i + n) == needle) {
                return i
            }
        }
        return -1
    }
}