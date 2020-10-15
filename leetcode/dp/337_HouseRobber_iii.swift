//https://leetcode.com/problems/house-robber-iii/
//337 House Robber 3
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
    func helper(_ root: TreeNode?) -> (rob: Int, notRob: Int){
        guard let root = root else {
            return (0,0)
        }
        var (leftRob, leftNotRob) = helper(root.left)
        var (rightRob, rightNotRob) = helper(root.right)
        var rob = root.val + leftNotRob + rightNotRob
        var notRob = max (leftRob, leftNotRob) + max (rightRob, rightNotRob)
        return (rob, notRob)
    }
    func rob(_ root: TreeNode?) -> Int {
        var (rob, notRob) = helper(root)
        return max (rob, notRob)
    }
}
// class Solution {
//     func helper(_ root: TreeNode?, _ canRobRoot: Bool) -> Int{
//         //helper (root.left, true) and helper (root.right, true) will be call twice everytime
//         guard let root = root else {
//             return 0
//         }
//         if canRobRoot {
//             return max (helper(root.left, false) + helper(root.right, false) + root.val,
//                         helper(root.left, true)  + helper(root.right, true))
//         } else {
//             return helper(root.left, true) + helper(root.right, true)
//         }
//     }
//     func rob(_ root: TreeNode?) -> Int {
//         return helper (root, true)
//     }
// }
