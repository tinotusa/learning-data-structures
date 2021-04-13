class Node<Element: Comparable> {
    var value: Element
    var next: Node?
    weak var previous: Node?

    init(value: Element) {
        self.value = value
        next = nil
        previous = nil
    }

    // to test agains reference cycles
    // deinit {
    //     print("being removed")
    // }
}
