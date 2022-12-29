/// A property wrapper that is used in ``App`` to provide a delegate from UIKit.
@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@propertyWrapper public struct UIApplicationDelegateAdaptor<DelegateType> : DynamicProperty where DelegateType : NSObject, DelegateType : UIApplicationDelegate {

    /// The underlying delegate.
    public var wrappedValue: DelegateType { get }

    /// Creates an ``UIApplicationDelegateAdaptor`` using a UIKit Application
    /// Delegate.
    ///
    /// The framework will initialize the provided delegate and manage its
    /// lifetime, calling out to it when appropriate after performing its
    /// own work.
    ///
    /// - Parameter delegate: the type of `UIApplicationDelegate` to use.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) { }
}

@available(iOS 14.0, tvOS 14.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension UIApplicationDelegateAdaptor where DelegateType : ObservableObject {

    /// Creates an ``UIApplicationDelegateAdaptor`` using a UIKit
    /// Application Delegate.
    ///
    /// The framework will initialize the provided delegate and manage its
    /// lifetime, calling out to it when appropriate after performing its
    /// own work.
    ///
    /// - Parameter delegate: the type of `UIApplicationDelegate` to use.
    /// - Note: the instantiated delegate will be placed in the Environment
    ///   and may be accessed by using the `@EnvironmentObject` property wrapper
    ///   in the view hierarchy.
    public init(_ delegateType: DelegateType.Type = DelegateType.self) { }

    /// A projection of the observed object that creates bindings to its
    /// properties using dynamic member lookup.
    ///
    /// Use the projected value to pass a binding value down a view
    /// hierarchy. To get the `projectedValue`, prefix the property
    /// variable with `$`.
    public var projectedValue: ObservedObject<DelegateType>.Wrapper { get }
}

