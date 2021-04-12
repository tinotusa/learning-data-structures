var list = ArrayList<Int>()
assert(list.size == 0, "List size != 0")

list.add(1)
list.add(2)
list.add(3)
print(list)
assert(list.size == 3, "List size != 3")


list.insert(100, at: 0)
print(list)
assert(list.data[0] == 100, "list[0] != 100")

let removedValue = list.remove(100)
print(list)
assert(list.data[0] == 1, "list[0] != 1")
assert(removedValue == 100, "removed value != 100")
assert(list.size == 3, "list.size != 3")


let _ = list.remove(at: 2)
print(list)
assert(list.size == 2, "list.size != 2")

list.clear()
print(list)
assert(list.size == 0, "list.size != 0 after call to clear")


assert(list.contains(0xDEADBEEF) != true, "contains should be false")

list.add(100)
list.add(200)
assert(list[0] == 100, "value at 0 is not 100")
assert(list[1] == 200, "value at 1 is not 200")

list[0] = 1
assert(list[0] == 1, "value at 0 is not 1")
print(list) // 1, 200


var value = 200
if let index = list.firstIndex(of: value) {
    print("The index of \(value) is \(index)")
    assert(index == 1, "Index of \(value) should be 1")
}

value = 1
if let lastIndex = list.lastIndex(of: value) {
    print("The index of \(value) is \(lastIndex)")
    assert(lastIndex == 0, "last index of \(value) should be 0")
}

print("testing iterator")
for value in list {
    print(value)
}

let list1Original = ArrayList(from: ["Tom", "George", "Peter", "Jean", "Jane"])
let list2Original = ArrayList(from: ["Tom", "George", "Micheal", "Michelle", "Daniel"])

print("List1: \(list1Original)")
print("List2: \(list2Original)")

var list1 = list1Original
var list2 = list2Original

var hasChanged = list1.addAll(in: list2)
if hasChanged {
    print("the list has changed")
} else {
    print("The list didn't change")
}

list1 = list1Original
list2 = list2Original

print("Before removeAll call: \(list1)")
let _ = list1.removeAll(in: list2)
print("After removeAll call: \(list1)")

list1 = list1Original
list2 = list2Original
print("Before retainAll call: \(list1)")
let _ = list1.retainAll(in: list2)
print("After retainAll call: \(list1)")