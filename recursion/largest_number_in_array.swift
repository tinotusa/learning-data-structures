// Find the largest number in an array

// Write a recursive method that returns the
// largest integer in an array

// recursive solution
func largest(in array: [Int]) -> Int? {
    if array.isEmpty { return nil}
    if array.count == 1 {
        return array.first!
    }
    return largest(in: array, max: array.first!, start: 0)
}

func largest(in array: [Int], max: Int, start: Int) -> Int? {
    if start == array.count {
        return max
    }
    if array[start] > max {
        return largest(in: array, max: array[start], start: start + 1)
    }
    return largest(in: array, max: max, start: start + 1)
}

// iterative solution
func largestIter(in array: [Int]) -> Int? {
    if array.isEmpty { return nil }
    var max = array.first!
    for value in array {
        if value > max {
            max = value
        }
    }
    return max
}

if let largest = largest(in: [1, 2, 55, 4]) {
    print("largest: \(largest)")
}

if let largest = largestIter(in: [1, 2, 55, 4]) {
    print("largest: \(largest)")
}