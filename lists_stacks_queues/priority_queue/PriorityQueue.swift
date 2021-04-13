struct PriorityQueue<Element: Comparable> {
    private var heap: MaxHeap<Element>

    init() {
        heap = MaxHeap()
    }

    init(from array: [Element]) {
        heap = MaxHeap(from: array)
    }

    mutating func enqueue(_ value: Element) {
        heap.add(value)
    }

    mutating func dequeue() -> Element {
        heap.remove()
    }

    var isEmpty: Bool {
        heap.isEmpty
    }
}
