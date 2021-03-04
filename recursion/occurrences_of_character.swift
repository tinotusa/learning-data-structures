// Occurrences of a specified character in a string

// Write a recursive method that finds the number of occurrences of a specified
// letter in a string 
// e.g.: count("Welcome", 'e') returns 2.

// recursive solution
func countOccurences(of char: Character, in word: String) -> Int {
    return countOccurences(of: char, in: word, index: 0)
}

func countOccurences(of char: Character, in word: String, index: Int) -> Int {
    if index == word.count { return 0 }
    if char == word[word.index(word.startIndex, offsetBy: index)] {
        return 1 + countOccurences(of: char, in: word, index: index + 1)
    }
    return countOccurences(of: char, in: word, index: index + 1)
}

// iterative solution
func countOccurencesIterative(of char: Character, in word: String) -> Int {
    var count = 0
    for letter in word {
        if letter == char {
            count += 1
        }
    }
    return count
}

// tests
let letter: Character = "x"
let word = "this is a test c"
print(countOccurences(of: letter, in: word))
print(countOccurencesIterative(of: letter, in: word))