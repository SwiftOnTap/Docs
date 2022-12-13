/// A gesture that's a sequence of two gestures.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SequenceGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of a sequence gesture that helps to detect whether the first
    /// gesture succeeded, so the second gesture can start.
    @frozen public enum Value {

        /// The first gesture hasn't ended.
        case first(First.Value)

        /// The first gesture has ended.
        case second(First.Value, Second.Value?)
    }

    /// The first gesture in a sequence of two gestures.
    public var first: First

    /// The second gesture in a sequence of two gestures.
    public var second: Second

    /// Creates a sequence gesture with two gestures.
    ///
    /// - Parameters:
    ///   - first: The first gesture of the sequence.
    ///   - second: The second gesture of the sequence.
    @inlinable public init(_ first: First, _ second: Second) { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SequenceGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SequenceGesture<First, Second>.Value, b: SequenceGesture<First, Second>.Value) -> Bool { }
}

