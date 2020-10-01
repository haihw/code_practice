//https://leetcode.com/problems/first-missing-positive/
//Group: array
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var s = Set<Int>()
        for v in nums{
            s.insert(v)
        }
        var r = 1
        while s.contains(r){
            r += 1
        }
        return r
    }
}
