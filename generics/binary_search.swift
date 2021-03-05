// Generic binary search

// Implement a generic binary search method

func binarySearch<T: Comparable>(for key: T, in array: [T]) -> Int? {
    var low = 0
    var high = array.count - 1

    while low < high {
        let mid = (low + high) / 2
        let midValue = array[mid]

        if midValue == key {
            return mid
        } else if key > midValue {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    return nil // key not found
}

let key = 3
let list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

if let index = binarySearch(for: key, in: list) {
    print("The key (\(key)) was found at index \(index)")
} else {
    print("The key wasn't found")
}