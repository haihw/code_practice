//https://leetcode.com/problems/house-robber/
// Group: DP
// f(i) = max (f(i-1), f(i-2) + a[i])
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var r2 = 0
        var r1 = 0
        var r = 0
        for v in nums{
            r = max (r1, r2+v)
            r2 = r1
            r1 = r
        }
        return r
    }
}
