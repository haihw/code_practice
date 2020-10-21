//https://leetcode.com/problems/clone-graph/
//133 Clone Graph
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func helper(_ head: Node, _ dict: inout [Int: Node]) -> Node? {
        var cloned = Node(head.val)
        dict[head.val] = cloned
        cloned.neighbors = [Node?]()
        for nb in head.neighbors{
            if let node = nb {
                if dict[node.val] == nil {
                    cloned.neighbors.append(helper(node, &dict))  
                } else {
                    cloned.neighbors.append(dict[node.val])  
                }
            }   
        }
        return cloned
    }
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        var dictionary = [Int: Node]()
        return helper(node, &dictionary)
    }
}
