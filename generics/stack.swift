// generic stack

// implement a generic stack using an array

// a stack is a last in first out (LIFO) data structure
// it allows values to only be added to the top (end) of the stack
// and only allows values to be removed from the top (end) of the stack

// functions remember where they were called because they use a stack

struct Stack<Element>: CustomStringConvertible 
    where Element: CustomStringConvertible { // this is here so that the description computed property works

    private var values: [Element]

    init() {
        values = []
    }

    init(from array: [Element]) {
        values = []
        for element in array {
            push(element)
        }
    }

    init(from values: Element...) {
        self.init(from: values)
    }

    var count: Int {
        values.count
    }

    var isEmpty: Bool {
        values.isEmpty
    }

    func peek() -> Element {
        // it is up to the user to not peek when stack is empty
        values.last!
    }

    mutating func push(_ value: Element) {
        values.append(value)
    }

    mutating func pop() -> Element {
        // it is up to the user to not pop when stack is empty
        let lastElement = values[count - 1]
        values.remove(at: count - 1)
        return lastElement
    }

    var description: String {
        let values = self.values.map { // change them all to strings
                "\($0)"
            }
            .joined(separator: ", ") // joined only works with string elements
        return "[\(values)]"
    }
}

// create a stack of integers
var stack = Stack<Int>()

assert(stack.isEmpty)
print(stack.isEmpty)

// push values (add them to the end of the stack)
for i in 1 ... 10 {
    stack.push(i)
}

assert(stack.count == 10, "Stack should be 10")
print(stack.count)

var topItem = stack.pop()
assert(topItem == 10, "Top item should be 10")
assert(stack.count == 9, "Stack should be 9")

topItem = stack.peek()
assert(topItem == 9, "Top item should be 9")

print(stack)

var stack2 = Stack<String>(from: "one", "two", "Three")
print(stack2)
var stack3 = Stack<Int>(from: [1, 2, 3, 4])
print(stack3)