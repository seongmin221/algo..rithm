class Solution {
    fun plusOne(digits: IntArray): IntArray {
        val size = digits.size
        var result = digits
        result[size-1] ++

        fun checkIfTen(index: Int) {
            if (result[index] == 10) {
                if (index - 1 >= 0) {
                    result[index-1] ++
                    result[index] = 0
                    checkIfTen(index - 1)
                } else {
                    result[index] = 0
                    result = intArrayOf(1) + result
                }
            }
        }

        checkIfTen(size - 1)

        return result
    }
}