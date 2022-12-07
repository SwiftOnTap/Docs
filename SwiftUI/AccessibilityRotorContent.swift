/// Content within an accessibility rotor.
///
/// Generally generated from control flow constructs like `ForEach` and `if`, and
/// `AccessibilityRotorEntry`.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public protocol AccessibilityRotorContent {

    /// The type for the internal content of this `AccessibilityRotorContent`.
    associatedtype Body : AccessibilityRotorContent

    /// The internal content of this `AccessibilityRotorContent`.
    @AccessibilityRotorContentBuilder var body: Self.Body { get }
}
