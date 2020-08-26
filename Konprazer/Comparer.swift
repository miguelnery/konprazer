enum Quantity {
    case unity(Int)
    case kg(Double)
}

protocol ComparableItem: Comparable {
    var quantity: Quantity { get }
    var price: Double { get }
    var pricePerUnit: Double { get }
}

struct Grocery: ComparableItem {
    let quantity: Quantity
    let price: Double
    var pricePerUnit: Double {
        switch quantity {
        case .unity(let n):
            return price / Double(n)
        case .kg(let n):
            return price / n
        }
    }
    
    init(_ quantity: Quantity, price: Double) {
        self.quantity = quantity
        self.price = price
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

struct Comparison<Item: ComparableItem> {
    let cheaperItem: Item
//    let priceDifferencePerUnit: Double
    let priceDifferenceTotal: Double
    
    init(_ a: Item, _ b: Item) {
        cheaperItem = min(a, b)
        priceDifferenceTotal = abs(a.price - b.price)
    }
}
