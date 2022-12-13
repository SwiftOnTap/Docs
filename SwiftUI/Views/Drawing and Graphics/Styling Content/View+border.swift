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
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use `overlay(alignment:content:)` instead.")
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

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {

    /// Layers the views that you specify in front of this view.
    ///
    /// Use this modifier to place one or more views in front of another view.
    /// For example, you can place a group of stars on a ``RoundedRectangle``:
    ///
    ///     RoundedRectangle(cornerRadius: 8)
    ///         .frame(width: 200, height: 100)
    ///         .overlay(alignment: .topLeading) { Star(color: .red) }
    ///         .overlay(alignment: .topTrailing) { Star(color: .yellow) }
    ///         .overlay(alignment: .bottomLeading) { Star(color: .green) }
    ///         .overlay(alignment: .bottomTrailing) { Star(color: .blue) }
    ///
    /// The example above assumes that you've defined a `Star` view with a
    /// parameterized color:
    ///
    ///     struct Star: View {
    ///         var color = Color.yellow
    ///
    ///         var body: some View {
    ///             Image(systemName: "star.fill")
    ///                 .foregroundStyle(color)
    ///         }
    ///     }
    ///
    /// By setting different `alignment` values for each modifier, you make the
    /// stars appear in different places on the rectangle:
    ///
    /// ![A screenshot of a rounded rectangle with a star in each corner. The
    /// star in the upper-left is red; the start in the upper-right is yellow;
    /// the star in the lower-left is green; the star the lower-right is
    /// blue.](View-overlay-2)
    ///
    /// If you specify more than one view in the `content` closure, the modifier
    /// collects all of the views in the closure into an implicit ``ZStack``,
    /// taking them in order from back to front. For example, you can place a
    /// star and a ``Circle`` on a field of ``ShapeStyle/blue``:
    ///
    ///     Color.blue
    ///         .frame(width: 200, height: 200)
    ///         .overlay {
    ///             Circle()
    ///                 .frame(width: 100, height: 100)
    ///             Star()
    ///         }
    ///
    /// Both the overlay modifier and the implicit ``ZStack`` composed from the
    /// overlay content --- the circle and the star --- use a default
    /// ``Alignment/center`` alignment. The star appears centered on the circle,
    /// and both appear as a composite view centered in front of the square:
    ///
    /// ![A screenshot of a star centered on a circle, which is
    /// centered on a square.](View-overlay-3)
    ///
    /// If you specify an alignment for the overlay, it applies to the implicit
    /// stack rather than to the individual views in the closure. You can see
    /// this if you add the ``Alignment/bottom`` alignment:
    ///
    ///     Color.blue
    ///         .frame(width: 200, height: 200)
    ///         .overlay(alignment: .bottom) {
    ///             Circle()
    ///                 .frame(width: 100, height: 100)
    ///             Star()
    ///         }
    ///
    /// The circle and the star move down as a unit to align the stack's bottom
    /// edge with the bottom edge of the square, while the star remains
    /// centered on the circle:
    ///
    /// ![A screenshot of a star centered on a circle, which is on a square.
    /// The circle's bottom edge is aligned with the square's bottom
    /// edge.](View-overlay-3a)
    ///
    /// To control the placement of individual items inside the `content`
    /// closure, either use a different overlay modifier for each item, as the
    /// earlier example of stars in the corners of a rectangle demonstrates, or
    /// add an explicit ``ZStack`` inside the content closure with its own
    /// alignment:
    ///
    ///     Color.blue
    ///         .frame(width: 200, height: 200)
    ///         .overlay(alignment: .bottom) {
    ///             ZStack(alignment: .bottom) {
    ///                 Circle()
    ///                     .frame(width: 100, height: 100)
    ///                 Star()
    ///             }
    ///         }
    ///
    /// The stack alignment ensures that the star's bottom edge aligns with the
    /// circle's, while the overlay aligns the composite view with the square:
    ///
    /// ![A screenshot of a star, a circle, and a square with all their
    /// bottom edges aligned.](View-overlay-4)
    ///
    /// You can achieve layering without an overlay modifier by putting both the
    /// modified view and the overlay content into a ``ZStack``. This can
    /// produce a simpler view hierarchy, but changes the layout priority that
    /// SwiftUI applies to the views. Use the overlay modifier when you want the
    /// modified view to dominate the layout.
    ///
    /// If you want to specify a ``ShapeStyle`` like a ``Color`` or a
    /// ``Material`` as the overlay, use
    /// ``View/overlay(_:ignoresSafeAreaEdges:)`` instead. To specify a
    /// ``Shape``, use ``View/overlay(_:in:fillStyle:)``.
    ///
    /// - Parameters:
    ///   - alignment: The alignment that the modifier uses to position the
    ///     implicit ``ZStack`` that groups the foreground views. The default
    ///     is ``Alignment/center``.
    ///   - content: A ``ViewBuilder`` that you use to declare the views to
    ///     draw in front of this view, stacked in the order that you list them.
    ///     The last view that you list appears at the front of the stack.
    ///
    /// - Returns: A view that uses the specified content as a foreground.
    @inlinable public func overlay<V>(alignment: Alignment = .center, @ViewBuilder content: () -> V) -> some View where V : View


    /// Layers the specified style in front of this view.
    ///
    /// Use this modifier to layer a type that conforms to the ``ShapeStyle``
    /// protocol, like a ``Color``, ``Material``, or ``HierarchicalShapeStyle``,
    /// in front of a view. For example, you can overlay the
    /// ``ShapeStyle/ultraThinMaterial`` over a ``Circle``:
    ///
    ///     struct CoveredCircle: View {
    ///         var body: some View {
    ///             Circle()
    ///                 .frame(width: 300, height: 200)
    ///                 .overlay(.ultraThinMaterial)
    ///         }
    ///     }
    ///
    /// SwiftUI anchors the style to the view's bounds. For the example above,
    /// the overlay fills the entirety of the circle's frame (which happens
    /// to be wider than the circle is tall):
    ///
    /// ![A screenshot of a circle showing through a rectangle that imposes
    /// a blurring effect.](View-overlay-5)
    ///
    /// SwiftUI also limits the style's extent to the view's
    /// container-relative shape. You can see this effect if you constrain the
    /// `CoveredCircle` view with a ``View/containerShape(_:)`` modifier:
    ///
    ///     CoveredCircle()
    ///         .containerShape(RoundedRectangle(cornerRadius: 30))
    ///
    /// The overlay takes on the specified container shape:
    ///
    /// ![A screenshot of a circle showing through a rounded rectangle that
    /// imposes a blurring effect.](View-overlay-6)
    ///
    /// By default, the overlay ignores safe area insets on all edges, but you
    /// can provide a specific set of edges to ignore, or an empty set to
    /// respect safe area insets on all edges:
    ///
    ///     Rectangle()
    ///         .overlay(
    ///             .secondary,
    ///             ignoresSafeAreaEdges: []) // Ignore no safe area insets.
    ///
    /// If you want to specify a ``View`` or a stack of views as the overlay
    /// rather than a style, use ``View/overlay(alignment:content:)`` instead.
    /// If you want to specify a ``Shape``, use
    /// ``View/overlay(_:in:fillStyle:)``.
    ///
    /// - Parameters:
    ///   - style: An instance of a type that conforms to ``ShapeStyle`` that
    ///     SwiftUI layers in front of the modified view.
    ///   - edges: The set of edges for which to ignore safe area insets
    ///     when adding the overlay. The default value is ``Edge/Set/all``.
    ///     Specify an empty set to respect safe area insets on all edges.
    ///
    /// - Returns: A view with the specified style drawn in front of it.
    @inlinable public func overlay<S>(_ style: S, ignoresSafeAreaEdges edges: Edge.Set = .all) -> some View where S : ShapeStyle


    /// Layers a shape that you specify in front of this view.
    ///
    /// Use this modifier to layer a type that conforms to the ``Shape``
    /// protocol --- like a ``Rectangle``, ``Circle``, or ``Capsule`` --- in
    /// front of a view. Specify a ``ShapeStyle`` that's used to fill the shape.
    /// For example, you can overlay the outline of one rectangle in front of
    /// another:
    ///
    ///     Rectangle()
    ///         .frame(width: 200, height: 100)
    ///         .overlay(.teal, in: Rectangle().inset(by: 10).stroke(lineWidth: 5))
    ///
    /// The example above uses the ``InsettableShape/inset(by:)`` method to
    /// slightly reduce the size of the overlaid rectangle, and the
    /// ``Shape/stroke(lineWidth:)`` method to fill only the shape's outline.
    /// This creates an inset border:
    ///
    /// ![A screenshot of a rectangle with a teal border that's
    /// inset from the edge.](View-overlay-7)
    ///
    /// This modifier is a convenience method for layering a shape over a view.
    /// To handle the more general case of overlaying a ``View`` --- or a stack
    /// of views --- with control over the position, use
    /// ``View/overlay(alignment:content:)`` instead. To cover a view with a
    /// ``ShapeStyle``, use ``View/overlay(_:ignoresSafeAreaEdges:)``.
    ///
    /// - Parameters:
    ///   - style: A ``ShapeStyle`` that SwiftUI uses to the fill the shape
    ///     that you specify.
    ///   - shape: An instance of a type that conforms to ``Shape`` that
    ///     SwiftUI draws in front of the view.
    ///   - fillStyle: The ``FillStyle`` to use when drawing the shape.
    ///     The default style uses the nonzero winding number rule and
    ///     antialiasing.
    ///
    /// - Returns: A view with the specified shape drawn in front of it.
    @inlinable public func overlay<S, T>(_ style: S, in shape: T, fillStyle: FillStyle = FillStyle()) -> some View where S : ShapeStyle, T : Shape

}
