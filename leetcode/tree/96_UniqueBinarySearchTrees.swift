//https://leetcode.com/problems/unique-binary-search-trees/
class Solution {
    
    func numTrees(_ n: Int) -> Int {
        var f = Array(repeating: 0, count: n+1)
        f[0] = 1
        for m in 1...n{
            // print (f)
            var count = 0
            for i in 1...m{
                var leftCount = f[i-1]
                var rightCount = f[m-i]
                count += leftCount * rightCount
            }
            f[m] = count
        }
        return f[n]
    }
}
