/// A gesture that recognizes a rotation motion and tracks the angle of the
/// rotation.
///
/// A rotation gesture tracks how a rotation event sequence changes. To
/// recognize a rotation gesture on a view, create and configure the gesture,
/// and then add it to the view using the ``View/gesture(_:including:)``
/// modifier.
///
/// Add a rotation gesture to a ``Rectangle`` and apply a rotation effect:
///
/// ![RotationGesture Example 1](rotation-gesture-example.gif)
///
///     struct RotationGestureView: View {
///         @State var angle = Angle(degrees: 0.0)
///
///         var rotation: some Gesture {
///             RotationGesture()
///                 .onChanged { angle in
///                     self.angle = angle
///                 }
///         }
///
///         var body: some View {
///             Rectangle()
///                 .frame(width: 200, height: 200, alignment: .center)
///                 .rotationEffect(self.angle)
///                 .gesture(rotation)
///         }
///     }
///
@available(iOS 13.0, macOS 10.15, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct RotationGesture : Gesture {

    /// The minimum delta required before the gesture succeeds.
    public var minimumAngleDelta: Angle

    /// Creates a rotation gesture with a minimum delta for the gesture to
    /// start.
    ///
    /// ![RotationGesture Example 2](rotation-gesture-example-2.gif)
    ///
    ///     struct RotationGestureView: View {
    ///         @State var angle = Angle(degrees: 0.0)
    ///
    ///         var rotation: some Gesture {
    ///             RotationGesture(minimumAngleDelta: .degrees(45))
    ///                 .onChanged { angle in
    ///                     self.angle = angle
    ///                 }
    ///         }
    ///
    ///         var body: some View {
    ///             ZStack {
    ///                 Rectangle()
    ///                     .fill(Color.yellow)
    ///                     .frame(width: 200, height: 200, alignment: .center)
    ///                     .rotationEffect(self.angle)
    ///                     .gesture(rotation)
    ///                 Text("Rotate Me")
    ///             }
    ///         }
    ///     }
    ///
    /// - Parameter minimumAngleDelta: The minimum delta required before the
    ///   gesture starts. The default value is a one-degree angle.
    public init(minimumAngleDelta: Angle = .degrees(1)) { }

    /// The type representing the gesture's value.
    public typealias Value = Angle

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

