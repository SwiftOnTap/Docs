/// A protocol for identifier types used when publishing and observing focused
/// values.
///
/// Unlike ``EnvironmentKey``, `FocusedValuesHostKey` has no default value
/// requirement, because the default value for a key is always `nil`.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol FocusedValueKey { }
extension FocusedValueKey {

    /// The type of the value that the key-value pair is using.
    associatedtype Value
}

