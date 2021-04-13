// Pattern matching

// Write a program that prompts the user to enter two strings and tests whether the
// second string is a substring of the first string. Suppose the neighboring
// characters in the string are distinct.

// Analyze the time complexity of your algorithm.
// Your algorithm needs to be at least O(n) time.

// O(n)
func index(of keyword: String, in text: String) -> Int? {
    let text = Array(text)
    let keywordLength = keyword.count

    // runs n times
    for i in 0 ..< text.count {
        // constant operations
        let currentLetter = text[i]
        if currentLetter != keyword.first! { continue }
        if keyword == String(text[i ..< i + keywordLength]) {
            return i
        }
    }

    return nil
}

let keyword = "sip"
let text = "Mississippi"

if let index = index(of: keyword, in: text) {
    print("The index of \(keyword) is \(index)")
} else {
    print("\(keyword) was not found in the text")
}