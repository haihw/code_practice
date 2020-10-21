//https://leetcode.com/problems/asteroid-collision/
//735 Asteroid collision
//Group: stack
//O(n)
class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        var r = [Int]()
        for v in asteroids{
            if v < 0{
                while let last = stack.last{
                    if last < -v{
                        stack.removeLast()
                    } else {
                        break
                    }
                }
                if let last = stack.last{
                    if last == -v {
                        stack.removeLast()
                    }      
                } else {
                    r.append(v)
                }
                
            } else {
                stack.append(v)
            }
        }
        r += stack
        return r
    }
}
