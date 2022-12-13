/// A type-erased ShapeStyle value.
@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
@frozen public struct AnyShapeStyle : ShapeStyle {

    /// Create an instance from `style`.
    public init<S>(_ style: S) where S : ShapeStyle { }
}
