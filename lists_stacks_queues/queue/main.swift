var queue = Queue<Int>()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

print(queue)

while !queue.isEmpty {
    print("\(queue.dequeue()!) ", terminator: "")
}
print()