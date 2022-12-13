/// A gesture that consists of two gestures where only one of them can succeed.
///
/// The ``ExclusiveGesture`` gives precedence to its first gesture.
///
/// See ``Gesture/exclusively(before:)`` for more of an explanation and an example.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ExclusiveGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of an exclusive gesture that indicates which of two gestures
    /// succeeded.
    @frozen public enum Value {

        /// The first of two gestures succeeded.
        case first(First.Value)

        /// The second of two gestures succeeded.
        case second(Second.Value)
    }

    /// The first of two gestures.
    public var first: First

    /// The second of two gestures.
    public var second: Second

    /// Creates a gesture from two gestures where only one of them succeeds.
    ///
    /// - Parameters:
    ///   - first: The first of two gestures. This gesture has precedence over
    ///     the other gesture.
    ///   - second: The second of two gestures.
    @inlinable public init(_ first: First, _ second: Second) { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

