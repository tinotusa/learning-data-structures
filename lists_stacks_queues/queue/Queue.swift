struct Queue<Element: Comparable> {
    private var list: LinkedList<Element>
    init() {
        list = LinkedList()
    }
}

extension Queue {
    var size: Int {
        list.size
    }

    var isEmpty: Bool {
        list.isEmpty
    }

    mutating func enqueue(_ value: Element) {
        list.addFirst(value)
    }

    mutating func dequeue() -> Element? {
        list.removeLast()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return "\(list)"
    }
}