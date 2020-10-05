//https://leetcode.com/problems/remove-covered-intervals/
//Group: interval

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        //Best O(n log n)
        //[[1,4],[1,2],[3,6],[2,3],[2,5]]
        var intervals = intervals
        intervals.sort(by: { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] })
        
        var total = 0
        var right = 0
        //print (intervals)
        //[[1, 4], [1, 2], [2, 5], [2, 3], [3, 6]]
        for v in intervals{
            if v[1] > right {
                right = v[1]
                total += 1
            }
        }
        return total
        
    }
}
// class Solution {
//     func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
//         //O(nlogn) space: O(n) or O(1) reused intervals
//         var a = intervals.sorted(by:{$0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0]})
//         var count = 1
//         var le = a[0][0] //left
//         var ri = a[0][1] //right
//         var i = 1
//         //after sorted, new interval after [1,4]
//         // 1. in: [1,3] -> ignore
//         // 2. in: [2,3] -> ignore
//         // 3. out:[1,5] -> cover the existing: don't count, update to right only -> [1,5]
//         // 4. out:[2,5] -> shifted: count and update [left,right] -> [2,5]
//         // 5. out:[5,6] -> shifted: count and update [left, right] -> [5,6]
        
//         while i < a.count{
//             if a[i][0] > le && ri < a[i][1]{ //4, 5
//                 le = a[i][0]
//                 count += 1
//             }
//             if ri < a[i][1] { //3,4,5
//                 ri = a[i][1]
//             } 
//             i+=1
//         }
        
//         return count
//     }
// }
