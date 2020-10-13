struct GroceryList {
    private let groceries: [Grocery]

    var totalPrice: Double { groceries.reduce(0.0) { $0 + $1.monetaryData.totalPrice } }

    func groceries<T: Comparable>(by keyPath: KeyPath<Grocery, T>, value: T) -> GroceryList {
        GroceryList(groceries: groceries
            .filterEqual(by: keyPath, value: value))
    }

    func totalPrice<T: Comparable>(by keyPath: KeyPath<Grocery, T>, value: T) -> Double {
        groceries(by: keyPath, value: value)
            .totalPrice
    }
}
