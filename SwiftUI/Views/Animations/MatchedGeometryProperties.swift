/// A set of view properties that may be synchronized between views
/// using the `View.matchedGeometryEffect()` function.
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@frozen public struct MatchedGeometryProperties : OptionSet {

    /// The view's position, in window coordinates.
    public static let position: MatchedGeometryProperties

    /// The view's size, in local coordinates.
    public static let size: MatchedGeometryProperties

    /// Both the `position` and `size` properties.
    public static let frame: MatchedGeometryProperties

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = MatchedGeometryProperties

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = MatchedGeometryProperties
}

