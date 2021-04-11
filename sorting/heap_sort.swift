// Generic heap sort
// Write generic methods using heap sort

// heap sort functions by adding values to a binary heap
// and removes values from the root to obtain sorted list

// this implementation of a heap is also known as a max-heap
struct Heap<T: Comparable> {
    private(set) var list: [T]
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

extension Heap: Equatable {
    static func ==(lhs: Heap, rhs: Heap) -> Bool {
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
        while list[currentNode] > list[parentNode] {
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

    func printHeap() {
        print(list)
    }
}

// O(n log n) the same as merge sort
// but this is more space effcient
func sort<T: Comparable>(_ array: inout [T]) {
    var heap = Heap<T>(from: array)
    for i in stride(from: array.count - 1, through: 0, by: -1) {
        array[i] = heap.remove()
    }
}

var array = [3, 25, 8, -1]
print("before heap sort: \(array)")
sort(&array)
print("after heap sort: \(array)")

print(Heap(from: [1, 2, 3]) == Heap(from: [3, 2, 1]))