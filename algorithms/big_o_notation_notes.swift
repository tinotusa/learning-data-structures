// developing efficient algorithms

// algorithm design is to develop a mathematical process for solving a problem
// algorithm analysis is to predict the performance of an algorithm

// --- measuring algorithm efficiency ---
// Big O notation is a theoretical approach for analyzing the performance of an algorithm.
// It estimates how fast an algorithm’s execution time increases as the input size increases.
// this enables us to compare two algorithms by examining their growth rates.

// An input that results in the shortest execution time is called the best-case input.
// An in put that results in the longest execution time is called the worst-case input.
// Best case and worst case are not representative, but
// worst-case analysis is very useful because you can be sure that the algorithm will
// never be slower than the worst case.

// multiplicative constants and nondominating terms are ignored in the function 
// the constants and nondominating terms are ignored because as n grows they become less significant

// for an algorith that is O(n) (read on the order of n)
// the growth of the algorithm grows linearly as the input grows

// this theoretical approach to measure algorithms was made to overcome the problems
// of timing an algorithm running on a computer (system load, and input size would change the results)

// rank of time efficiency (best to worst)
// O(1) - constant time
// O(log n) - logarithmic
// O(n) - linear
// O(n log n) - log linear time
// O(n^2) - quadratic 
// O(2^n) - exponential

// --- notes ---

// some questions
// Design an O(n) time algorithm for computing the sum of numbers from n1 to n2 for
// (n1 6 n2). Can you design an O(1) for performing the same task?

// O(n) time complexity
func sumOfRange(from n1: Int, through n2: Int) -> Int {
    var sum = 0
    for i in n1 ... n2 {
        sum += i
    }
    return sum
}

// O(1) time complexity
func sumOfRangeConstant(from n1: Int, through n2: Int) -> Int {
    let n = Double(n2 - n1)
    return Int(0.5 * n) * (n1 + n2) + n1 + n2
}

let first = 1
let last = 100
print(sumOfRange(from: first, through: last))
print(sumOfRangeConstant(from: first, through: last))