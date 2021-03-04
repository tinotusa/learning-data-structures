// Print the characters in a string reversely

// write a recursive method that displays a string reversely on the console
// e.g.: reverseDisplay("abcd") displays dcba

// recurse solution
func reverseDisplay(_ text: String) {
    reverseDisplay(text, start: 0)
}

func reverseDisplay(_ text: String, start: Int) {
    if start == text.count {
        return
    }
    let index = text.index(text.endIndex, offsetBy: -(start + 1))
    let letter = text[index]
    print("\(letter)", terminator: "")
    reverseDisplay(text, start: start + 1)
}

// iterative solution
func reverseDisplayIter(_ text: String) {
    for i in 1 ... text.count {
        let index = text.index(text.endIndex, offsetBy: -i)
        print("\(text[index])", terminator: "")
    }
}

// tests
let text = "Hello, World!"
print("\(text) ", terminator: "")
reverseDisplay(text)
print("\n")

print("\(text) ", terminator: "")
reverseDisplayIter(text)
print()