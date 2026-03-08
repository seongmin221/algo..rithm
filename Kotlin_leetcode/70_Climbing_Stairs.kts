class Solution {
    fun climbStairs(n: Int): Int {
        if (n == 1) return 1
        if (n == 2) return 2

        val list = MutableList(n+1, { 0 })
        list[1] = 1
        list[2] = 2

        for (i in 3..n) {
            list[i] = list[i-1] + list[i-2]
        }
        return list[n]
    }
}