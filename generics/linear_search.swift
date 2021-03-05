// Generic linear search

// Implement a generic method for linear search

// linear search is as the name suggests,
// it will look at every element in a list and return whether or not
// the key was found

func linearSearch<T: Comparable>(for key: T, in array: [T]) -> Bool {
    for value in array {
        if value == key {
            return true
        }
    }
    return false
}

let values = [1, 2, 3, 4]
if linearSearch(for: 2, in: values) {
    print("The value was found")
} else {
    print("The value wasn't found")
}