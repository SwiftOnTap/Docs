/// A gesture that recognizes one or more taps.
///
/// To recognize a tap gesture on a view, create and configure the gesture, and
/// then add it to the view using the ``View/gesture(_:including:)`` modifier.
/// The following code adds a tap gesture to a ``Circle`` that toggles the color
/// of the circle.
///
///     struct TapGestureView: View {
///         @State var tapped = false
///
///         var tap: some Gesture {
///             TapGesture(count: 1)
///                 .onEnded { _ in self.tapped = !self.tapped }
///         }
///
///         var body: some View {
///             Circle()
///                 .fill(self.tapped ? Color.blue : Color.red)
///                 .frame(width: 100, height: 100, alignment: .center)
///                 .gesture(tap)
///         }
///     }
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct TapGesture : Gesture {

    /// The required number of tap events.
    public var count: Int

    /// Creates a tap gesture with the number of required taps.
    ///
    /// - Parameter count: The required number of taps to complete the tap
    ///   gesture.
    public init(count: Int = 1) { }

    /// The type representing the gesture's value.
    public typealias Value = ()

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

