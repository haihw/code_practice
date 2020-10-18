//https://leetcode.com/problems/repeated-dna-sequences/
//187 Repeated DNA sequences
class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        var h = Set<String>()
        var r = Set<String>()
        var ss = ""
        for c in s{
            ss.append(String(c))
            if ss.length > 10 {
                ss.remove(at: ss.startIndex)
            }
            if h.contains(ss){
                r.insert(ss)
            } else {
                h.insert(ss)    
            }
        }
        return Array(r)
    }
}
