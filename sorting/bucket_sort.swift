// bucket sort

// O(n^2)
func bucketSort(_ array: [Int]) -> [Int] {
    var buckets = [[Int]?](repeating: nil, count: array.count)

    for value in array {
        if buckets[value] == nil {
            buckets[value] = [Int]()
        }
        buckets[value]?.append(value)
    }

    var sortedArray = [Int]()
    for bucket in buckets {
        if bucket == nil {
            continue
        }
        for value in bucket! {
            sortedArray.append(value)
        }
    }

    return sortedArray
}

func generateRandomArray(size: Int) -> [Int] {
    var result = [Int]()
    for _ in 0 ..< size {
        result.append(Int.random(in: 0 ... 100_000))
    }
    return result
}
var array = generateRandomArray(size: 1_000_000)
// print(array[0 ... 100])
let sortedArray = bucketSort(array)
print(sortedArray[0 ... 10_000])