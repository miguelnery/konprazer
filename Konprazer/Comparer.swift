enum Quantity {
    case unity(Int)
    case kg(Double)
}

protocol Comparable {
    var quantity: Quantity { get }
    var price: Double { get }
    var pricePerUnit: Double { get }
}



protocol ComparerProtocol {
    func compareCheaper(_ a: Comparable, _ b: Comparable) -> Comparable
}

//class Comparer: ComparerProtocol {
//    func compareCheaper(_ a: Comparable, _ b: Comparable) -> Comparable {
//
//    }
//}
