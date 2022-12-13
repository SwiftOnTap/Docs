/// A gesture that updates the state provided by a gesture's updating callback.
///
/// A gesture's ``Gesture/updating(_:body:)`` callback returns a
/// ``GestureStateGesture`` instance for updating a transient state property
/// that's annotated with the ``GestureState`` property wrapper.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct GestureStateGesture<Base, State> : Gesture where Base : Gesture {

    /// The type representing the gesture's value.
    public typealias Value = Base.Value

    /// The originating gesture.
    public var base: Base

    /// A value that changes as the user performs the gesture.
    public var state: GestureState<State>

    /// The updating gesture containing the originating gesture's value, the
    /// updated state of the gesture, and a transaction.
    public var body: (GestureStateGesture<Base, State>.Value, inout State, inout Transaction) -> Void

    /// Creates a new gesture that's the result of an ongoing gesture.
    ///
    /// - Parameters:
    ///   - base: The originating gesture.
    ///   - state: The wrapped value of a ``GestureState`` property.
    ///   - body: The callback that SwiftUI invokes as the gesture's value
    ///     changes.
    @inlinable public init(base: Base, state: GestureState<State>, body: @escaping (GestureStateGesture<Base, State>.Value, inout State, inout Transaction) -> Void) { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

