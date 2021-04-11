// min-heap implementation
// a min heap is a heap where every root node
// is less than or equal to any of its children
struct Heap<T: Comparable> {
    private var list: [T]
    private var listSize: Int

    init() {
        self.init(from: [])
    }

    init(from list: [T]) {
        self.list = []
        listSize = 0
        for value in list {
            add(value)
        }
    }
}

extension Heap {
    private(set) var size: Int {
        get { listSize }
        set { listSize = newValue }
    }

    var isEmpty: Bool {
        size == 0
    }

    mutating func add(_ value: T) {
        size += 1
        list.append(value)
        var currentNode = size - 1
        var parentNode = (currentNode - 1) / 2
        while list[currentNode] < list[parentNode] {
            list.swapAt(currentNode, parentNode)
            currentNode = parentNode
            parentNode = (currentNode - 1) / 2
        }
    }

    mutating func remove() -> T {
        let removedValue = list[0]
        var rootNode = 0
        list[0] = list[size - 1]
        size -= 1

        while rootNode < size {
            let leftNode = 2 * rootNode + 1
            let rightNode = 2 * rootNode + 2

            if leftNode > size { break }
            var minNode = leftNode
            if rightNode < size {
                if list[rightNode] < list[minNode] {
                    minNode = rightNode
                }
            }

            if list[rootNode] > list[minNode] {
                list.swapAt(rootNode, minNode)
                rootNode = minNode
            } else {
                break
            }
        }
        return removedValue
    }

    func printHeap() {
        print(list)
    }


}

var heap = Heap(from: [3, 6, 1, -2])
while !heap.isEmpty {
    print(heap.remove())
}