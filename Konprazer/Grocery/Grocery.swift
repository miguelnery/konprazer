struct Grocery {
    let title: String
    let brand: String
    let categories: [String]
    let value: MonetaryValue
    let shop: String
}

extension Grocery: Comparable {
    static func < (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.value < rhs.value
    }
    
    static func == (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.value == rhs.value
    }
}
