struct Comparison<Item: ComparableItem> {
    let cheaperItem: Item
    let priceDifferenceTotal: Double

    init(_ a: Item, _ b: Item) {
        cheaperItem = min(a, b)
        priceDifferenceTotal = abs(a.price - b.price)
    }
}
