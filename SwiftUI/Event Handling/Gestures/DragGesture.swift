/// A dragging motion that invokes an action as the drag-event sequence changes.
///
/// To recognize a drag gesture on a view, create and configure the gesture, and
/// then add it to the view using the ``View/gesture(_:including:)`` modifier.
///
/// Add a drag gesture to a ``Circle`` and change its color while the user
/// performs the drag gesture:
///
/// ```
/// struct DragGestureView: View {
///     @State private var location: CGPoint = CGPoint(x: 50, y: 50);
///     @State var isDragging = false
///
///     var simpleDrag: some Gesture {
///         DragGesture()
///             .onChanged { value in
///                 self.location = value.location
///                 self.isDragging = true
///
///             }
///             .onEnded {_ in self.isDragging = false}
///     }
///
///     var body: some View {
///         Circle()
///             .fill(self.isDragging ? Color.red : Color.yellow)
///             .frame(width: 100, height: 100)
///             .position(location)
///             .gesture(simpleDrag)
///     }
/// }
/// ```
///
/// ![A gif displaying a view contining a drag gesture and a circle, connected
/// by state variables; when  dragged, the circle turns from yellow to red.](drag-gesture-example.gif)
///
@available(iOS 13.0, macOS 10.15, watchOS 6.0, *)
@available(tvOS, unavailable)
public struct DragGesture : Gesture {

    /// The attributes of a drag gesture.
    public struct Value : Equatable {

        /// The time associated with the drag gesture's current event.
        public var time: Date

        /// The location of the drag gesture's current event.
        public var location: CGPoint

        /// The location of the drag gesture's first event.
        public var startLocation: CGPoint

        /// The total translation from the start of the drag gesture to the
        /// current event of the drag gesture.
        ///
        /// This is equivalent to `location.{x,y} - startLocation.{x,y}`.
        public var translation: CGSize { get }

        /// A prediction, based on the current drag velocity, of where the final
        /// location will be if dragging stopped now.
        public var predictedEndLocation: CGPoint { get }

        /// A prediction, based on the current drag velocity, of what the final
        /// translation will be if dragging stopped now.
        public var predictedEndTranslation: CGSize { get }

    }

    /// The minimum dragging distance before the gesture succeeds.
    public var minimumDistance: CGFloat

    /// The coordinate space in which to receive location values.
    public var coordinateSpace: CoordinateSpace

    /// Creates a dragging gesture with the minimum dragging distance before the
    /// gesture succeeds and the coordinate space of the gesture's location.
    ///
    /// - Parameters:
    ///   - minimumDistance: The minimum dragging distance for the gesture to
    ///     succeed.
    ///   - coordinateSpace: The coordinate space of the dragging gesture's
    ///     location.
    public init(minimumDistance: CGFloat = 10, coordinateSpace: CoordinateSpace = .local) { }

    /// The type of gesture representing the body of `Self`.
    public typealias Body = Never
}

