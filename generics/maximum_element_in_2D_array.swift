// Maximum element in a two-dimensional array

// Write a generic method that returns the maximum element in a two-dimensional array

func max<T: Comparable>(_ list: [[T]]) -> T {
    if list.isEmpty {
        fatalError("Array is empty")
    }
    var max = list[0][0]
    for array in list {
        for value in array {
            if value > max {
                max = value
            }
        }
    }
    return max
}

let list = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10]
]

let maxValue = max(list)
print("The max value in \(list) is \(maxValue)")