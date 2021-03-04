// Binary to decimal

// Write a recursive method that parses a binary number as a
// string into a decimal integer

import Foundation

// recursive solution
func binaryToDecimal(_ binary: String) -> Int {
    return binaryToDecimal(Array(binary), end: binary.count - 1)
}

func binaryToDecimal(_ binary: [Character], end: Int) -> Int {
    let index = binary.count - 1 - end
    let digit = Int(String(binary[index]))!
    let result = digit * Int(pow(2.0, Double(end)))

    if end == 0 {
        return result
    }

    return result + binaryToDecimal(binary, end: end - 1)
}

// iterative solution
func binaryToDecimalIter(_ binary: String) -> Int {
    var decimal = 0
    for (i, digit) in binary.enumerated() {
        let lastIndex = Double(binary.count - 1 - i)
        decimal += Int(String(digit))! * Int(pow(2.0, lastIndex))
    }
    return decimal
}

let binary = "11111111"
print(binaryToDecimal(binary))
print(binaryToDecimalIter(binary))