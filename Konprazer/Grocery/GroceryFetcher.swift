import Combine

protocol GroceryFetcher {
    func fetch<T>(by keyPath: KeyPath<Grocery, T>, value: T) -> AnyPublisher<GroceryList, Error>
}
