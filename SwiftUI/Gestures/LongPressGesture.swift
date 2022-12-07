/// A gesture that succeeds when the user performs a long press.
///
/// To recognize a long-press gesture on a view, create and configure the
/// gesture, then add it to the view using the ``View/gesture(_:including:)``
/// modifier.
///
/// Add a long-press gesture to a ``Circle`` to animate its color from blue to
/// red, and then change it to green when the gesture ends:
///
///     struct LongPressGestureView: View {
///         @GestureState var isDetectingLongPress = false
///         @State var completedLongPress = false
///
///         var longPress: some Gesture {
///             LongPressGesture(minimumDuration: 3)
///                 .updating($isDetectingLongPress) { currentstate, gestureState,
///                         transaction in
///                     gestureState = currentstate
///                     transaction.animation = Animation.easeIn(duration: 2.0)
///                 }
///                 .onEnded { finished in
///                     self.completedLongPress = finished
///                 }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.isDetectingLongPress ?
///                     Color.red :
///                     (self.completedLongPress ? Color.green : Color.blue))
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(longPress)
///         }
///     }
@available(iOS 13.0, macOS 10.15, watchOS 6.0, tvOS 14.0, *)
public struct LongPressGesture : Gesture {

    /// The minimum duration of the long press that must elapse before the
    /// gesture succeeds.
    public var minimumDuration: Double

    /// The maximum distance that the long press can move before the gesture
    /// fails.
    @available(tvOS, unavailable)
    public var maximumDistance: CGFloat

    /// Creates a long-press gesture with a minimum duration and a maximum
    /// distance that the interaction can move before the gesture fails.
    ///
    /// - Parameters:
    ///   - minimumDuration: The minimum duration of the long press that must
    ///     elapse before the gesture succeeds.
    ///   - maximumDistance: The maximum distance that the fingers or cursor
    ///     performing the long press can move before the gesture fails.
    @available(tvOS, unavailable)
    public init(minimumDuration: Double = 0.5, maximumDistance: CGFloat = 10) { }

    /// The type representing the gesture's value.
    public typealias Value = Bool

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

