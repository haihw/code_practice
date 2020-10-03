//https://leetcode.com/problems/combination-sum/
//39 Combination Sum
//First complicated and not optimized solution using hash map
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var r = [[Int]]()
        //2 3 4 -> 8
        // 2     > 2 2 2 2
        // 2, 3  > 2 2 2 2, 2 3 3
        // 2,3,4 > 2 2 2 2, 2 3 3, 2 2 4, 4 4
        
        if candidates.count == 0{
            return r
        }
        var savedDict = [Int: [[Int]]]() // key: sum which < target, value: all combination that make sum = key
        var i = 0
        while i<candidates.count {
            var dict = savedDict// to save (target, result) in array 0...i. Init by previous dict
            let v = candidates[i]
            var combi = [v]
            var sum = v
            while sum <= target{
                // print ("v combi: \(combi), sum: \(sum)")
                if sum == target {
                    //save it
                    r.append(combi)
                    break
                } else {
                    //save the sum to the new dict
                    if dict[sum] != nil{ 
                        dict[sum]!.append(combi)
                    } else {
                        dict[sum] = [combi]
                    }
                    //get the stored of target - sum and add new record


                    for existSum in Array(savedDict.keys) { //check in previous dict
                        let newSum = sum+existSum
                        if newSum <= target{
                            //save it
                            var oldCombies = savedDict[existSum]!
                            for oldCombi in oldCombies{
                                let newCombi = oldCombi + combi
                                if newSum == target{
                                    let newCombi = oldCombi + combi
                                    r.append (newCombi)
                                } else {
                                    if dict[newSum] != nil { // save to the new dict
                                        dict[newSum]!.append(newCombi)
                                    } else {
                                        dict[newSum] = [newCombi]
                                    }
                                }
                            }
                        } 
                    }
                }

                // print ("Dict: \(dict)")
                // print ("Result: \(r)")
                combi.append(v)
                sum += v
            }
            savedDict = dict //preserve the dict
            i+=1
        }            
        return r
    }
}
