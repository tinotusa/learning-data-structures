protocol Set {
    associatedtype Array: List
    mutating func addAll(in otherList: Array) -> Bool
    mutating func removeAll(in otherList: Array) -> Bool
    mutating func retainAll(in otherList: Array) -> Bool
}
