// Decimal to binary

// Write a recursive method that converts a decimal number into a binary
// number as a string

// recursive solution
func decimalToBinary(_ value: Int) -> String {
    decimalToBinary(value, binaryString: "")
}
func decimalToBinary(_ value: Int, binaryString: String) -> String {
    if value == 0 {
        if binaryString.isEmpty { return "0" }
        return binaryString
    }

    let remainder = value % 2
    return decimalToBinary(value / 2, binaryString: "\(remainder)" + binaryString)
}

// iterative solution
func decimalToBinaryIter(_ value: Int) -> String {
    var binaryString = ""
    var value = value

    while value > 0 {
        let remainder = value % 2
        binaryString = "\(remainder)" + binaryString
        value /= 2
    }

    // if the value was 0
    if binaryString.isEmpty {
        return "0"
    }

    return binaryString
}

// tests
for i in 0...10 {
    print(decimalToBinary(i))
}

for i in 0...10 {
    print(decimalToBinaryIter(i))
}