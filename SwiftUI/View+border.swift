@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that places a view in front of the current view.
    ///
    /// The layout of the original view will be unchanged from this. Its original
    /// size and location will stay the same.
    ///
    /// If you would like to place a view behind your current view instead,
    /// you can use the `background(_:alignment:)` function.
    ///
    /// ```
    /// struct OverlayView: View {
    ///     var body: some View {
    ///         Text("I'm covered by clouds")
    ///             .overlay(Text("🌤⛅️☁️🌦"))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text across the center that reads "I'm covered by
    /// clouds," which is obscured by cloud emojis rendered by the overlay view modifier.
    /// The alignment of the text defaults to center.](overlay.png)
    ///
    /// Check out ``View/background(_:alignment:)``, which is the opposite
    /// modifier.
    ///
    /// - Parameters:
    ///   - overlay: The view to place in front.
    ///   - alignment: Where to align the in-front view relative to the current view. Defaults to center.
    @inlinable public func overlay<Overlay>(_ overlay: Overlay, alignment: Alignment = .center) -> some View where Overlay : View { }


    /// A view modifier that adds a border to the view with the specified style and width.
    ///
    /// Use `border(_:width:)` to draw a border of a specified width around the
    /// view's frame. By default, the border appears inside the bounds of this
    /// view. In this example, the four-point wide border covers the text:
    ///
    /// ```
    /// struct BorderView: View {
    ///     var body: some View {
    ///         Text("Purple border inside the view bounds")
    ///             .border(Color.purple, width: 4)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text in the center fit directly into a purple
    /// rectangular border which reads "Purple border inside the view bounds,"
    /// demonstrating that the border is rendered inside the view bounds by default.](border-1.png)
    ///
    /// To place a border around the outside of this view, apply padding of the
    /// same width before adding the border:
    ///
    /// ```
    /// struct PaddedBorderView: View {
    ///     var body: some View {
    ///         Text("Purple border outside the view bounds.")
    ///             .padding(4)
    ///             .border(Color.purple, width: 4)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text in the center fit with minor empty space into a purple
    /// rectangular border which reads "Purple border outside the view bounds,"
    /// demonstrating that the border is rendered outside the view bounds
    /// when padding is added that matches the width of the border itself.](border-2.png)
    ///
    /// A border doesn't have to be a plain color - it can be any ``ShapeStyle``, for example,
    /// a ``LinearGradient``:
    ///
    /// ```
    /// struct GradientBorderView: View {
    ///     var body: some View {
    ///         Text("Gradient border.")
    ///             .border(LinearGradient(gradient: Gradient(colors: [.purple, .pink]),
    ///                                    startPoint: .top,
    ///                                    endPoint: .bottom), width: 4)
    ///     }
    /// }
    /// ```
    ///
    /// ![](border-3.png)
    ///
    /// - Parameters:
    ///   - content: The border style.
    ///   - width: The thickness of the border; if not provided, the default is
    ///     1 pixel.
    ///
    /// - Returns: A view that adds a border with the specified style and width
    ///   to this view.
    @inlinable public func border<S>(_ content: S, width: CGFloat = 1) -> some View where S : ShapeStyle { }

}

