class Solution {
    fun removeElement(nums: IntArray, `val`: Int): Int {
        var result = 0
        var s = 0
        var e = nums.size - 1

        while (s <= e) {
            if (nums[e] == `val`) {
                nums[e] = -1
                e--
            } else if (nums[s] == `val`) {
                nums[s] = nums[e]
                nums[e] = -1
                e--
            } else {
                result++
                s++
            }
        }
        return result
    }
}