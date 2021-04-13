// list implementation using arrays
struct ArrayList<Element: Comparable> {
    private(set) var data: [Element]

    init() {
        data = [Element]()
    }

    init(from values: [Element]) {
        self.init()
        for value in values {
            add(value)
        }
    }
}

// MARK: - Extensions
extension ArrayList: CustomStringConvertible {
    var description: String {
        var text = "["
        for i in 0 ..< size {
            text += "\(data[i])"
            if i < size - 1 { text += ", " }
        }
        return text + "]"
    }
}

extension ArrayList: Sequence {
    func makeIterator() -> ListIterator {
        ListIterator(self)
    }

    struct ListIterator: IteratorProtocol {
        let list: ArrayList
        var index = 0
        var current: Node<Element>? = nil
        init (_ list: ArrayList) {
            self.list = list
            current = list.first
        }
        init(_ list: ArrayList) {
            self.list = list
        }

        mutating func next() -> Element? {
            if index == list.size { return nil }
            let value = list[index]
            index += 1
            return value
        }
    }
}

extension ArrayList: Set {
    mutating func addAll(in other: ArrayList) -> Bool {
        var hasChanged = false
        for value in other {
            if contains(value) { continue }
            else {
                hasChanged = true
                add(value)
            }
        }
        return hasChanged
    }

    mutating func removeAll(in other: ArrayList) -> Bool {
        var hasChanged = false
        for value in other {
            if !contains(value) { continue }
            let _ = remove(value)
            hasChanged = true
        }
        return hasChanged
    }

    mutating func retainAll(in other: ArrayList) -> Bool {
        var hasChanged = false
        for value in data {
            if other.contains(value) { continue }
            hasChanged = true
            let _ = remove(value)
        }
        return hasChanged
    }
}

// MARK: - Functions
extension ArrayList: List {
    var size: Int {
        data.count
    }

    var isEmpty: Bool {
        data.count == 0
    }

    // MARK: - Helpers
    func contains(_ key: Element) -> Bool {
        for value in data {
            if value == key { return true }
        }
        return false
    }

    subscript(index: Int) -> Element {
        get { 
            checkIndex(index)
            return data[index]
        }
        set {
            checkIndex(index)
            data[index] = newValue
        }
    }

    func firstIndex(of element: Element) -> Int? {
        for (i, value) in data.enumerated() {
            if value == element { return i }
        }
        return nil
    }

    func lastIndex(of element: Element) -> Int? {
        for i in stride(from: size - 1, through: 0, by: -1) {
            let value = data[i]
            if value == element { return i }
        }
        return nil
    }

    // MARK: - Adding and removing functions

    // adds a new value to the list
    // (doubles the size of the array if its about to overflow)
    mutating func add(_ value: Element) {
        data.append(value)
    }

    mutating func insert(_ value: Element, at index: Int) {
        checkIndex(index)
        data.insert(value, at: index)
    }

    // removes a value from the list and returns the removed value
    mutating func remove(_ element: Element) -> Element? {
        for (i, value) in data.enumerated() {
            if value == element {
                return remove(at: i)
            }
        }
        return nil
    }

    // removes a value at the given index and returns the removed value
    mutating func remove(at index: Int) -> Element {
        checkIndex(index)
        return data.remove(at: index)
    }

    // sets the list back to default size 0 and default capacity
    mutating func clear() {
        data = [Element]()
    }
}

// MARK: - Private functions
extension ArrayList {
    private func copyArray(from: [Element], to: inout [Element]) {
        assert(to.count > from.count, "Elemento array is smaller than the from array")
        for (i, value) in from.enumerated() {
            to[i] = value
        }
    }

    private func checkIndex(_ index: Int) {
        if index < 0 || index > size {
            fatalError("Index out of range")
        }
    }
}