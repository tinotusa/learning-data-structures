// Generic quick sort
// Write methods using quick sort. 

// quicksort
// selects a pivot
// sorts the list such that the elements in the left side are less than the partition
// and the elements in the right side are greater than the partition
// recursively calls quick sort on the two halves

// O(n log n)
func quickSort(_ array: inout [Int]) {
    quickSort(&array, first: 0, last: array.count - 1)
}

func quickSort(_ array: inout [Int], first: Int, last: Int) {
    if last < first {
        return
    }
    let pivotIndex = partition(&array, first: first, last: last)
    // left side
    quickSort(&array, first: first, last: pivotIndex - 1)
    // right side
    quickSort(&array, first: pivotIndex + 1, last: last)
}

// partitions the array and returns the index of the pivot
func partition(_ array: inout [Int], first: Int, last: Int) -> Int {
    let pivot = array[first]
    var low = first + 1
    var high = last

    while high > low {
        // look for the value greater than the pivot
        while low <= high && array[low] <= pivot {
            low += 1
        }
        // look for the value less than the pivot
        while low <= high && array[high] > pivot {
            high -= 1
        }
        // swap the two values
        if high > low {
            array.swapAt(low, high)
        }
    }
    // find correct place for pivot
    while high > first && array[high] >= pivot {
        high -= 1
    }
    if array[high] < pivot {
        array.swapAt(high, first)
        return high
    }
    return first
}

var list = [4, 3, 5, 8, 1, 7]
print("Before sort: \(list)")
quickSort(&list)
print("After sort: \(list)")