// Fibonacci numbers
// Write a fib method using iterations

// recursive solution
func fibonacci_recursive(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fibonacci_recursive(n - 2) + fibonacci_recursive(n - 1)
}

// iterative solution
func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var f0 = 0 // fib(0)
    var f1 = 1 // fib(1)
    var f3 = 0

    for _ in 1 ..< n {
        f3 = f0 + f1 // fib(n - 2) + fib(n - 1)
        f0 = f1
        f1 = f3
    }

    return f3
}

for i in 0 ..< 10 {
    print("The fib of \(i) is \(fibonacci(i))")
}
