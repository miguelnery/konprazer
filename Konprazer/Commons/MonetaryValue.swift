import Foundation

struct MonetaryValue {
    let price: Double
    let units: Int
    let quantity: Quantity
    let date: Date?
    var pricePerUnit: Double {
        calculatePricePerUnit(price: price, quantity: quantity)
    }

    init(price: Double, units: Int, quantity: Quantity, date: Date? = nil) {
        self.price = price
        self.units = units
        self.quantity = quantity
        self.date = date
    }
}

extension MonetaryValue {
    private func calculatePricePerUnit(price: Double, quantity: Quantity) -> Double {
        switch quantity {
        case .units(let n):
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
