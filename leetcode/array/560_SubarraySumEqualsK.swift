//https://leetcode.com/problems/k-diff-pairs-in-an-array/
//Group: hash map

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        //O(n)
        var map = [Int : Int]()
        for v in nums{
            if map[v] != nil{
                map[v] = map[v]! + 1
            } else {
                map[v] = 1
            }
        }
        var count = 0
        for (key, value) in map{
            if k>0 {
                if map[key-k] != nil{
                    count += 1
                }
            } else {//k==0
                if value > 1{
                    count += 1 
                }
            }
        }
        return count
    }
    
}

class Solution2 {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        //O(nlogn)
        var a = nums.sorted()
        var lo = 0
        var i = 1
        var s = Set<Int>()
        while i<a.count{
            while a[i] - a[lo] > k && lo < i-1{
                lo += 1
            }

            if a[i] - a[lo] == k && !s.contains(a[i]){
                s.insert(a[i])
            }
            i+=1
        }
        return s.count
    }
}
