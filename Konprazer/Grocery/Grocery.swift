struct Grocery {
    let title: String
    let brand: String
    let categories: [String]
    let monetaryData: MonetaryData
    let shop: String
}

extension Grocery: Comparable {
    static func < (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.monetaryData < rhs.monetaryData
    }
    
    static func == (lhs: Grocery, rhs: Grocery) -> Bool {
        lhs.monetaryData == rhs.monetaryData
    }
}
