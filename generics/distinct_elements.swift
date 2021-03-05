// Distinct elements in array

// Write method that returns a new array
// The new list contains the non-duplicate elements from the original list

func removeDuplicates<T>(from array: [T]) -> [T] 
    where T: Equatable
{
    var newList = [T]()
    for value in array {
        if !newList.contains(value) {
            newList.append(value)
        }
    }
    return newList
}

// solution 2
// this wouldn't preserve the order of the original array (sets have no order)
func removeDuplicates2<T>(from array: [T]) -> [T]
    where T: Equatable & Hashable
{
    let newList = Set<T>(array)
    return Array(newList)
}

// tests

let list = [1, 2, 2, 3, 4, 5]

let newList = removeDuplicates(from: list)
print(newList)

let newList2 = removeDuplicates2(from: list)
print(newList2)