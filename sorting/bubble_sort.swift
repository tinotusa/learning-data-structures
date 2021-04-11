// Generic bubble sort
// Write the following two generic methods using bubble sort

// bubble sort
// iterates through a list, comparing neighbour elements and swaping if
// needed ultil no swaps are made

// [1, 2, 3]

// O(n^2)
func bubbleSort<T: Comparable>(_ array: inout [T]) {
    var madeSwap = true

    // have to make at least one pass to determine that it is sorted
    repeat {
        madeSwap = false
        for i in 0 ..< array.count - 1 {
            if array[i] > array[i + 1] {
                madeSwap = true
                array.swapAt(i, i + 1)
            }
        }
    } while madeSwap
}

// tests
var list = [1, 3, 4, 1, -2, 5, 98]
print(list)
bubbleSort(&list)
print(list)
