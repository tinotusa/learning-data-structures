// Decimal to hex

// Write a recursive method that converts a decimal number into
// a hex number as a string

// recursive solution
func decimalToHex(_ value: Int) -> String {
    return "0x" + decimalToHex(value, hexString: "")
}

func decimalToHex(_ value: Int, hexString: String) -> String {
    if value == 0 {
        if hexString.isEmpty { return "0" }
        return hexString
    }
    return decimalToHex(value / 16, hexString: hexString + toHex(value % 16))
    
}

func toHex(_ digit: Int) -> String {
    if digit < 0 || digit > 15 {
        return ""
    }

    var letter = ""
    switch digit {
        case 0...9: letter = "\(digit)"
        case 10: letter = "A"
        case 11: letter = "B"
        case 12: letter = "C"
        case 13: letter = "D"
        case 14: letter = "E"
        case 15: letter = "F"
        default:
            break // this shouldn't happen
    }

    return letter
}

// tests
print(decimalToHex(16777215))