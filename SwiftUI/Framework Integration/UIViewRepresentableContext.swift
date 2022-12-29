/// Contextual information about the state of the system that you use to create
/// and update your UIKit view.
///
/// A ``UIViewRepresentableContext`` structure contains details about the
/// current state of the system. When creating and updating your view, the
/// system creates one of these structures and passes it to the appropriate
/// method of your custom ``UIViewRepresentable`` instance. Use the information
/// in this structure to configure your view. For example, use the provided
/// environment values to configure the appearance of your view. Don't create
/// this structure yourself.
///
/// This structure contains 3 values:
/// - ``UIViewRepresentableContext/coordinator``
/// - ``UIViewRepresentableContext/transaction``
/// - ``UIViewRepresentableContext/environment``
///
/// [[uiviewrepresentable-context]]
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIViewRepresentableContext<Representable> where Representable : UIViewRepresentable {

    /// The view's associated coordinator.
    public let coordinator: Representable.Coordinator

    /// The current transaction.
    public var transaction: Transaction { get }

    /// The current environment.
    ///
    /// Use the environment values to configure the state of your view when
    /// creating or updating it.
    public var environment: EnvironmentValues { get }
}

