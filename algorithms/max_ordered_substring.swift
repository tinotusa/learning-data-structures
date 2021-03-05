// Maximum consecutive increasingly ordered substring

// Write a program that gets a string and displays the maximum consecutive
// increasingly ordered substring

// e,g:
// input: abcabcdgabxy
// output: abcdg

// O(n) time complexity
func substring(of text: String) -> String {
    var max = ""
    let text = Array(text)
    var temp = ""

    // n times
    for i in 0 ..< text.count - 1 {
        // some constant
        if text[i] < text[i + 1] {
            temp += String(text[i])
        } else {
            if temp.count > max.count {
                max = temp + String(text[i])
            }
            temp = ""
        }
    }

    // some constant
    if temp.count > max.count {
        max = temp + String(text.last!)
    }

    return max
}

let tests = [
    "abcabcdgabxy",
    "abcabcdgabmnsxy",
    "abaaaa"
]

for test in tests {
    print(test, substring(of: test))
}