// Shuffle array

// Write a generic method that shuffles an array

func shuffle<T>(_ array: inout [T]) {
    for i in 0 ..< array.count {
        let randIndex = Int.random(in: 0 ..< array.count)
        array.swapAt(i, randIndex)
    }
}

var list = [1, 2, 3, 4, 5]
print(list)
shuffle(&list)
print(list)