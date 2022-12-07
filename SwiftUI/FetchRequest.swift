/// A property wrapper type that makes fetch requests and retrieves the results
/// from a Core Data store.
///
/// The fetch request and its results use the managed object context provided by
/// the environment value ``EnvironmentValues/managedObjectContext``.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper public struct FetchRequest<Result> : DynamicProperty where Result : NSFetchRequestResult {

    /// The fetched results of the fetch request.
    ///
    /// This property returns an empty array when there are no fetched results.
    public var wrappedValue: FetchedResults<Result> { get }

    /// Creates an instance by defining a fetch request based on the parameters.
    /// - Parameters:
    ///   - entity: The kind of modeled object to fetch.
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(entity: NSEntityDescription, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, animation: Animation? = nil) { }

    /// Creates an instance from a fetch request.
    /// - Parameters:
    ///   - fetchRequest: The request used to produce the fetched results.
    ///   - transaction: The transaction used for any changes to the fetched
    ///     results.
    public init(fetchRequest: NSFetchRequest<Result>, transaction: Transaction) { }

    /// Updates the fetched results.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// `View/body-swift.property` to ensure the view has the most recent
    /// fetched results.
    public mutating func update() { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest where Result : NSManagedObject {

    /// Creates an instance by defining a fetch request based on the parameters.
    /// The fetch request will automatically infer the entity using Result.entity().
    /// - Parameters:
    ///   - sortDescriptors: An array of sort descriptors defines the sort
    ///     order of the fetched results.
    ///   - predicate: An NSPredicate defines a filter for the fetched results.
    ///   - animation: The animation used for any changes to the fetched
    ///     results.
    public init(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }
}

