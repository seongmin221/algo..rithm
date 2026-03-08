import kotlin.math.sqrt

class Solution {
    fun mySqrt(x: Int): Int {
        return sqrt(x.toDouble()).toInt()
    }
}

class Solution1 {
    fun mySqrt(x: Int): Int {
        if (x == 0) return 0
        var s = 1
        var e = x

        while (s + 1 < e) {
            val m = (s + e) / 2
            if (m < x / m) s = m
            else if (x / m < m) e = m
            else return m
        }
        return s
    }
}

Solution1().mySqrt(4)