import kotlin.math.max

class Solution {
    fun addBinary(a: String, b: String): String {
        return (a.toLong(2) + b.toLong(2)).toString(2)
    }
}

class Solution1 {
    fun addBinary(a: String, b: String): String {
        val al = a.length
        val bl = b.length
        val e = if (al > bl) al else bl

        val result = MutableList(e+1) { 0 }
        val aList = a.reversed().map { it.digitToInt() }
        val bList = b.reversed().map { it.digitToInt() }
        for (i in 0..<e) {
            val temp = result[i]
                .plus(aList.getOrNull(i) ?: 0)
                .plus(bList.getOrNull(i) ?: 0)
            if (temp >= 2) {
                result[i] = temp % 2
                result[i+1] = 1
            } else {
                result[i] = temp
            }
        }
        if (result.last() == 0) result.removeLast()
        return result.reversed().joinToString(separator = "") { it.toString() }
    }
}

class Solution2 {
    fun addBinary(a: String, b: String): String = (a.toBigInteger(2) + b.toBigInteger(2)).toString(2)
}

Solution1().addBinary("1010", "1011")