// Print the digits in an integer reversely

// Write a recursive method that displays an int value reversely on the console
// using the following header:
// e.g, reverseDisplay(12345) displays 54321. 

func reverseDisplay(value: Int) {
    if value <= 0 {
        return
    }
    let lastDigit = value % 10
    print("\(lastDigit)", terminator: "")
    reverseDisplay(value: value / 10)
}
let value = 21
print("\(value) in reverse is ", terminator: "")
reverseDisplay(value: value)
print()