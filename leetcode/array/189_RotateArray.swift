//https://leetcode.com/problems/rotate-array/
//189 Rotate Array
class Solution {
    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int){
        let middle = (end-start)/2 + start
        for i in start..<middle {
            let j = end-(i-start)-1
            let t = nums[i]
            nums[i] = nums[j]
            nums[j] = t
        }
        
    }
    func rotate(_ nums: inout [Int], _ k: Int) {
        //space O(1)
        //In : 1 2 3 4 5 6 7
        //k  : 3
        //Out: 5 6 7 1 2 3 4
        
        // 1 2 3 4 5 6 7
        //revert:          7 6 5 4 3 2 1
        //revert first k : 5 6 7 4 3 2 1
        //revert last n-k: 5 6 7 1 2 3 4
        let n = nums.count
        reverse(&nums, 0, n)
        reverse(&nums, 0, k%n)
        reverse(&nums, k%n, n)
    }
}
