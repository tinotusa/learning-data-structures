// Sum the digits in an integer using recursion

// Write a recursive method that computes the sum of the digits in an integer
// e.g.: sumDigits(234) returns 2 + 3 + 4 = 9

// recursive solution
func sumDigits(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    return n % 10 + sumDigits(n / 10)
}

// iterative solution
func sumDigitsIter(_ n: Int) -> Int {
    var sum = 0
    var n = n
    // this couldn't work with Double
    while n != 0 {
        sum += n % 10
        n /= 10
    }
    return sum
}

let value = 123
print("the sum of the digits in \(value) is \(sumDigits(value))")
print("the sum of the digits in \(value) is \(sumDigitsIter(value))")