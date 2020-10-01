//https://leetcode.com/problems/first-missing-positive
//Group: Hash
//sub-group: Use negative to mark value instead of hashmap, O(1)
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        //time O(N) space O(1)
        //Max value can be consider as valid is N //[1,2,3,4]
        var a = nums
        var i = 0
        //remove non positive value by setting it to N + 1.
        while i < a.count{
            if a[i] <= 0 {
                a[i] = a.count + 1
            }
            i += 1
        }
        // print (a)
        // mark negative value on index a[i]-1 if a[i] in range
        i = 0
        while i < a.count{
            let v = abs(a[i])-1
            if (v < a.count){
                a[v] = -abs(a[v])
            }
            i += 1
        }
        // print (a)            
        i = 0
        while i < a.count && a[i] <= 0{
            i += 1
        }
        return i+1
    }
}
