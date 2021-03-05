// generics

// generics allow types to be parameterized
// doing this solves the problem of having to define the same class and
// functions that differ only in the parameters

// generics is to enable errors to be detected at compile time rather than at runtime

// example
func swapInt(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var aInt = 1
var bInt = 2

print("a is \(aInt) b is \(bInt)")
swapInt(&aInt, &bInt)
print("a is \(aInt) b is \(bInt)")

func swapString(_ a: inout String, _ b: inout String) {
    let tempA = a
    a = b
    b = tempA
}

var aString = "Hello"
var bString = "World"

print("a is \(aString) b is \(bString)")
swapString(&aString, &bString)
print("a is \(aString) b is \(bString)")

// the only thing that changed in the above functions was the type
// generics help solve this issue by making the type a parameter
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

// T will be given an actual type when the function is called
print("\nusing the generic function")
print("a is \(aInt) b is \(bInt)")
swapValues(&aInt, &bInt)
print("a is \(aInt) b is \(bInt)")

print("\na is \(aString) b is \(bString)")
swapValues(&aString, &bString)
print("a is \(aString) b is \(bString)")


// another solution would be to use Any
// this creates a problem because the types can't be checked at compile time
func swapAny(_ a: inout Any, _ b: inout Any) {
    let tempA = a
    a = b
    b = tempA
}

var intValue: Any = 1
var stringValue: Any = "test"
swapAny(&intValue, &stringValue)

// generics can also be given constraints to make the type have certain attributes
// e.g make sure that a type T is equatable so that the == operator can be used

// syntax for a generic class
/*
class Test<T> {
    init() {

    }

    func someFunc(value: T) {

    }

    var readOnly: T { 
        return someTypeof_T
    }
}
*/