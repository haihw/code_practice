//https://leetcode.com/problems/rotate-list/
//61 Rotate List
//Group: Linked List
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard var head = head else {
            return nil
        }
        //1. make it circle
        var n = 0
        var node = head
        while node.next != nil {
            node = node.next!
            n += 1
        }
        n += 1
        var tail = node
        tail.next = head

        //2. find new head and cut the tail
        node = head
        var i = 0
        var ki = n - k%n
        // print (ki)
        while (i < ki-1){
            i += 1
            node = node.next!
        }
        var newHead = node.next
        node.next = nil
        return newHead
    }
}
