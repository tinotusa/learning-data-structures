// Maximum element in an array

// Implement a method that returns the maximum element in an array

func max<T: Comparable>(_ array: [T]) -> T {
    if array.isEmpty {
        fatalError("Array is empty")
    }

    var max = array.first!
    for value in array {
        if value > max {
            max = value
        }
    }

    return max

    // return array.reduce(array.first!) { first, second in
    //     if second > first {
    //         return second
    //     }
    //     return first
    // }
}

let list = [1, 2, 3, 4, 5]
let maxValue = max(list)
print("The max value in \(list) is \(maxValue)")