/// The key for a preview context.
///
/// The default value is nil.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public protocol PreviewContextKey { }
extension PreviewContextKey {

    /// The type of the value returned by the key.
    associatedtype Value

    /// The default value of the key.
    static var defaultValue: Self.Value { get }
}
