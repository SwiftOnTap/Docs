@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Changes the tappable area of a content shape for hit testing.
    ///
    /// When using a container view, such as ``ZStack`` or ``VStack``, tap gestures
    /// are only applied to elements in the container which have content. For example,
    /// a tap gesture on a ``VStack`` with a ``Spacer`` will not be triggered
    /// when clicking on the spacer. However, setting the content shape allows
    /// everything in the container view to be clickable.
    ///
    /// For example, to make an entire `VStack` container clickable:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var toggleColor: Bool = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Top text").border(Color.black)
    ///             Spacer().frame(height: 50)
    ///
    ///             Rectangle()
    ///                 .fill(toggleColor ? Color.red : Color.blue)
    ///                 .frame(width: 150, height: 150)
    ///
    ///             Spacer().frame(height: 50)
    ///             Text("Bottom text").border(Color.black)
    ///         }
    ///         .contentShape(Rectangle())
    ///         .onTapGesture {
    ///             self.toggleColor.toggle()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a colored square in the center of the screen that has text
    /// both above and below it, with spacers in between. When anything in the
    /// container is clicked, the square color toggles from red to blue. Setting
    /// the content shape makes it so that the spacers are clickable as well.](contentshape-example-1.gif)
    ///
    /// For further clarification on how this works, see this animation of the
    /// same example from above **without** any defined `contentShape`. Notice how
    /// the rectangle color does not toggle when clicking on the spacers.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     @State private var toggleColor: Bool = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Text("Top text").border(Color.black)
    ///             Spacer().frame(height: 50)
    ///
    ///             Rectangle()
    ///                 .fill(toggleColor ? Color.red : Color.blue)
    ///                 .frame(width: 150, height: 150)
    ///
    ///             Spacer().frame(height: 50)
    ///             Text("Bottom text").border(Color.black)
    ///         }
    ///         .onTapGesture {
    ///             self.toggleColor.toggle()
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A gif with a colored square in the center of the screen that has text
    /// both above and below it, with spacers in between. When the text or the
    /// square itself are clicked, the square color toggles from red to blue. In
    /// this case, the content shape was not set, so the spacers are not clickable.](contentshape-example-2.gif)
    ///
    /// - Parameters:
    ///   - shape: The hit testing shape for the view.
    ///   - eoFill: A Boolean that indicates whether the shape is interpreted
    ///     with the even-odd winding number rule.
    ///
    /// - Returns: A view that uses the given shape for hit testing.
    @inlinable public func contentShape<S>(_ shape: S, eoFill: Bool = false) -> some View where S : Shape { }

}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Sets the content shape for this view.
    ///
    /// The content shape has a variety of uses. You can control the kind of the
    /// content shape by specifying one in `kind`. For example, the
    /// following example only sets the focus ring shape of the view, without
    /// affecting its shape for hit-testing:
    ///
    ///     MyFocusableView()
    ///         .contentShape(.focusEffect, Circle())
    ///
    /// - Parameters:
    ///   - kind: The kinds to apply to this content shape.
    ///   - shape: The shape to use.
    ///   - eoFill: A Boolean that indicates whether the shape is interpreted
    ///     with the even-odd winding number rule.
    ///
    /// - Returns: A view that uses the given shape for the specified kind.
    @inlinable public func contentShape<S>(_ kind: ContentShapeKinds, _ shape: S, eoFill: Bool = false) -> some View where S : Shape { }

}
