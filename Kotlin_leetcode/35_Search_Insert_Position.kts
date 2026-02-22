class Solution {
    fun searchInsert(nums: IntArray, target: Int): Int {
        var s = 0
        var e = nums.size - 1

        if (target < nums[s]) return 0
        if (nums[e] < target) return e + 1

        while (s+1 < e) {
            val m = (s + e)/2
            print("$s $m $e \n")

            when (target) {
                in nums[s]..nums[m] -> e = m
                in nums[m]+1..nums[e] -> s = m
            }
        }
        print("$s $e \n")

        return if (target == nums[s]) {
            s
        } else if (target == nums[e]) {
            e
        } else {
            s+1
        }
    }
}