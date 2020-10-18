//https://leetcode.com/problems/spiral-matrix
//54 Spiral Matrix

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var r = [Int]()
        guard let firstRow = matrix.first else{
            return r
        }
        var m = matrix.count
        var n = firstRow.count

        if n == 0{
            return r
        }
        var lx = -1
        var ly = -1
        var hx = n
        var hy = m
        var dx = [1,0,-1,0] // E, S, W, N
        var dy = [0,1,0,-1] // E, S, W, N
        var x = -1 //collum
        var y = 0 //row
        var d = 0 //direction: start with East
        while lx != hx && ly != hy{
            var nx = x + dx[d]
            var ny = y + dy[d]
            if nx == hx {
                ly += 1
                d = (d+1)%4
                continue
            }
            if nx == lx {
                hy -= 1
                d = (d+1)%4
                continue
            }
            if ny == hy {
                hx -= 1
                d = (d+1)%4
                continue
            }
            if ny == ly {
                lx += 1
                d = (d+1)%4
                continue
            }
            x = nx
            y = ny
            // print ("->\(matrix[y][x])")
            r.append(matrix[y][x])
        }
        return r
    }
}
