// Greatest common divisor
// Compute greatest common divisor using recursion

import Foundation

// recursive solution
func gcd(of m: Int, and n: Int) -> Int {
    if m % n == 0 {
        return n
    }
    return gcd(of: n, and: m % n)
}

// iterative solution
func gcd_iter(of m: Int, and n: Int) -> Int {
    let smallest = Int(Double(min(m, n)).squareRoot())
    for i in stride(from: smallest, to: 1, by: -1) {
        if m % i == 0 && n % i == 0 {
            return i
        }
    }
    return 1
}

let val1 = 142387922
let val2 = 22894624
print("The greatest common divisor of \(val1) and \(val2) is \(gcd(of: val1, and: val2))")
print("The greatest common divisor of \(val1) and \(val2) is \(gcd_iter(of: val1, and: val2))")
