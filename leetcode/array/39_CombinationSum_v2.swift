//https://leetcode.com/problems/combination-sum
//39 Combination sum
class Solution {
    func combinationSum(_ A: [Int], _ t: Int) -> [[Int]] {
        var A = A.sorted()
        var r = [[Int]]()
        var stack = [(Int, Int, [Int])]() //lowIndex, sum, array
        var i=0
        for v in A{
            if v <= t {
                stack.append((i, v, [v]))
            }            
            i += 1
        }
        while stack.count > 0{
            let (loI, sum, combi) = stack.removeLast()
            if sum == t{
                r.append(combi)
            }
            for i in loI..<A.count{
                if sum+A[i] <= t{
                    stack.append((i,sum+A[i], combi+[A[i]]))
                } else {
                    break
                }
            }
        }
        return r
    }
}
