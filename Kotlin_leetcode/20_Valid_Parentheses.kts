import java.util.ArrayDeque

class Solution {
    fun isValid(s: String): Boolean {
        var nextExpected = emptyList<String>()
        for (c in s) {
            val par = c.toString()
            when (par) {
                "(" -> nextExpected = listOf(")") + nextExpected
                "{" -> nextExpected = listOf("}") + nextExpected
                "[" -> nextExpected = listOf("]") + nextExpected
                ")", "}", "]" -> {
                    if (nextExpected.first() == par) {
                        nextExpected = nextExpected.takeLast(nextExpected.size - 1)
                    } else {
                        return false
                    }
                }
            }
        }
        return nextExpected.isEmpty()
    }
}

class Solution1 {
    fun isValid(s: String): Boolean {
        val deque = ArrayDeque<Char>()
        for (c in s) {
            when (c) {
                '(' -> deque.add(')')
                '{' -> deque.add('}')
                '[' -> deque.add(']')
                ')', '}', ']' -> {
                    if (deque.removeFirstOrNull() != c) {
                        return false
                    }
                }
            }
        }
        return deque.isEmpty()
    }
}

Solution().isValid("()[]{}")