// String permutation

// Write a recursive method to print all the permutations of a string

// recursive solution
func displayPermutation(_ s: String) {
    displayPermutation("", s)
}

func displayPermutation(_ s: String, _ s2: String) {
    if s2.isEmpty {
        print(s)
        return
    }
    for (i, char) in s2.enumerated() {
        let s = s + String(char)
        let s2 = String(s2[..<s2.index(s2.startIndex, offsetBy: i)]) +
            String(s2[s2.index(s2.startIndex, offsetBy: i + 1)...])
        displayPermutation(s, s2)
    }
}

displayPermutation("abc")