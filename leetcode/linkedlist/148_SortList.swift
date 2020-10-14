//https://leetcode.com/problems/sort-list/
//148. Sort List
//Space O(1) time O(nlogn)
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
    func split(_ head: ListNode?) -> (ListNode?, ListNode?){
        if (head == nil){
            return (nil, nil)
        }
        var fast = head?.next
        var right = head
        var tail = head
        while fast != nil{
            tail = right
            right = right?.next
            fast = fast?.next?.next
        }
        tail?.next = nil
        return (head,right)
    }
    func mergeSortedLists(_ a: ListNode?, _ b: ListNode?) -> ListNode?{
        var dummyHead = ListNode(0)
        var node = dummyHead
        //travel
        var nexta = a
        var nextb = b
        while let a = nexta, let b = nextb{
            if  b.val < a.val{
                node.next = b
                nextb = b.next
            } else {
                node.next = a
                nexta = a.next
            }
            node = node.next!
        }
        if nexta != nil {
            node.next = nexta
        } 
        if nextb != nil {
            node.next = nextb
        }
        return dummyHead.next
    }
//     func printlist (_ head: ListNode?){
//         var a = [Int]()
//         var node = head
//         while node != nil{

//             a.append(node!.val)

//             node = node!.next
//         }
//         print (a)
//     }
    func sortList(_ head: ListNode?) -> ListNode? {
        if (head?.next == nil){
            return head
        }
        var (a, b) = split(head)
        return mergeSortedLists(sortList(a),sortList(b))
    }
}
