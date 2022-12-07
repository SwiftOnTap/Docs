@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Assigns a name to the view's coordinate space, so other code can operate
    /// on dimensions like points and sizes relative to the named space.
    ///
    /// Use `coordinateSpace(name:)` to allow another function to find and
    /// operate on a view and operate on dimensions relative to that view.
    ///
    /// The example below demonstrates how a nested view can find and operate on
    /// its enclosing view's coordinate space:
    ///
    ///     struct ContentView: View {
    ///         @State var location = CGPoint.zero
    ///
    ///         var body: some View {
    ///             VStack {
    ///                 Color.red.frame(width: 100, height: 100)
    ///                     .overlay(circle)
    ///                 Text("Location: \(Int(location.x)), \(Int(location.y))")
    ///             }
    ///             .coordinateSpace(name: "stack")
    ///         }
    ///
    ///         var circle: some View {
    ///             Circle()
    ///                 .frame(width: 25, height: 25)
    ///                 .gesture(drag)
    ///                 .position(location)
    ///         }
    ///
    ///         var drag: some Gesture {
    ///             DragGesture(coordinateSpace: .named("stack"))
    ///                 .onChanged { info in location = info.location }
    ///         }
    ///     }
    ///
    /// ![A gif displaying a red square overlaid with a small black
    /// circle in its top left corner. Underneath, the text reads "Location: 0, 0".
    /// When the cursor is used to drag the circle around and outside the square,
    /// the coordinates in the location text change to reflect the new location
    /// of the circle within the coordinate space.](coord-space-name.gif)
    ///
    /// Here, the ``VStack`` in the `ContentView` named `"stack"` is composed of a
    /// red frame with a custom ``Circle`` view ``View/overlay(_:alignment:)``
    /// at its center.
    ///
    /// The `circle` view has an attached ``DragGesture`` that targets the
    /// enclosing VStack's coordinate space. As the gesture recognizer's closure
    /// registers events inside ``circle`` it stores them in the shared `location`
    /// state variable and the ``VStack`` displays the coordinates in a ``Text``
    /// view.
    ///
    /// - Parameter name: A name used to identify this coordinate space.
    @inlinable public func coordinateSpace<T>(name: T) -> some View where T : Hashable { }

}

