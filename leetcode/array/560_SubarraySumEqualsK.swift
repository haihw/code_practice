//https://leetcode.com/problems/subarray-sum-equals-k/
//560. Subarray Sum Equals K
//Group: Hash
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        // O(n), space O(n)
        var count = 0
        let n = nums.count
        var dict = Dictionary<Int, Int>() // key is sum, value is number of occurance 
        // dict[0] = 1
        var sum = 0

        for i in 0..<n {
            sum += nums[i]
            if (sum == k){
                count += 1
            }
            //sum != k, then need to find the result for array 0..i-1, which sum = currentSum - k, So it can combine with nums[i] to meet requirement
            if let countSumLess = dict[sum-k]{
                count += countSumLess
            }
            if let countSum = dict[sum]{
                dict[sum] = countSum + 1
            } else{
                dict[sum] = 1
            } 
            // print (dict)
            // print ("sum: \(sum) count:\(count)")
            
        }
        return count
    }
}
