//https://leetcode.com/problems/subarray-product-less-than-k/
//Group: Array
class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        //F[i] is result of array 0..<i
        //F(i) = F(i-1) + (i-j+1) with j is smallest nums[j] ..*nums[i] < k
        //F(0) = 0
        //pij = nums[i] *..* nums[j]
        var f = 0
        var j = 0
        var pij = 1
        for i in 0..<nums.count{
            var v = nums[i]
            pij *= v
            //get j
            while pij >= k && j <= i{
                pij /= nums[j]
                j += 1

            }
            f += i-(j-1)
            // print ("\(i) - \(j) - \(f)")
        }
        return f
    }
}
