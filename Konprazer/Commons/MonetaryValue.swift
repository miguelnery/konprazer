import Foundation

struct MonetaryValue {
    let price: Double
    let quantity: Quantity
    let date: Date?
    var pricePerUnit: Double {
        calculatePricePerUnit(price: price, quantity: quantity)
    }

    init(price: Double, quantity: Quantity, date: Date? = nil) {
        self.price = price
        self.quantity = quantity
        self.date = date
    }
}

extension MonetaryValue {
    private func calculatePricePerUnit(price: Double, quantity: Quantity) -> Double {
        switch quantity {
        case .unity(let n):
            return price / Double(n)
        case .kg(let n):
            return price / n
        }
    }
}

extension MonetaryValue: Comparable {
    static func < (lhs: MonetaryValue, rhs: MonetaryValue) -> Bool {
        lhs.pricePerUnit < rhs.pricePerUnit
    }

    static func == (lhs: MonetaryValue, rhs: MonetaryValue) -> Bool {
        lhs.pricePerUnit == rhs.pricePerUnit
    }
}
