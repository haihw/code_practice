//https://leetcode.com/problems/unique-binary-search-trees-ii/
//
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func generateTreesWithPad(_ n: Int, _ pad: Int) -> [TreeNode?] {
        var out = [TreeNode?]()
        if n == 0{
            return [nil]
        }
        for i in 1...n{
            var left = generateTreesWithPad (i-1, pad)
            var right = generateTreesWithPad (n-i, i+pad)
            for leftNode in left{
                for rightNode in right{
                    out.append(TreeNode(i+pad, leftNode, rightNode))        
                }
            }

        }
        return out
    }
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0{
            return []
        }
        return generateTreesWithPad (n, 0)   
    }
}
