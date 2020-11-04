//207 Course Schedule
//https://leetcode.com/problems/course-schedule/
//Group: Graph
//Keywords: Topological
//Node: may not optimized
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var childs = Array(repeating: Set<Int>(), count: numCourses)
        var parents = Array(repeating: Set<Int>(), count: numCourses)
        for p in prerequisites{
            childs[p[0]].insert(p[1])
            parents[p[1]].insert(p[0])
        }
        var courses = Set<Int>()
        for v in 0..<numCourses{
            courses.insert(v)
        }
        while !courses.isEmpty{
            // print(courses)
            var leaves = [Int]()
            for c in courses{
                if childs[c].count == 0{
                    leaves.append(c)
                }
            }
            if leaves.count == 0 {
                    return false
            }
            //update graph
            for c in leaves{
                // print("remove \(c)")
                courses.remove(c)
                for p in parents[c]{
                    childs[p].remove(c)
                }
            }
        }
        return true
    }
}
