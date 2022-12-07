/// A gesture that recognizes a magnification motion and tracks the amount of
/// magnification.
///
/// A magnification gesture tracks how a magnification event sequence changes.
/// To recognize a magnification gesture on a view, create and configure the
/// gesture, and then add it to the view using the
/// ``View/gesture(_:including:)`` modifier.
///
/// Add a magnification gesture to a ``Circle`` that changes its size while the
/// user performs the gesture:
///
///     struct MagnificationGestureView: View {
///
///         @GestureState var magnifyBy = CGFloat(1.0)
///
///         var magnification: some Gesture {
///             MagnificationGesture()
///                 .updating($magnifyBy) { currentState, gestureState, transaction in
///                     gestureState = currentState
///                 }
///         }
///
///         var body: some View {
///             Circle()
///                 .frame(width: 100 * magnifyBy,
///                        height: 100 * magnifyBy,
///                        alignment: .center)
///                 .gesture(magnification)
///         }
///     }
///
/// ![A gif displaying a black circle in the center of the screen that is rendered
/// as both larger and smaller than its original size as the user interacts with its
/// magnification.](magnification-gesture-ex.gif)
///
/// The circle's size resets to its original size when the gesture finishes.
@available(iOS 13.0, macOS 10.15, *)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct MagnificationGesture : Gesture {

    /// The minimum required delta before the gesture starts.
    public var minimumScaleDelta: CGFloat

    /// Creates a magnification gesture with a given minimum delta for the
    /// gesture to start.
    ///
    /// - Parameter minimumScaleDelta: The minimum scale delta required before
    ///   the gesture starts.
    public init(minimumScaleDelta: CGFloat = 0.01) { }

    /// The type representing the gesture's value.
    public typealias Value = CGFloat

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

