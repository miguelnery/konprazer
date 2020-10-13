import Foundation

struct MonetaryData {
    let totalPrice: Double
    let units: Int
    let quantity: Quantity
    let date: Date?
    var pricePerUnit: Double {
        calculatePricePerUnit(price: totalPrice, quantity: quantity)
    }

    init(price: Double, units: Int, quantity: Quantity, date: Date? = nil) {
        self.totalPrice = price
        self.units = units
        self.quantity = quantity
        self.date = date
    }
}

extension MonetaryData {
    private func calculatePricePerUnit(price: Double, quantity: Quantity) -> Double {
        switch quantity {
        case .units(let n):
            return price / Double(n)
        case .kg(let n):
            return price / n
        }
    }
}

extension MonetaryData: Comparable {
    static func < (lhs: MonetaryData, rhs: MonetaryData) -> Bool {
        lhs.pricePerUnit < rhs.pricePerUnit
    }

    static func == (lhs: MonetaryData, rhs: MonetaryData) -> Bool {
        lhs.pricePerUnit == rhs.pricePerUnit
    }
}
