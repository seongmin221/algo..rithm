class Solution {
    fun removeDuplicates(nums: IntArray): Int {
        var result = 1
        var s = 0
        var e = 0
        while (e < nums.size) {
            if (nums[s] == nums[e]) {
                e ++
            } else if (nums[s] < nums[e]) {
                nums[result] = nums[e]
                result ++
                s = e
            }
        }

        return result
    }
}