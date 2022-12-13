/// A gesture containing two gestures that can happen at the same time with
/// neither of them preceding the other.
///
/// A simultaneous gesture is a container-event handler that evaluates its two
/// child gestures at the same time. Its value is a struct with two optional
/// values, each representing the phases of one of the two gestures.
///
/// ![SimultaneousGesture Example 1](simultaneous-gesture-example.gif)
///
/// See ``Gesture/simultaneously(with:)`` for more of an explanation and an example.
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct SimultaneousGesture<First, Second> : Gesture where First : Gesture, Second : Gesture {

    /// The value of a simultaneous gesture that indicates which of its two
    /// gestures receives events.
    @frozen public struct Value {

        /// The value of the first gesture.
        public var first: First.Value?

        /// The value of the second gesture.
        public var second: Second.Value?
    }

    /// The first of two gestures that can happen simultaneously.
    public var first: First

    /// The second of two gestures that can happen simultaneously.
    public var second: Second

    /// Creates a gesture with two gestures that can receive updates or succeed
    /// independently of each other.
    ///
    /// - Parameters:
    ///   - first: The first of two gestures that can happen simultaneously.
    ///   - second: The second of two gestures that can happen simultaneously.
    @inlinable public init(_ first: First, _ second: Second) { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Equatable where First.Value : Equatable, Second.Value : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: SimultaneousGesture<First, Second>.Value, b: SimultaneousGesture<First, Second>.Value) -> Bool { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension SimultaneousGesture.Value : Hashable where First.Value : Hashable, Second.Value : Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) { }
}

