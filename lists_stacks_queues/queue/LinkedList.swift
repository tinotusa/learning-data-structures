class LinkedList<Element: Comparable> {
    var head: Node<Element>?
    var tail: Node<Element>?

    private var listSize: Int

    init() {
        head = nil
        tail = nil
        listSize = 0
    }
}

// MARK: - Functions
extension LinkedList {
    private(set) var size: Int {
        get { listSize }
        set { listSize = newValue }
    }

    var isEmpty: Bool {
        size == 0
    }

    var first: Node<Element>? {
        head
    }

    var last: Node<Element>? {
        tail
    }

    subscript(index: Int) -> Element {
        get {
            checkIndex(index)
            if index ==  0 {
                return first!.value
            } else if index == size - 1{
                return last!.value
            }

            var current = head
            for _ in 0 ..< index {
                current = current?.next
            }
            return current!.value
        }
        set {
            checkIndex(index)
            var current = head
            for _ in 0 ..< index {
                current = current?.next
            }
            current?.value = newValue
        }
    }

    // MARK: - Adding
    func add(_ value: Element) {
        addLast(value)
    }

    func addFirst(_ value: Element) {
        let newNode = Node(value: value)
        size += 1
        if head == nil {
            head = newNode
            tail = head
            return
        }
        newNode.next = head
        head?.previous = newNode
        head = newNode
    }

    func addLast(_ value: Element) {
        let newNode = Node(value: value)
        size += 1
        if tail == nil {
            head = newNode
            tail = head
            return
        }
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
    }

    func insert(_ value: Element, at index: Int) {
        checkIndex(index)
        if index == 0 { addFirst(value) }
        else if index == size - 1 { addLast(value) }
        else {
            var current = head
            for _ in 1 ..< index {
                current = current?.next
            }
            let newNode = Node(value: value)
            newNode.next = current?.next
            newNode.previous = current
            current?.next = newNode
            size += 1
        }
    }

    // MARK: Removing
    func removeFirst() -> Element? {
        if head == nil { return nil }
        let value = head!.value
        head = head?.next
        size -= 1
        return value
    }

    func removeLast() -> Element? {
        if tail == nil { return nil }
        let value = tail!.value
        tail = tail?.previous
        tail?.next = nil
        size -= 1
        return value
    }

    func remove(at index: Int) -> Element? {
        checkIndex(index)
        if index == 0 { return removeFirst() }
        else if index == size - 1 { return removeLast() }
        else {
            var current = head
            for _ in 0 ..< index {
                current = current?.next
            }
            let removed = current?.next?.value
            let next = current?.next?.next
            next?.previous = current
            current?.next = next
            size -= 1
            return removed
        }
    }

    func clear() {
        size = 0
        head = nil
        tail = nil
    }

    // MARK: Utility
    func contains(_ element: Element) -> Bool {
        if isEmpty { return false }
        var current = head
        while current != nil {
            if current?.value == element {
                return true
            }
            current = current?.next
        }
        return false
    }

    func firstIndex(of element: Element) -> Int? {
        var current = head
        var index = 0
        while current != nil {
            if current?.value == element {
                return index
            }
            index += 1
            current = current?.next
        }
        return nil
    }

    func lastIndex(of element: Element) -> Int? {
        var current = tail
        var index = size - 1
        while current != nil {
            if current?.value == element {
                return index
            }
            index -= 1
            current = current?.previous
        }
        return nil
    }
}

// MARK: - Helpers
extension LinkedList {
    private func checkIndex(_ index: Int) {
        if index < 0 || index > size {
            fatalError("Index (\(index)) out of bounds")
        }
    }
}


// MARK: - Protocol Extensions
extension LinkedList: CustomStringConvertible {
    var description: String {
        var text = "["
        var current = head
        while current != nil {
            text += "\(current!.value)"
            current = current!.next
            if current != nil { text += "->"}
        }
        return text + "]"
    }
}

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator {
        LinkedListIterator(self)
    }

    struct LinkedListIterator: IteratorProtocol {
        var list: LinkedList
        var current: Node<Element>?

        init(_ list:  LinkedList) {
            self.list = list
            current = list.first
        }

        mutating func next() -> Element? {
            if current == nil { return nil }
            let value = current?.value
            current = current?.next
            return value
            // if index >= list.size { return nil }
            // let value = list[index]
            // index += 1
            // return value
        }
    } 
}