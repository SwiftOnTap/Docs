/// An instance that matches a sequence of events to a gesture, and returns a
/// stream of values for each of its states.
///
/// Create custom gestures by declaring types that conform to the ``Gesture``
/// protocol.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Gesture { }
extension Gesture {

    /// The type representing the gesture's value.
    associatedtype Value

    /// The type of gesture representing the body of `Self`.
    associatedtype Body : Gesture

    /// The content and behavior of the gesture.
    var body: Self.Body { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Sequences a gesture with another one to create a new gesture, which
    /// results in the second gesture only receiving events after the first
    /// gesture succeeds.
    ///
    /// - Parameter other: A gesture you want to combine with another gesture to
    ///   create a new, sequenced gesture.
    ///
    /// - Returns: A gesture that's a sequence of two gestures.
    @inlinable public func sequenced<Other>(before other: Other) -> SequenceGesture<Self, Other> where Other : Gesture { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Combines a gesture with another gesture to create a new gesture that
    /// recognizes both gestures at the same time.
    ///
    /// - Parameter other: A gesture that you want to combine with your gesture
    ///   to create a new, combined gesture.
    ///
    /// - Returns: A gesture with two simultaneous gestures.
    @inlinable public func simultaneously<Other>(with other: Other) -> SimultaneousGesture<Self, Other> where Other : Gesture { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Adds an action to perform when the gesture ends.
    ///
    /// - Parameter action: The action to perform when this gesture ends. The
    ///   `action` closure's parameter contains the final value of the gesture.
    ///
    /// - Returns: A gesture that triggers `action` when the gesture ends.
    public func onEnded(_ action: @escaping (Self.Value) -> Void) -> _EndedGesture<Self> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture where Self.Value : Equatable {

    /// Adds an action to perform when the gesture's value changes.
    ///
    /// - Parameter action: The action to perform when this gesture's value
    ///   changes. The `action` closure's parameter contains the gesture's new
    ///   value.
    ///
    /// - Returns: A gesture that triggers `action` when this gesture's value
    ///   changes.
    public func onChanged(_ action: @escaping (Self.Value) -> Void) -> _ChangedGesture<Self> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Returns a gesture that's the result of mapping the given closure over
    /// the gesture.
    public func map<T>(_ body: @escaping (Self.Value) -> T) -> _MapGesture<Self, T> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Combines two gestures exclusively to create a new gesture where only one
    /// gesture succeeds, giving precedence to the first gesture.
    ///
    /// - Parameter other: A gesture you combine with your gesture, to create a
    ///   new, combined gesture.
    ///
    /// - Returns: A gesture that's the result of combining two gestures where
    ///   only one of them can succeed. SwiftUI gives precedence to the first
    ///   gesture.
    @inlinable public func exclusively<Other>(before other: Other) -> ExclusiveGesture<Self, Other> where Other : Gesture { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Gesture {

    /// Updates the provided gesture state property as the gesture's value
    /// changes.
    ///
    /// Use this callback to update transient UI state.
    ///
    /// - Parameters:
    ///   - state: A binding to a view's ``GestureState`` property.
    ///   - body: The callback that SwiftUI invokes as the gesture's value
    ///     changes. Its `currentState` parameter is the updated state of the
    ///     gesture. The ``gestureState`` parameter is the previous state of the
    ///     gesture, and the ``transaction`` is the context of the gesture.
    ///
    /// - Returns: A version of the gesture that updates the provided ``state`` as
    ///   the originating gesture's value changes, and that resets the ``state``
    ///   to its initial value when the users cancels or ends the gesture.
    @inlinable public func updating<State>(_ state: GestureState<State>, body: @escaping (Self.Value, inout State, inout Transaction) -> Void) -> GestureStateGesture<Self, State> { }
}

