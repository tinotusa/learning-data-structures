func twoSum(_ array: [Int], target: Int) -> [Int] {
    var dict = [Int: Int]()

    for (i, value) in array.enumerated() {
        let difference = target - value
        if let index = dict[difference] {
            return [index, i]
        }
        dict[value] = i
    }

    return []
}

print(twoSum([2, 7, 11, 15], target: 9))
