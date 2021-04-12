protocol List {
    associatedtype T: Comparable
    var size: Int { get }
    var isEmpty: Bool { get }

    // adding and removing
    mutating func add(_ value: T)
    mutating func insert(_ value: T, at index: Int)
    mutating func remove(_ value: T) -> T?
    mutating func remove(at index: Int) -> T
    mutating func clear()

    // helpers
    func contains(_ value: T) -> Bool
    subscript(index: Int) -> T { get set }
    func firstIndex(of element: T) -> Int?
    func lastIndex(of element: T) -> Int?
}