//https://leetcode.com/problems/house-robber-ii/  
class Solution {
    func normalRob(_ nums: [Int], _ start: Int, _ end: Int) -> Int{
        var r2 = 0
        var r1 = 0
        var r = 0
        for i in start...end{
            r = r1 < r2+nums[i] ? r2+nums[i] : r1
            r2 = r1
            r1 = r
        }
        return r
    }
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1{
            return nums[0]
        }
        var f1 = normalRob(nums, 0, nums.count - 2)
        var f2 = normalRob(nums, 1, nums.count - 1)
        return f1 < f2 ? f2: f1
    }
}
