//https://leetcode.com/problems/search-a-2d-matrix/
//74 Search a 2D matrix
//Group: Binary search
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        guard let firstRow = matrix.first else {
            return false
        }
        let n = firstRow.count
        if n == 0 {
            return false
        }
        var le = 0
        var ri = m*n-1
        while le+1 < ri {
            let mi = (le + ri) / 2
            if (matrix[mi/n][mi%n] > target){
                ri = mi
            } else{
                le = mi
            }
        }
        return matrix[le/n][le%n] == target || matrix[ri/n][ri%n] == target
    }
}
