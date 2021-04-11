// radix sort
// O(n * l) where l is the length of an array
func radixSort(_ array: [Int]) -> [Int] {
    var buckets = [[Int]](repeating: [Int](), count: 10)
    let maxRadix = digitsIn(longestDigit(in: array))

    var array = array
    for radixIndex in 0 ..< maxRadix {
        for value in array {
            let position = digitAt(index: radixIndex, from: value)
            buckets[position].append(value)
        }
        array = []
        for bucket in buckets {
            if bucket.isEmpty {
                continue
            }
            for value in bucket {
                array.append(value)
            }
        }
        buckets = [[Int]](repeating: [Int](), count: 10)
    }

    return array
}

func longestDigit(in array: [Int]) -> Int {
    array.reduce(0) { max, second in
        if max > second { return max }
        return second
    }
}

func digitsIn(_ value: Int) -> Int {
    var value = value

    var count = 0
    while value > 0 {
        count += 1
        value /= 10
    }

    return count
}

func digitAt(index: Int, from value: Int) -> Int {
    var base = 1
    for _ in 0 ..< index {
        base *= 10
    }
    return (value / base) % 10
}

func generateRandomArray(size: Int) -> [Int] {
    var result = [Int]()
    for _ in 0 ..< size {
        result.append(Int.random(in: 0 ... 100_000))
    }
    return result
}

// testing the code
let largeArray = generateRandomArray(size: 1_000)
// print(largeArray)
let sortedArray = radixSort(largeArray)
print("sorted: \(sortedArray)")