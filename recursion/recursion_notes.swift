// recursion

// recursion is a technique used to solve problems that are difficult to
// program using simple loops

// a recursive method is a method that calls its self (directly or indirectly)
// all recursive methods must a have a base case (to know when to stop)
// infinite recursion can occur if no base case is specified

// many math functions are defined using recursion
// e.g factorials
// factorial of a number n can be defined like so:
// 0! = 1
// n! = n * (n - 1)!; n > 0
// finding n! is reduced to finding (n - 1)!. 
// when computing (n - 1)!, you can apply the same idea recursively until n is
// reduced to 0.
// the function knows how to solve the simplest case, known as the base case or
// the stopping case

// all recursive methods have the following characteristics:

// the method is implemented using an if-else or switch statements that leads
// to different cases.

// one or more base cases (the simplest case) are used to stop the recursion

// every recursive call reduces the original problem, brining it increasingly
// closer to a base case until it becomes that case.

var calls = 0
func factorial(_ n: Int) -> Int {
    calls += 1 // just to see
    // base case
    if n == 0 {
        return 1
    }
    return n * factorial(n - 1)
}
// note: it is more efficient to compute factorial using loops
// recursion was used to teach a concept

let value = 10
let result = factorial(value)
print("The factorial of \(value) is \(result)")
print("The call of factorial(\(value)) calls itself \(calls) times")

func isPalindrome(_ word: String) -> Bool {
    if word.count <= 1 {
        return true
    } else if word.first! != word.last! {
        return false
    }
    let start = word.index(after: word.startIndex)
    let end = word.index(before: word.endIndex)

    return isPalindrome(String(word[start ..< end]))
}

let word = "abcdxdcba"
print("is \(word) a palindrome? \(isPalindrome(word))")

// recursive helper methods
// a common technique in recursive programming to define a second method that
// receives additional parameters

func isPalindrome2(_ word: String) -> Bool {
    return isPalindrome2(word, start: 0, end: word.count - 1)
}

func isPalindrome2(_ word: String, start: Int, end: Int) -> Bool {
    if end <= start {
        return false
    }
    let firstIndex = word.index(word.startIndex, offsetBy: start)
    let lastIndex = word.index(word.endIndex, offsetBy: -end)
    print(firstIndex)
    print(lastIndex)
    let firstChar = word[firstIndex]
    let lastChar = word[lastIndex]

    if firstChar != lastChar {
        return false
    }
    return isPalindrome2(word, start: start + 1, end: end - 1)
}

print("is \(word) a palindrome? \(isPalindrome2(word))")

// selection sort with recursion
func selectionSort(_ list: inout [Int]) {
    selectionSort(&list, start: 0)
}
// helper function
func selectionSort(_ list: inout [Int], start: Int) {
    if start >= list.count {
        return
    }
    var minValue = list[start]
    var minIndex = start
    for i in start + 1 ..< list.count {
        if list[i] < minValue {
            minValue = list[i]
            minIndex = i
        }
    }
    list[minIndex] = list[start]
    list[start] = minValue
    selectionSort(&list, start: start + 1)
}

var list = [5, 4, 3, 2, 1]
selectionSort(&list)
print(list)

// recursive binary search
func binarySearch(for key: Int, in array: [Int]) -> Int? {
    binarySearch(for: key, in: array, low: 0, high: array.count - 1)
}

// helper function
func binarySearch(for key: Int, in array: [Int], low: Int, high: Int) -> Int? {
    if low > high { return nil }
    let mid = (high + low) / 2
    let midValue = array[mid]

    if midValue == key {
        return mid
    } else if midValue > key {
        return binarySearch(for: key, in: array, low: low, high: mid - 1)
    } else {
        return binarySearch(for: key, in: array, low: mid + 1, high: high)
    }
}

list = [1, 2, 3, 4, 5]
if let index = binarySearch(for: 4, in: list) {
    print("Found at index: \(index)")
} else {
    print("Not found")
}
// recursion vs iteration
// recursion has more overhead (it has to create allocate memory for the function)
// this takes time and memory
// any proplem that can be solved recursively can be solved non recursively with iterations

// why use recursion
// in some cases, recursion enables you to specify a clear, simple solution for
// an inherently recursive problem that would otherwise be difficult to obtain