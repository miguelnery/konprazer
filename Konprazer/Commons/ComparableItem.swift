protocol ComparableItem: Comparable {
    var quantity: Quantity { get }
    var price: Double { get }
    var pricePerUnit: Double { get }
}
