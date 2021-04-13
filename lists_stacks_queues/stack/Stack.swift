struct Stack<Element: Comparable> {
    private(set) var  data: [Element]

    init() {
        data = [Element]()
    }
}

extension Stack {
    var size: Int {
        data.count
    }

    var isEmpty: Bool {
        data.isEmpty
    }

    mutating func push(_ value: Element) {
        data.append(value)
    }

    mutating func pop() -> Element {
        if isEmpty { fatalError("Popped an empty stack") }
        return data.removeLast()
    }

    func contains(_ value: Element) -> Bool {
        data.contains(value)
    }

    func peek() -> Element {
        if isEmpty { fatalError("Peeked and empty stack") }
        return data[size - 1]
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        "\(data)"
    }
}