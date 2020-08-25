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
    var quantity: Quantity
    var price: Double
    var pricePerUnit: Double
    
    init(quantity: Quantity, price: Double) {
        self.quantity = quantity
        self.price = price
        
        switch quantity {
        case .unity(let n):
            pricePerUnit = price / Double(n)
        case .kg(let n):
            
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

struct Comparison<Item: ComparableItem> {
    let cheaperItem: Item
//    let priceDifferencePerUnit: Double
//    let priceDifferenceTotal: Double
    
    init(a: Item, b: Item) {
        cheaperItem = min(a, b)
    }
}
