struct MaxHeap<Element: Comparable> {
    private(set) var list: [Element]
    private var listSize: Int

    init() {
        self.init(from: [])
    }

    init(from list: [Element]) {
        self.list = []
        listSize = 0
        for value in list {
            add(value)
        }
    }
}

extension MaxHeap {
    private(set) var size: Int {
        get { listSize }
        set { listSize = newValue }
    }

    var isEmpty: Bool {
        size == 0
    }

    mutating func add(_ value: Element) {
        size += 1
        list.append(value)
        var currentNode = size - 1
        var parentNode = (currentNode - 1) / 2
        while list[currentNode] > list[parentNode] {
            list.swapAt(currentNode, parentNode)
            currentNode = parentNode
            parentNode = (currentNode - 1) / 2
        }
    }

    mutating func remove() -> Element {
        let removedValue = list[0]
        var rootNode = 0
        list[0] = list[size - 1]
        size -= 1

        while rootNode < size {
            let leftNode = 2 * rootNode + 1
            let rightNode = 2 * rootNode + 2

            if leftNode > size { break }
            var maxNode = leftNode
            if rightNode < size {
                if list[rightNode] > list[maxNode] {
                    maxNode = rightNode
                }
            }

            if list[rootNode] < list[maxNode] {
                list.swapAt(rootNode, maxNode)
                rootNode = maxNode
            } else {
                break
            }
        }
        return removedValue
    }

    func printMaxHeap() {
        print(list)
    }
}


extension MaxHeap: Equatable {
    static func ==(lhs: MaxHeap, rhs: MaxHeap) -> Bool {
        var lhs = lhs
        var rhs = rhs
        if lhs.size != rhs.size {
            return false
        }
        while !lhs.isEmpty {
            let left = lhs.remove()
            let right = rhs.remove()
            if left != right {
                return false
            }
        }
        return true
    }
}