/// A property wrapper type that retrieves entities from a Core Data persistent
/// store.
///
/// Use a `FetchRequest` property wrapper to declare a ``FetchedResults``
/// property that provides a collection of Core Data managed objects to a
/// SwiftUI view. The request infers the entity type from the `Result`
/// placeholder type that you specify. Condition the request with an optional
/// predicate and sort descriptors. For example, you can create a request to
/// list all `Quake` managed objects that the
/// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
/// sample code project defines to store earthquake data, sorted by their
/// `time` property:
///
///     @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)])
///     private var quakes: FetchedResults<Quake> // Define Quake in your model.
///
/// Alternatively, when you need more flexibility, you can initialize the
/// request with a configured
/// <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>
/// instance:
///
///     @FetchRequest(fetchRequest: request)
///     private var quakes: FetchedResults<Quake>
///
/// Always declare properties that have a fetch request wrapper as private.
/// This lets the compiler help you avoid accidentally setting
/// the property from the memberwise initializer of the enclosing view.
///
/// The fetch request and its results use the managed object context stored
/// in the environment, which you can access using the
/// ``EnvironmentValues/managedObjectContext`` environment value. To
/// support user interface activity, you typically rely on the
/// <doc://com.apple.documentation/documentation/CoreData/NSPersistentContainer/1640622-viewContext>
/// property of a shared
/// <doc://com.apple.documentation/documentation/CoreData/NSPersistentContainer>
/// instance. For example, you can set a context on your top level content
/// view using a shared container that you define as part of your model:
///
///     ContentView()
///         .environment(
///             \.managedObjectContext,
///             QuakesProvider.shared.container.viewContext)
///
/// When you need to dynamically change the predicate or sort descriptors,
/// access the request's ``FetchRequest/Configuration`` structure.
/// To create a request that groups the fetched results according to a
/// characteristic that they share, use ``SectionedFetchRequest`` instead.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@propertyWrapper @MainActor public struct FetchRequest<Result> where Result : NSFetchRequestResult {

    /// The fetched results of the fetch request.
    ///
    /// SwiftUI returns the value associated with this property
    /// when you use ``FetchRequest`` as a property wrapper, and then access
    /// the wrapped property by name. For example, consider the following
    /// `quakes` property declaration that fetches a `Quake` type that the
    /// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
    /// sample code project defines:
    ///
    ///     @FetchRequest(fetchRequest: request)
    ///     private var quakes: FetchedResults<Quake>
    ///
    /// You access the request's `wrappedValue`, which contains a
    /// ``FetchedResults`` instance, by referring to the `quakes` property
    /// by name:
    ///
    ///     Text("Found \(quakes.count) earthquakes")
    ///
    /// If you need to separate the request and the result
    /// entities, you can declare `quakes` in two steps by
    /// using the request's `wrappedValue` to obtain the results:
    ///
    ///     var fetchRequest = FetchRequest<Quake>(fetchRequest: request)
    ///     var quakes: FetchedResults<Quake> { fetchRequest.wrappedValue }
    ///
    /// The `wrappedValue` property returns an empty array when there are no
    /// fetched results --- for example, because no entities satisfy the
    /// predicate, or because the data store is empty.
    @MainActor public var wrappedValue: FetchedResults<Result> { get }

    /// The request's configurable properties.
    ///
    /// You initialize a ``FetchRequest`` with an optional predicate and
    /// sort descriptors, either explicitly or using a configured
    /// <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>.
    /// Later, you can dynamically update the predicate and sort
    /// parameters using the request's configuration structure.
    ///
    /// You access or bind to a request's configuration components through
    /// properties on the associated ``FetchedResults`` instance.
    ///
    /// ### Configure using a binding
    ///
    /// Get a ``Binding`` to a fetch request's configuration structure
    /// by accessing the request's ``FetchRequest/projectedValue``, which you
    /// do by using the dollar sign (`$`) prefix on the associated
    /// results property. For example, you can create a request for `Quake`
    /// entities --- a managed object type that the
    /// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
    /// sample code project defines --- that initially sorts the results by time:
    ///
    ///     @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)])
    ///     private var quakes: FetchedResults<Quake>
    ///
    /// Then you can bind the request's sort descriptors,
    /// which you access through the `quakes` result, to those
    /// of a ``Table`` instance:
    ///
    ///     Table(quakes, sortOrder: $quakes.sortDescriptors) {
    ///         TableColumn("Place", value: \.place)
    ///         TableColumn("Time", value: \.time) { quake in
    ///             Text(quake.time, style: .time)
    ///         }
    ///     }
    ///
    /// A user who clicks on a table column header initiates the following
    /// sequence of events:
    /// 1. The table updates the sort descriptors through the binding.
    /// 2. The modified sort descriptors reconfigure the request.
    /// 3. The reconfigured request fetches new results.
    /// 4. SwiftUI redraws the table in response to new results.
    ///
    /// ### Set configuration directly
    ///
    /// If you need to access the fetch request's configuration elements
    /// directly, use the ``FetchedResults/nsPredicate`` and
    /// ``FetchedResults/sortDescriptors`` or
    /// ``FetchedResults/nsSortDescriptors`` properties of the
    /// ``FetchedResults`` instance. Continuing the example above, to
    /// enable the user to dynamically update the predicate, declare a
    /// ``State`` property to hold a query string:
    ///
    ///     @State private var query = ""
    ///
    /// Then add an ``View/onChange(of:perform:)`` modifier to the ``Table``
    /// that sets a new predicate any time the query changes:
    ///
    ///     .onChange(of: query) { value in
    ///         quakes.nsPredicate = query.isEmpty
    ///             ? nil
    ///             : NSPredicate(format: "place CONTAINS %@", value)
    ///     }
    ///
    /// To give the user control over the string, add a ``TextField`` in your
    /// user interface that's bound to the `query` state:
    ///
    ///     TextField("Filter", text: $query)
    ///
    /// When the user types into the text field, the predicate updates,
    /// the request fetches new results, and SwiftUI redraws the table.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public struct Configuration {

        /// The request's sort descriptors, accessed as reference types.
        ///
        /// Set this configuration value to cause a ``FetchRequest`` to execute
        /// a fetch with a new collection of
        /// <doc://com.apple.documentation/documentation/Foundation/NSSortDescriptor>
        /// instances. If you want to use
        /// <doc://com.apple.documentation/documentation/Foundation/SortDescriptor>
        /// instances, set ``FetchRequest/Configuration/sortDescriptors``
        /// instead.
        ///
        /// Access this value of a ``FetchRequest/Configuration`` structure for
        /// a given request by using the ``FetchedResults/nsSortDescriptors``
        /// property on the associated ``FetchedResults`` instance, either
        /// directly or through a ``Binding``.
        public var nsSortDescriptors: [NSSortDescriptor]

        /// The request's predicate.
        ///
        /// Set this configuration value to cause a ``FetchRequest`` to execute
        /// a fetch with a new predicate.
        ///
        /// Access this value of a ``FetchRequest/Configuration`` structure for
        /// a given request by using the ``FetchedResults/nsPredicate``
        /// property on the associated ``FetchedResults`` instance, either
        /// directly or through a ``Binding``.
        public var nsPredicate: NSPredicate?
    }

    /// A binding to the request's mutable configuration properties.
    ///
    /// SwiftUI returns the value associated with this property when you use
    /// ``FetchRequest`` as a property wrapper on a ``FetchedResults`` instance,
    /// and then access the results with a dollar sign (`$`) prefix. The value
    /// that SwiftUI returns is a ``Binding`` to the request's
    /// ``FetchRequest/Configuration`` structure, which dynamically
    /// configures the request.
    ///
    /// For example, consider the following fetch request for a type that the
    /// <doc://com.apple.documentation/documentation/CoreData/loading_and_displaying_a_large_data_feed>
    /// sample code project defines to store earthquake data, sorted based on
    /// the `time` property:
    ///
    ///     @FetchRequest(sortDescriptors: [SortDescriptor(\.time, order: .reverse)])
    ///     private var quakes: FetchedResults<Quake>
    ///
    /// You can use the projected value to enable a ``Table`` instance to make
    /// updates:
    ///
    ///     Table(quakes, sortOrder: $quakes.sortDescriptors) {
    ///         TableColumn("Place", value: \.place)
    ///         TableColumn("Time", value: \.time) { quake in
    ///             Text(quake.time, style: .time)
    ///         }
    ///     }
    ///
    /// Because you initialize the table using a binding to the descriptors,
    /// the table can modify the sort in response to actions that the user
    /// takes, like clicking a column header.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    @MainActor public var projectedValue: Binding<FetchRequest<Result>.Configuration> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest : DynamicProperty {

    /// Updates the fetched results.
    ///
    /// SwiftUI calls this function before rendering a view's
    /// ``View/body-swift.property`` to ensure the view has the most recent
    /// fetched results.
    @MainActor public mutating func update() { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest {

    /// Creates a fetch request for a specified entity description, based on a
    /// predicate and sort parameters.
    ///
    /// Use this initializer if you need to explicitly specify the entity type
    /// for the request. If you specify a placeholder `Result` type in the
    /// request declaration, use the
    /// ``init(sortDescriptors:predicate:animation:)-4obxy`` initializer to
    /// let the request infer the entity type. If you need more control over
    /// the fetch request configuration, use ``init(fetchRequest:animation:)``.
    ///
    /// - Parameters:
    ///   - entity: The description of the Core Data entity to fetch.
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(entity: NSEntityDescription, sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }

    /// Creates a fully configured fetch request that uses the specified
    /// animation when updating results.
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
    /// Use the request to define a ``FetchedResults`` property:
    ///
    ///     @FetchRequest(fetchRequest: Quake.request)
    ///     private var quakes: FetchedResults<Quake>
    ///
    /// If you only need to configure the request's predicate and sort
    /// descriptors, use ``init(sortDescriptors:predicate:animation:)-462jp``
    /// instead. If you need to specify a ``Transaction`` rather than an
    /// optional ``Animation``, use ``init(fetchRequest:transaction:)``.
    ///
    /// - Parameters:
    ///   - fetchRequest: An
    ///     <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>
    ///     instance that describes the search criteria for retrieving data
    ///     from the persistent store.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(fetchRequest: NSFetchRequest<Result>, animation: Animation? = nil) { }

    /// Creates a fully configured fetch request that uses the specified
    /// transaction when updating results.
    ///
    /// Use this initializer if you need a fetch request with updates that
    /// affect the user interface based on a ``Transaction``. Otherwise, use
    /// ``init(fetchRequest:animation:)``.
    ///
    /// - Parameters:
    ///   - fetchRequest: An
    ///     <doc://com.apple.documentation/documentation/CoreData/NSFetchRequest>
    ///     instance that describes the search criteria for retrieving data
    ///     from the persistent store.
    ///   - transaction: A transaction to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(fetchRequest: NSFetchRequest<Result>, transaction: Transaction) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension FetchRequest where Result : NSManagedObject {

    /// Creates a fetch request based on a predicate and reference type sort
    /// parameters.
    ///
    /// The request gets the entity type from the `Result` instance by calling
    /// that managed object's
    /// <doc://com.apple.documentation/documentation/CoreData/NSManagedObject/1640588-entity>
    /// type method. If you need to specify the entity type explicitly, use the
    /// ``init(entity:sortDescriptors:predicate:animation:)`` initializer
    /// instead. If you need more control over the fetch request configuration,
    /// use ``init(fetchRequest:animation:)``. For value type sort
    /// descriptors, use ``init(sortDescriptors:predicate:animation:)-462jp``.
    ///
    /// - Parameters:
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(sortDescriptors: [NSSortDescriptor], predicate: NSPredicate? = nil, animation: Animation? = nil) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension FetchRequest where Result : NSManagedObject {

    /// Creates a fetch request based on a predicate and value type sort
    /// parameters.
    ///
    /// The request gets the entity type from the `Result` instance by calling
    /// that managed object's
    /// <doc://com.apple.documentation/documentation/CoreData/NSManagedObject/1640588-entity>
    /// type method. If you need to specify the entity type explicitly, use the
    /// ``init(entity:sortDescriptors:predicate:animation:)`` initializer
    /// instead. If you need more control over the fetch request configuration,
    /// use ``init(fetchRequest:animation:)``. For reference type sort
    /// descriptors, use ``init(sortDescriptors:predicate:animation:)-4obxy``.
    ///
    /// - Parameters:
    ///   - sortDescriptors: An array of sort descriptors that define the sort
    ///     order of the fetched results.
    ///   - predicate: An
    ///     <doc://com.apple.documentation/documentation/Foundation/NSPredicate>
    ///     instance that defines logical conditions used to filter the fetched
    ///     results.
    ///   - animation: The animation to use for user interface changes that
    ///     result from changes to the fetched results.
    @MainActor public init(sortDescriptors: [SortDescriptor<Result>], predicate: NSPredicate? = nil, animation: Animation? = nil) { }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension FetchRequest.Configuration where Result : NSManagedObject {

    /// The request's sort descriptors, accessed as value types.
    ///
    /// Set this configuration value to cause a ``FetchRequest`` to execute a
    /// fetch with a new collection of
    /// <doc://com.apple.documentation/documentation/Foundation/SortDescriptor>
    /// instances. If you want to use
    /// <doc://com.apple.documentation/documentation/Foundation/NSSortDescriptor>
    /// instances, set ``FetchRequest/Configuration/nsSortDescriptors`` instead.
    ///
    /// Access this value of a ``FetchRequest/Configuration`` structure for
    /// a given request by using the ``FetchedResults/sortDescriptors``
    /// property on the associated ``FetchedResults`` instance, either
    /// directly or through a ``Binding``.
    public var sortDescriptors: [SortDescriptor<Result>]
}
