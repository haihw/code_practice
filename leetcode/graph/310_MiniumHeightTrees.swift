//https://leetcode.com/problems/minimum-height-trees/
//310 Minium Height Tree
//Group: Graph
//Solution available: https://leetcode.com/problems/minimum-height-trees/solution/
class Solution {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var child = Array(repeating:Set<Int>(), count: n)
        for e in edges{
            child[e[0]].insert(e[1])
            child[e[1]].insert(e[0])
        }
        var nodes = Set<Int>()
        for i in 0..<n{
            nodes.insert(i)
        }
        while nodes.count > 2{
            var toremoves = [Int]()
            for u in nodes{
                //remove all leaves (node with one neighbour only)
                if child[u].count == 1{
                    toremoves.append(u)
                }                
            }
            for u in toremoves {
                //Update graph after remove leave
                let v = child[u].first!
                child[v].remove(u)
                nodes.remove(u)                    
            }
        }
        return Array(nodes)
    }
}
