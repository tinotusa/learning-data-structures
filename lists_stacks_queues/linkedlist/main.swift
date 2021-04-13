let list = LinkedList<Int>()

list.addLast(1)
list.addLast(2)
list.addLast(3)
print(list)
assert(list.size == 3, "list.size != 3")

print()
list.addFirst(100)
list.addFirst(200)
print(list)
assert(list.size == 5, "list.size != 5")

let head = list.first
let tail = list.last
assert(head?.value == 200, "list head should be 200")
assert(tail?.value == 3, "list tail should be 3")


print()
let removed = list.removeFirst()
assert(list.size == 4, "list.size != 4 after element removal")
assert(removed == 200, "the removed value should be 200")

let removedLast = list.removeLast()
assert(list.size == 3, "list.size != 3")
assert(removedLast == 3, "removedValue != 3")

print(list)
list.insert(3, at: 1)
print(list)
assert(list.size == 4, "List size != 4")

// after the insert above
assert(list[1] == 3, "list[1] != 3")

list[0] = -1
assert(list[0] == -1, "list[0] != -1")


let names = LinkedList<String>()
names.add("Kate")
names.add("Luke")
names.add("Marry")
print(names)

let removedName = names.remove(at: 2)
print(names)
assert(removedName == "Marry", "removed name should be Mary")

names.clear()
assert(names.size == 0)

struct Food: Comparable {
    let name: String

    static func <(lhs: Food, rhs: Food) -> Bool {
        lhs.name < rhs.name
    }
}

print()
let foodItems = LinkedList<Food>()
foodItems.add(Food(name: "Pineapple"))
foodItems.add(Food(name: "Pancake"))
foodItems.add(Food(name: "Pizza"))

print(foodItems)
assert(foodItems.contains(Food(name: "Pancake")), "fooditems list should have pancakes")

let pizzaIndex = foodItems.firstIndex(of: Food(name: "Pizza"))
assert(pizzaIndex == 2, "Pizza should be at index 2")

print()
foodItems.addFirst(Food(name: "Pineapple"))
let pineappleIndex = foodItems.lastIndex(of: Food(name: "Pineapple"))
print(foodItems)
assert(pineappleIndex == 1, "last index of pineapple should be 1")


// testing iterator
for item in foodItems {
    print(item)
}