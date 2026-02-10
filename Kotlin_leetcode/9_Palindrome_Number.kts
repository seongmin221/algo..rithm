class Solution {
    fun isPalindrome(x: Int): Boolean {
        val string = x.toString()
        val length = string.length
        for (i in 0..<length/2) {
            if (string[i] != string[length - 1 - i]) return false
        }
        return true
    }
}