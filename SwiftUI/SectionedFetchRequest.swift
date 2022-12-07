/// A property wrapper type that retrieves entities, grouped into sections,
/// from a Core Data persistent store.
///
/// Use a `SectionedFetchRequest` property wrapper to declare a
/// ``SectionedFetchResults`` property that provides a grouped collection of
/// Core Data managed objects to a SwiftUI view. If you don't need sectioning,
/// use ``FetchRequest`` instead.
///
/// Configure a sectioned fetch request with an optional predicate and sort
/// descriptors, and include a `sectionIdentifier` parameter to indicate how
/// to group the fetched results. Be sure that you choose sorting and sectioning
/// that work together to avoid discontiguous sections. For example, you can
/// request a list of earthquakes, composed of `Quake` managed objects that the
/// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
/// sample code project defines to store earthquake data, sorted by time and
/// grouped by date:
///
///     @SectionedFetchRequest<String, Quake>(
///         sectionIdentifier: \.day,
///         sortDescriptors: [SortDescriptor(\.time, order: .reverse)]
///     )
///     private var quakes: SectionedFetchResults<String, Quake>
///
/// Always declare properties that have a sectioned fetch request wrapper as
/// private. This lets the compiler help you avoid accidentally setting
/// the property from the memberwise initializer of the enclosing view.
///
/// The request infers the entity type from the `Result` type that you specify,
/// which is `Quake` in the example above. Indicate a `SectionIdentifier` type
/// to declare the type found at the fetched object's `sectionIdentifier`
/// key path. The section identifier type must conform to the
/// <doc://com.apple.documentation/documentation/Swift/Hashable> protocol.
///
/// The example above depends on the `Quake` type having a `day` property that's
/// either a stored or computed string. Be sure to mark any computed property
/// with the `@objc` attribute for it to function as a section identifier.
/// For best performance with large data sets, use stored properties.
///
/// The sectioned fetch request and its results use the managed object context
/// stored in the environment, which you can access using the
/// ``EnvironmentValues/managedObjectContext`` environment value. To
/// support user interface activity, you typically rely on the
/// <doc://com.apple.documentation/documentation/CoreData/NSPersistentContainer/1640622-viewContext>
/// property of a shared
/// <doc://com.apple.documentation/documentation/CoreData/NSPersistentContainer>
/// instance. For example, you can set a context on your top-level content
/// view using a shared container that you define as part of your model:
///
///     ContentView()
///         .environment(
///             \.managedObjectContext,
///             QuakesProvider.shared.container.viewContext)
///
/// When you need to dynamically change the section identifier, predicate,
/// or sort descriptors, access the request's
/// ``SectionedFetchRequest/Configuration`` structure, either directly or with
/// a binding.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@propertyWrapper @MainActor public struct SectionedFetchRequest<SectionIdentifier, Result> where SectionIdentifier : Hashable, Result : NSFetchRequestResult {

    /// The fetched results of the fetch request.
    ///
    /// This property behaves like the ``FetchRequest/wrappedValue`` of a
    /// ``FetchRequest``. In particular, SwiftUI returns the value associated
    /// with this property when you use ``SectionedFetchRequest`` as a property
    /// wrapper and then access the wrapped property by name. For example,
    /// consider the following `quakes` property declaration that fetches a
    /// `Quake` type that the
    /// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
    /// sample code project defines:
    ///
    ///     @SectionedFetchRequest<String, Quake>(
    ///         sectionIdentifier: \.day,
    ///         sortDescriptors: [SortDescriptor(\.time, order: .reverse)]
    ///     )
    ///     private var quakes: SectionedFetchResults<String, Quake>
    ///
    /// You access the request's `wrappedValue`, which contains a
    /// ``SectionedFetchResults`` instance, by referring to the `quakes`
    /// property by name. That value is a collection
    /// of sections, each of which contains a group of managed objects:
    ///
    ///     Text("Found \(quakes.count) days of earthquakes")
    ///
    /// If you need to separate the request and the result
    /// entities, you can declare `quakes` in two steps by
    /// using the request's `wrappedValue` to obtain the results:
    ///
    ///     var fetchRequest = SectionedFetchRequest<String, Quake>(
    ///         fetchRequest: request,
    ///         sectionIdentifier: \.day)
    ///     var quakes: SectionedFetchedResults<String, Quake> { fetchRequest.wrappedValue }
    ///
    /// The `wrappedValue` property returns an empty array when there are no
    /// fetched results; for example, because no entities satisfy the
    /// predicate, or because the data store is empty.
    @MainActor public var wrappedValue: SectionedFetchResults<SectionIdentifier, Result> { get }

    /// The request's configurable properties.
    ///
    /// You initialize a ``SectionedFetchRequest`` with a section identifier,
    /// an optional predicate, and sort descriptors, either explicitly or with
    /// a configured
    /// <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>.
    /// Later, you can dynamically update the identifier, predicate, and sort
    /// parameters using the request's configuration structure.
    ///
    /// You access or bind to a request's configuration components through
    /// properties on the associated ``SectionedFetchResults`` instance,
    /// just like you do for a ``FetchRequest`` using
    /// ``FetchRequest/Configuration``.
    ///
    /// When configuring a sectioned fetch request, ensure that the
    /// combination of the section identifier and the primary sort descriptor
    /// doesn't create discontiguous sections.
    public struct Configuration {

        /// The request's section identifier key path.
        ///
        /// Set this configuration value to cause a ``SectionedFetchRequest``
        /// to execute a fetch with a new section identifier. You can't change
        /// the section identifier type without creating a new fetch request.
        /// Use care to coordinate section and sort updates, as described
        /// in ``SectionedFetchRequest/Configuration``.
        ///
        /// Access this value for a given request by using the
        /// ``SectionedFetchResults/sectionIdentifier`` property on the
        /// associated ``SectionedFetchResults`` instance, either directly or
        /// with a ``Binding``.
        public var sectionIdentifier: KeyPath<Result, SectionIdentifier>

        /// The request's sort descriptors, accessed as reference types.
        ///
        /// Set this configuration value to cause a ``SectionedFetchRequest``
        /// to execute a fetch with a new collection of
        /// <doc://com.apple.documentation/documentation/Foundation/NSSortDescriptor>
        /// instances. If you want to use
        /// <doc://com.apple.documentation/documentation/Foundation/SortDescriptor>
        /// instances, set ``SectionedFetchRequest/Configuration/sortDescriptors``
        /// instead. Use care to coordinate section and sort updates, as
        /// described in ``SectionedFetchRequest/Configuration``.
        ///
        /// Access this value for a given request by using the
        /// ``SectionedFetchResults/nsSortDescriptors`` property on the
        /// associated ``SectionedFetchResults`` instance, either directly or
        /// with a ``Binding``.
        public var nsSortDescriptors: [NSSortDescriptor]

        /// The request's predicate.
        ///
        /// Set this configuration value to cause a ``SectionedFetchRequest``
        /// to execute a fetch with a new predicate.
        ///
        /// Access this value for a given request by using the
        /// ``SectionedFetchResults/nsPredicate`` property on the associated
        /// ``SectionedFetchResults`` instance, either directly or with a
        /// ``Binding``.
        public var nsPredicate: NSPredicate?
    }

    /// A binding to the request's mutable configuration properties.
    ///
    /// This property behaves like the ``FetchRequest/projectedValue``
    /// of a ``FetchRequest``. In particular,
    /// SwiftUI returns the value associated with this property when you use
    /// ``SectionedFetchRequest`` as a property wrapper on a
    /// ``SectionedFetchResults`` instance and then access the results with
    /// a dollar sign (`$`) prefix. The value that SwiftUI returns is a
    /// ``Binding`` to the request's ``SectionedFetchRequest/Configuration``
    /// structure, which dynamically configures the request.
    @MainActor public var projectedValue: Binding<SectionedFetchRequest<SectionIdentifier, Result>.Configuration> { get }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension SectionedFetchRequest : DynamicProperty {

    /// Updates the fetched results.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// fetched results.
    @MainActor public func update() { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension SectionedFetchRequest {

    /// Creates a sectioned fetch request for a specified entity description,
    /// based on a section identifier, a predicate, and sort parameters.
    ///
    /// Use this initializer if you need to explicitly specify the entity type
    /// for the request. If you specify a placeholder `Result` type in the
    /// request declaration, use the
    /// ``init(sectionIdentifier:sortDescriptors:predicate:animation:)-5lpfo``
    /// initializer to let the request infer the entity type. If you need more
    /// control over the fetch request configuration, use
    /// ``init(fetchRequest:sectionIdentifier:animation:)``.
    ///
    /// - Parameters:
    ///   - entity: The description of the Core Data entity to fetch.
    ///   - sectionIdentifier: A key path that SwiftUI applies to the `Result`
    ///     type to get an object's section identifier.
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(entity: NSEntityDescription, sectionIdentifier: KeyPath<Result, SectionIdentifier>, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }

    /// Creates a fully configured sectioned fetch request that uses the
    /// specified animation when updating results.
    ///
    /// Use this initializer when you want to configure a fetch
    /// request with more than a predicate and sort descriptors.
    /// For example, you can vend a request from a `Quake` managed object
    /// that the
    /// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
    /// sample code project defines to store earthquake data.
    /// Limit the number of results to `1000` by setting a
    /// <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest/1506622-fetchLimit>
    /// for the request:
    ///
    ///     extension Quake {
    ///         var request: NSFetchRequest<Quake> {
    ///             let request = NSFetchRequest<Quake>(entityName: "Quake")
    ///             request.sortDescriptors = [
    ///                 NSSortDescriptor(
    ///                     keyPath: \Quake.time,
    ///                     ascending: true)]
    ///             request.fetchLimit = 1000
    ///             return request
    ///         }
    ///     }
    ///
    /// Use the request to define a ``SectionedFetchedResults`` property:
    ///
    ///     @SectionedFetchRequest<String, Quake>(
    ///         fetchRequest: Quake.request,
    ///         sectionIdentifier: \.day)
    ///     private var quakes: FetchedResults<String, Quake>
    ///
    /// If you only need to configure the request's section identifier,
    /// predicate, and sort descriptors, use
    /// ``init(sectionIdentifier:sortDescriptors:predicate:animation:)-5lpfo``
    /// instead. If you need to specify a ``Transaction`` rather than an
    /// optional ``Animation``, use
    /// ``init(fetchRequest:sectionIdentifier:transaction:)``.
    ///
    /// - Parameters:
    ///   - fetchRequest: An
    ///     <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>
    ///     instance that describes the search criteria for retrieving data
    ///     from the persistent store.
    ///   - sectionIdentifier: A key path that SwiftUI applies to the `Result`
    ///     type to get an object's section identifier.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(fetchRequest: NSFetchRequest<Result>, sectionIdentifier: KeyPath<Result, SectionIdentifier>, animation: Animation? = nil) { }

    /// Creates a fully configured sectioned fetch request that uses the
    /// specified transaction when updating results.
    ///
    /// Use this initializer if you need a fetch request with updates that
    /// affect the user interface based on a ``Transaction``. Otherwise, use
    /// ``init(fetchRequest:sectionIdentifier:animation:)``.
    ///
    /// - Parameters:
    ///   - fetchRequest: An
    ///     <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>
    ///     instance that describes the search criteria for retrieving data
    ///     from the persistent store.
    ///   - sectionIdentifier: A key path that SwiftUI applies to the `Result`
    ///     type to get an object's section identifier.
    ///   - transaction: A transaction to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(fetchRequest: NSFetchRequest<Result>, sectionIdentifier: KeyPath<Result, SectionIdentifier>, transaction: Transaction) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension SectionedFetchRequest where Result : NSManagedObject {

    /// Creates a sectioned fetch request based on a section identifier, a
    /// predicate, and reference type sort parameters.
    ///
    /// The request gets the entity type from the `Result` instance by calling
    /// that managed object's
    /// <doc://com.apple.documentation/documentation/CoreData/NSManagedObject/1640588-entity>
    /// type method. If you need to specify the entity type explicitly, use the
    /// ``init(entity:sectionIdentifier:sortDescriptors:predicate:animation:)``
    /// initializer instead. If you need more control over the fetch request
    /// configuration, use ``init(fetchRequest:sectionIdentifier:animation:)``.
    /// For value type sort descriptors, use
    /// ``init(sectionIdentifier:sortDescriptors:predicate:animation:)-5l7hu``.
    ///
    /// - Parameters:
    ///   - sectionIdentifier: A key path that SwiftUI applies to the `Result`
    ///     type to get an object's section identifier.
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(sectionIdentifier: KeyPath<Result, SectionIdentifier>, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }

    /// Creates a sectioned fetch request based on a section identifier,
    /// a predicate, and value type sort parameters.
    ///
    /// The request gets the entity type from the `Result` instance by calling
    /// that managed object's
    /// <doc://com.apple.documentation/documentation/CoreData/NSManagedObject/1640588-entity>
    /// type method. If you need to specify the entity type explicitly, use the
    /// ``init(entity:sectionIdentifier:sortDescriptors:predicate:animation:)``
    /// initializer instead. If you need more control over the fetch request
    /// configuration, use ``init(fetchRequest:sectionIdentifier:animation:)``.
    /// For reference type sort descriptors, use
    /// ``init(sectionIdentifier:sortDescriptors:predicate:animation:)-5lpfo``.
    ///
    /// - Parameters:
    ///   - sectionIdentifier: A key path that SwiftUI applies to the `Result`
    ///     type to get an object's section identifier.
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(sectionIdentifier: KeyPath<Result, SectionIdentifier>, sortDescriptors: [SortDescriptor<Result>], predicate: NSPredicate? = nil, animation: Animation? = nil) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension SectionedFetchRequest.Configuration where Result : NSManagedObject {

    /// The request's sort descriptors, accessed as value types.
    ///
    /// Set this configuration value to cause a ``SectionedFetchRequest`` to
    /// execute a fetch with a new collection of
    /// <doc://com.apple.documentation/documentation/Foundation/SortDescriptor>
    /// instances. If you want to use
    /// <doc://com.apple.documentation/documentation/Foundation/NSSortDescriptor>
    /// instances, set ``SectionedFetchRequest/Configuration/nsSortDescriptors``
    /// instead. Use care to coordinate section and sort updates, as described
    /// in ``SectionedFetchRequest/Configuration``.
    ///
    /// Access this value for a given request by using the
    /// ``SectionedFetchResults/sortDescriptors`` property on the associated
    /// ``SectionedFetchResults`` instance, either directly or with a
    /// ``Binding``.
    public var sortDescriptors: [SortDescriptor<Result>]
}

