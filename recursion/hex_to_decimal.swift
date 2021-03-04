// Hex to decimal

// Write a recursive method that parses a hex number as a string
// into a decimal integer

import Foundation

// recursive solution
func hexToDecimal(_ hex: String) -> Int {
    return hexToDecimal(Array(hex), end: hex.count - 1)
}

func hexToDecimal(_ hex: [Character], end: Int) -> Int {
    let index = hex.count - 1 - end
    let result = hex[index].hexDigitValue! * Int(pow(16.0, Double(end)))
    if end == 0 {
        return result
    }
    return result + hexToDecimal(hex, end: end - 1)
}

// iterative solution
func hexToDecimalIter(_ hex: String) -> Int {
    var result = 0
    let hex = Array(hex)
    for (i, letter) in hex.enumerated() {
        let endIndex = hex.count - 1 - i
        let value = letter.hexDigitValue! * Int(pow(16.0, Double(endIndex)))
        result += value
    }
    return result
}

// tests
print(hexToDecimal("ffffff"))
print(hexToDecimalIter("ffffff"))