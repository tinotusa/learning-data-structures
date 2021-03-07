// Generic merge sort
// Write the  merge sort

// merge sort
// a recursive algorithm that halves an array, sorts the halfs recursively
// and merges them back together

// O(n log n)
func mergeSort<T: Comparable>(_ array: inout [T]) {
    // base case - the array is sorted if its of length 1
    if array.count == 1 {
        return
    }

    // halve the array
    let mid = array.count / 2
    var leftHalf = Array(array[0 ..< mid])
    var rightHalf = Array(array[mid ..< array.count])

    // recursively merge sort the two halves
    mergeSort(&leftHalf)
    mergeSort(&rightHalf)

    // join them back
    merge(leftHalf, rightHalf, into: &array)
}

func merge<T: Comparable>(_ leftHalf: [T], _ rightHalf: [T], into array: inout [T]) {
    var leftI = 0
    var rightI = 0
    var i = 0

    while leftI < leftHalf.count && rightI < rightHalf.count {
        let leftValue = leftHalf[leftI]
        let rightValue = rightHalf[rightI]

        if leftValue <= rightValue {
            array[i] = leftValue
            leftI += 1
        } else {
            array[i] = rightValue
            rightI += 1
        }

        i += 1
    }

    // move the rest of the values into the array
    while leftI < leftHalf.count {
        let value = leftHalf[leftI]
        array[i] = value
        leftI += 1
        i += 1
    }

    while rightI < rightHalf.count {
        let value = rightHalf[rightI]
        array[i] = value
        rightI += 1
        i += 1
    }
}


// tests 
func createRandomList(size count: Int, range: Range<Int>) -> [Int] {
    var array = [Int]()
    for _ in 0 ..< count {
        let randomValue = Int.random(in: range)
        array.append(randomValue)
    }
    return array
}

var list = createRandomList(size: 10, range: 0 ..< 20)
print(list)
mergeSort(&list)
print(list)
