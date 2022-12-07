/// A way to turn a shape into a view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol ShapeStyle { }
extension ShapeStyle {
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle {

    /// Return a new paint value matching `self` except using `rect` to
    /// map unit-space coordinates to absolute coordinates.
    @inlinable public func `in`(_ rect: CGRect) -> some ShapeStyle { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ShapeStyle where Self : View, Self.Body == _ShapeView<Rectangle, Self> {

    /// Default `View.body` implementation to fill a Rectangle with `self`.
    public var body: _ShapeView<Rectangle, Self> { get }
}

