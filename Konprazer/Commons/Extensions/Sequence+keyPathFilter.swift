extension Sequence {
    func filter<T>(by keyPath: KeyPath<Element, T>, predicate: (T) -> Bool) -> [Element] {
        return filter { predicate($0[keyPath: keyPath]) }
    }

    func filterEqual<T: Comparable>(by keyPath: KeyPath<Element, T>, value: T) -> [Element] {
        return filter { $0[keyPath: keyPath] == value }
    }
}
