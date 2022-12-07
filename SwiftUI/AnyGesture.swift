/// A type-erased gesture.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct AnyGesture<Value> : Gesture {

    /// Creates an instance from another gesture.
    ///
    /// - Parameter gesture: A gesture that you use to create a new gesture.
    public init<T>(_ gesture: T) where Value == T.Value, T : Gesture { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

