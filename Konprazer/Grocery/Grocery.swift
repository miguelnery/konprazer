struct Grocery: ComparableItem {
    let quantity: Quantity
    let price: Double
    var pricePerUnit: Double {
        calculatePricePerUnit(price: price, quantity: quantity)
    }

    init(_ quantity: Quantity, price: Double) {
        self.quantity = quantity
        self.price = price
    }
}

extension Grocery {
    private func calculatePricePerUnit(price: Double, quantity: Quantity) -> Double {
        switch quantity {
        case .unity(let n):
            return price / Double(n)
        case .kg(let n):
            return price / n
        }
    }
}

extension Grocery: Comparable {
    static func < (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.pricePerUnit < rhs.pricePerUnit
    }

    static func == (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.pricePerUnit == rhs.pricePerUnit
    }
}
