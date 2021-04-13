
var stack = Stack<String>()
stack.push("one")
stack.push("two")
stack.push("three")
stack.push("four")

print(stack)

if stack.contains("two") {
    print("stack contains the value")
} else {
    print("stack doesn't contain the value")
}

while !stack.isEmpty {
    print("\(stack.pop()) ", terminator: "")
}
print()

// stack.peek() // error empty
// stack.pop() // error empty

import Foundation

func isPrime(_ value: Int) -> Bool {
    if value < 2 { return false }
    for i in stride(from: 2, to: Int(sqrt(Double(value))) + 1, by: 1) {
        if value % i == 0 {
            return false
        }
    }
    return true
}

var count = 0
var value = 0
var primes = Stack<Int>()
while count != 50 {
    if isPrime(value) {
        primes.push(value)
        count += 1
    }
    value += 1
}

print("First 50 primes: ")
while !primes.isEmpty {
    print("\(primes.pop()) ", terminator: "")
}