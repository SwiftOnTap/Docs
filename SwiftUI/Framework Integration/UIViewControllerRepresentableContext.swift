/// Contextual information about the state of the system that you use to create
/// and update your UIKit view controller.
///
/// A ``UIViewControllerRepresentableContext`` structure contains details about
/// the current state of the system. When creating and updating your view
/// controller, the system creates one of these structures and passes it to the
/// appropriate method of your custom ``UIViewControllerRepresentable``
/// instance. Use the information in this structure to configure your view
/// controller. For example, use the provided environment values to configure
/// the appearance of your view controller and views. Don't create this
/// structure yourself.
@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public struct UIViewControllerRepresentableContext<Representable> where Representable : UIViewControllerRepresentable {

    /// The view's associated coordinator.
    public let coordinator: Representable.Coordinator

    /// The current transaction.
    public var transaction: Transaction { get }

    /// Environment values that describe the current state of the system.
    ///
    /// Use the environment values to configure the state of your UIKit view
    /// controller when creating or updating it.
    public var environment: EnvironmentValues { get }
}

