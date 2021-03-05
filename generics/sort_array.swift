// Sort array

// Write a generic method that sorts an array

func sort<T: Comparable>(_ array: inout [T]) {
    // using selection sort
    // for i in 0 ..< array.count {
    //     var minValue = array[i]
    //     var minIndex = i
    //     // find smallest value in remaining array
    //     for j in i ..< array.count {
    //         let minJ = array[j]
    //         if minJ < minValue {
    //             minValue = minJ
    //             minIndex = j
    //         }
    //     }
    //     // swap
    //     array.swapAt(i, minIndex)
    // }
    
    // using mergeSort
    mergeSort(&array)
}

func mergeSort<T: Comparable>(_ array: inout [T]) {
    if array.count == 1 {
        return
    }

    // half the list in two
    let mid = array.count / 2
    var left = Array(array[0 ..< mid])
    var right = Array(array[mid ..< array.count])

    mergeSort(&left)
    mergeSort(&right)
    merge(left, right, into: &array)
}

func merge<T: Comparable>(_ left: [T], _ right: [T], into array: inout [T]) {
    var leftI = 0
    var rightI = 0
    var i = 0
    while (leftI < left.count) && (rightI < right.count) {
        if left[leftI] <= right[rightI] {
            array[i] = left[leftI]
            leftI += 1
        } else {
            array[i] = right[rightI]
            rightI += 1
        }
        i += 1
    }

    // since the tests are used above, one of them will fail
    // and only one of these should happen
    while leftI < left.count {
        array[i] = left[leftI]
        leftI += 1
        i += 1
    }
    while rightI < right.count {
        array[i] = right[rightI]
        rightI += 1
        i += 1
    }
}

var list = [2, 3, 1, 9, 34, 234, -2, 34]
print(list)
sort(&list)
print(list)