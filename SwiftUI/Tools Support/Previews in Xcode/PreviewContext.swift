/// A specification for the context of a ``PreviewContext``
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol PreviewContext { }
extension PreviewContext {

    /// Returns the context's value of `Key`, or `Key.defaultValue`
    /// if the context does not define a value for the key.
    subscript<Key>(key: Key.Type) -> Key.Value where Key : PreviewContextKey { get }
}
