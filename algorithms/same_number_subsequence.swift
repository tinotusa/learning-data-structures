// Same-number subsequence

// Write an O(n) program that gets a sequence of integers 
// and finds the longest subsequence with the same number.

// e.g.
// input: 2 4 4 8 8 8 8 2 4 4 0
// output: The longest same number sequence starts at index 3 with 4 values of 8

// O(n)
func longestSubsequence(in array: [Int]) -> (index: Int, count: Int, value: Int) {
    var result = (index: 0, count: 0, value: array[0])

    var tempCount = 0

    // runs n - 1 times
    for i in 0 ..< array.count - 1 {
        let currentValue = array[i]
        // some constant time
        if currentValue == array[i + 1] {
            tempCount += 1
        } else {
            tempCount += 1
            if tempCount > result.count {
                result.value = currentValue
                result.count = tempCount
                result.index = i
            }
            tempCount = 0
        }
    }
    result.index = result.index - result.count + 1
    return result
}

let array = [2, 4, 4, 8, 8, 8, 8, 2, 4, 4]
var (index, count, value) = longestSubsequence(in: array)
print("The longest same number sequence starts at index \(index) with \(count) values of \(value)")

import Foundation

var now = Date()
for _ in 0 ..< 1_000_000 {
    print("hello")
}
var later = Date()

var difference = later.timeIntervalSince(now)
print(difference)