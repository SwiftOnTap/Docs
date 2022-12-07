/// An opaque value derived from an anchor source and a particular view.
///
/// You can convert the anchor to a `Value` in the coordinate space of a target
/// view by using a ``GeometryProxy`` to specify the target view.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Anchor<Value> {

    /// A type-erased geometry value that produces an anchored value of a given
    /// type.
    ///
    /// SwiftUI passes anchored geometry values around the view tree via
    /// preference keys. It then converts them back into the local coordinate
    /// space using a ``GeometryProxy`` value.
    @frozen public struct Source {
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGRect {

    /// Returns an anchor source rect defined by `r` in the current view.
    public static func rect(_ r: CGRect) -> Anchor<Value>.Source { }

    /// An anchor source rect defined as the entire bounding rect of the current
    /// view.
    public static var bounds: Anchor<CGRect>.Source { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source where Value == CGPoint {

    /// Returns an anchor source point defined by a point `p` in the current view.
    ///
    /// - Parameter p: The `CGPoint` to anchor.
    public static func point(_ p: CGPoint) -> Anchor<Value>.Source { }

    /// Returns an anchor source point defined by a point `p` in the current view.
    ///
    /// - Parameter p: The ``UnitPoint`` to anchor.
    public static func unitPoint(_ p: UnitPoint) -> Anchor<Value>.Source { }

    /// An anchor source point defined by the top leading corner of the current view.
    public static var topLeading: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the center of the top edge of the current view.
    public static var top: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the top trailing corner of the current view.
    public static var topTrailing: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the center of the leading edge of the current view.
    public static var leading: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the center point of the current view.
    public static var center: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the center of the trailing edge of the current view.
    public static var trailing: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the bottom leading corner of the current view.
    public static var bottomLeading: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the center of the bottom edge of the current view.
    public static var bottom: Anchor<CGPoint>.Source { get }

    /// An anchor source point defined by the bottom trailing corner of the current view.
    public static var bottomTrailing: Anchor<CGPoint>.Source { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    /// Creates an anchor source with generic type array from an array of anchor source.
    ///
    /// - Parameter array: The array of anchor source points.
    public init<T>(_ array: [Anchor<T>.Source]) where Value == [T] { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Anchor.Source {

    /// Creates an anchor source with generic type optional from an optional anchor source.
    ///
    /// - Parameter anchor: The optional anchor source.
    public init<T>(_ anchor: Anchor<T>.Source?) where Value == T? { }
}

