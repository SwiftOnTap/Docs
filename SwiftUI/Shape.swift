/// A 2D shape that you can use when drawing a view.
///
/// This procol inherits from the ``View`` protocol, so all shapes can be
/// used just like any other view. However, there are many default methods
/// that shapes have which views do not.
///
/// ### Using a pre-defined shape
///
/// In addition to the ability to create your own shape, there are also
/// many pre-defined shapes for you to use:
/// 1. ``Capsule``
/// 2. ``Circle``
/// 3. ``ContainerRelativeShape``
/// 4. ``Ellipse``
/// 5. ``Path``
/// 6. ``Rectangle``
/// 7. ``RoundedRectangle``
///
/// Example usage would look like this:
///
/// ```
/// struct PillView: View {
///     var body: some View {
///         Capsule()
///     }
/// }
/// ```
///
/// ![A screenshot displaying a solid black capsule occupying most of the screen
/// space. Here, a predefined shape is used.](D07AE93B-5C76-4604-B601-456F32FBE16C.png)
///
/// Check out these shapes directly for more info on how to use them.
///
/// ### Creating your own shape
///
/// The only requirement of conforming to the shape protocol is implementing
/// the ``Shape/path(in:)`` method. This method passes in the shape's
/// bounding rectangle, and expects a ``Path`` object in return.
///
/// The most simple example of creating your own shape is a rectangle
/// that looks like this:
///
/// ```
/// struct SimplestShapeView: View {
///     var body: some View {
///         RectangleShape()
///     }
/// }
///
/// struct RectangleShape: Shape {
///     func path(in rect: CGRect) -> Path {
///         return Path(rect)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a solid black rectangle taking up the entirety of
/// the screen space besides the safe areas. The rectangle is created using
/// the path method.](09FB69B8-A5EF-4E46-9B27-4B59DF735287.png)
///
/// For more info on how to create a path from a bounding rectangle,
/// check out the ``Path`` structure.
///
/// - Note: In general, while view modifiers can be applied to shapes, note that
/// applying a view modifier will return a ``View`` rather than a shape.
/// Whenever possible, try to use shape modifiers instead of
/// view modifiers to accomplish the same tasks with your shapes.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol Shape : Animatable, View { }
extension Shape : Animatable, View {

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// This is the only requirement of conforming to the ``Shape`` protocol.
    /// Implement this method to create your own shapes.
    ///
    /// Check out ``Path`` more more info on how to create a path from
    /// the rectangle parameter.
    ///
    /// ```
    /// struct SimplestShapeView: View {
    ///     var body: some View {
    ///         RectangleShape()
    ///     }
    /// }
    ///
    /// struct RectangleShape: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         return Path(rect)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black rectangle taking up the entirety of
    /// the screen space besides the safe areas. The rectangle is created using
    /// the path method from a rectangle parameter.](rectangle-example-4.png)
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    func path(in rect: CGRect) -> Path { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Trims this shape by a fractional amount based on its representation as a
    /// path.
    ///
    /// To create a ``Shape`` instance, you define the shape's path using lines and
    /// curves. Use the `trim(from:to:)` method to draw a portion of a shape by
    /// ignoring portions of the beginning and ending of the shape's path.
    ///
    /// For example, if you're drawing a figure eight or infinity symbol (∞)
    /// starting from its center, setting the `startFraction` and `endFraction`
    /// to different values determines the parts of the overall shape.
    ///
    /// Here is a simplified infinity symbol, represented as a ``Path``:
    ///
    /// ```
    /// struct Infinity: Shape {
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { path in
    ///             path.addLines([
    ///                 CGPoint(x: 100, y: 50),
    ///                 CGPoint(x: 50, y: 0),
    ///                 CGPoint(x: 0, y: 50),
    ///                 CGPoint(x: 50, y: 100),
    ///                 CGPoint(x: 150, y: 0),
    ///                 CGPoint(x: 200, y: 50),
    ///                 CGPoint(x: 150, y: 100),
    ///                 CGPoint(x: 100, y: 50)
    ///             ])
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// To see the shape, we can just stroke it:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Infinity()
    ///             .stroke(Color.green, lineWidth: 3)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a green infinity symbol at the top left of the
    /// screen with sharp edges, rather than round.](infinity-1.png)
    ///
    /// That looks good. But what if we want to trim the shape? We can cut the
    /// path short using `trim(from:to:)`:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Infinity()
    ///             .trim(from: 0.25, to: 1)
    ///             .stroke(Color.green, lineWidth: 3)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a green infinity symbol at the top left of the
    /// screen with sharp edges, rather than round; however, since the trim
    /// method is applied to the shape, it is rendered without its upper left component.](infinity-2.png)
    ///
    /// Changing the parameters of `trim(from:to:)` to
    /// `.trim(from: 0, to: 1)` draws the full infinity symbol, while
    /// `.trim(from: 0, to: 0.5)` draws only the left lobe of the symbol.
    ///
    /// - Parameters:
    ///   - startFraction: The fraction of the way through drawing this shape
    ///     where drawing starts.
    ///   - endFraction: The fraction of the way through drawing this shape
    ///     where drawing ends.
    /// - Returns: A shape built by capturing a portion of this shape's path.
    @inlinable public func trim(from startFraction: CGFloat = 0, to endFraction: CGFloat = 1) -> some Shape { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Changes the relative position of this shape using the specified size.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by `100` points to the
    /// left and `50` points below.
    ///
    /// ```
    /// struct OffsetCircleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .overlay(
    ///                 Circle()
    ///                     .offset(CGSize(width: -100, height: 50))
    ///                     .stroke(Color.orange)
    ///             )
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black circle with an offset orange
    /// circle overlaid, shifted down and to the left of the screen.](offset-3.png)
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGSize) -> OffsetShape<Self> { }

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by `100` points to the
    /// left and `50` points below.
    ///
    /// ```
    /// struct OffsetCircleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .overlay(
    ///                 Circle()
    ///                     .offset(CGPoint(x: -100, y: 50))
    ///                     .stroke(Color.orange)
    ///             )
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black circle with an offset orange
    /// circle overlaid, shifted down and to the left of the screen.](offset-3.png)
    ///
    /// - Parameter offset: The amount, in points, by which you offset the
    ///   shape. Negative numbers are to the left and up; positive numbers are
    ///   to the right and down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(_ offset: CGPoint) -> OffsetShape<Self> { }

    /// Changes the relative position of this shape using the specified point.
    ///
    /// The following example renders two circles. It places one circle at its
    /// default position. The second circle is outlined with a stroke,
    /// positioned on top of the first circle and offset by `100` points to the
    /// left and `50` points below.
    ///
    /// ```
    /// struct OffsetCircleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .overlay(
    ///                 Circle()
    ///                     .offset(x: -100, y: 50)
    ///                     .stroke(Color.orange)
    ///             )
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black circle with an offset orange
    /// circle overlaid, shifted down and to the left of the screen. The offset
    /// is specified in both dimensions within the method.](offset-3.png)
    ///
    /// - Parameters:
    ///   - x: The horizontal amount, in points, by which you offset the shape.
    ///     Negative numbers are to the left and positive numbers are to the
    ///     right.
    ///   - y: The vertical amount, in points, by which you offset the shape.
    ///     Negative numbers are up and positive numbers are down.
    ///
    /// - Returns: A shape offset by the specified amount.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> OffsetShape<Self> { }

    /// Scales this shape without changing its bounding frame.
    ///
    /// Both the `x` and `y` multiplication factors halve their respective
    /// dimension's size when set to `0.5`, maintain their existing size when
    /// set to `1`, double their size when set to `2`, and so forth.
    ///
    /// ```
    /// struct ScaledCircleView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Circle()
    ///                 .fill(Color.red)
    ///             Circle()
    ///                 .scale(x: 0.1, y: 0.5, anchor: .top)
    ///                 .fill(Color.black)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid red circle in the center of the screen
    /// with a solid black ellipse stacked on top of it in a ZStack. The ellipse
    /// has been scaled down significantly in the x direction and halved in the y
    /// direction, with its anchor set at the top. This causes it to stick out from
    /// the top of the red circle; scaling it differently in each dimension strips it
    /// of its circular shape.](scale.png)
    ///
    /// - Parameters:
    ///   - x: The multiplication factor used to resize this shape along its
    ///     x-axis.
    ///   - y: The multiplication factor used to resize this shape along its
    ///     y-axis.
    ///
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(x: CGFloat = 1, y: CGFloat = 1, anchor: UnitPoint = .center) -> ScaledShape<Self> { }

    /// Scales this shape without changing its bounding frame.
    ///
    /// ```
    /// struct ScaledCircleView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Circle()
    ///                 .fill(Color.red)
    ///             Circle()
    ///                 .scale(0.5, anchor: .center)
    ///                 .fill(Color.white)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two circles in a ZStack, which appear as one
    /// thick red donut shape since the upper layer is a white circle. The white
    /// circle is scaled down to half its original size and anchored in the center,
    /// rendering as the donut shape described.](scale-2.png)
    ///
    /// - Parameter scale: The multiplication factor used to resize this shape.
    ///   A value of `0` scales the shape to have no size, `0.5` scales to half
    ///   size in both dimensions, `2` scales to twice the regular size, and so
    ///   on.
    ///
    /// - Returns: A scaled form of this shape.
    @inlinable public func scale(_ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> { }

    /// Rotates this shape around an anchor point at the angle you specify.
    ///
    /// Use this modifier to rotate a ``Shape``. See ``Angle`` for more
    /// on creating angles.
    ///
    /// The following example rotates a square by 45 degrees to the right to
    /// create a diamond shape:
    ///
    /// ```
    /// struct RotatedRectView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .rotation(Angle(degrees: 45))
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black rectangle in the center of the
    /// screen, rotated at 45 degrees from its original position. By applying the
    /// border method, an orange border is overlaid that shows the rectangle's original
    /// position.](rotation.png)
    ///
    /// - Parameters:
    ///   - angle: The angle of rotation to apply. Positive angles rotate
    ///     clockwise; negative angles rotate counterclockwise.
    ///   - anchor: The point to rotate the shape around.
    ///
    /// - Returns: A rotated shape.
    @inlinable public func rotation(_ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> { }

    /// Applies an affine transform to this shape.
    ///
    /// Affine transforms present a mathematical approach to applying
    /// combinations of rotation, scaling, translation, and skew to shapes.
    ///
    /// Check out Apple's [docs](https://developer.apple.com/documentation/coregraphics/cgaffinetransform)
    /// on `CGAffineTransform` to learn more about
    /// the parameter.
    ///
    /// ```
    /// struct TransformedRectView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .transform(CGAffineTransform(a: 1, b: 0, c: 0.5, d: 1, tx: 0, ty: 0))
    ///             .border(Color.orange)
    ///             .frame(width: 100, height: 100)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange rectangular frame in the center of the
    /// screen with a solid black rectangle behind it that has been transformed
    /// so that its bottom right corner is dragged out to the right.](transform.png)
    ///
    /// - Parameter transform: The affine transformation matrix to apply to this
    ///   shape.
    ///
    /// - Returns: A transformed shape, based on its matrix values.
    @inlinable public func transform(_ transform: CGAffineTransform) -> TransformedShape<Self> { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Changes the shape's size from a CGSize.
    ///
    /// This method will pass the required
    /// ``Shape/path(in:)`` function an updated rectangle.
    /// If you would prefer not to change the passed in rectangle,
    /// use ``Shape/scale(x:y:anchor:)`` function instead.
    ///
    /// This is similar the ``View/frame(width:height:alignment:)`` modifier
    /// from ``View``, except this returns a ``Shape``.
    ///
    /// ```
    /// struct SquareView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .size(CGSize(width: 100, height: 100))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a small black square in the upper left hand
    /// corner of the screen. Using the size method, the rectangle is anchored
    /// at the left corner, and the dimensions passed to CGSize dictate its size.](size.png)
    ///
    /// - Parameter size: The new rectangle size.
    @inlinable public func size(_ size: CGSize) -> some Shape { }


    /// Changes the shape's size from a width and height.
    ///
    /// This method will pass the required
    /// ``Shape/path(in:)`` function an updated rectangle.
    /// If you would prefer not to change the passed in rectangle,
    /// use ``Shape/scale(x:y:anchor:)`` function instead.
    ///
    /// This is similar the ``View/frame(width:height:alignment:)`` modifier
    /// from ``View``, except this returns a ``Shape``.
    ///
    /// ```
    /// struct SquareView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .size(width: 100, height: 100)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a small black square in the upper left hand
    /// corner of the screen. Using the size method, the rectangle is anchored
    /// at the left corner, and the dimensions passed to the width and height
    /// parameters dictate its size.](size.png)
    ///
    /// - Parameters:
    ///   - width: The shape's new bounding rectangle width.
    ///   - height: The shape's new bounding rectangle height.
    @inlinable public func size(width: CGFloat, height: CGFloat) -> some Shape { }

}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Fills this shape with a color or gradient.
    ///
    /// Use this method to fill a shape with any ``ShapeStyle``.
    ///
    /// See ``FillStyle`` for more info on the `style` parameter of this
    /// method.
    ///
    /// ```
    /// struct Cirlce: View {
    ///     var body: some View {
    ///         Circle()
    ///             .fill(Color.pink, style: FillStyle(eoFill: true, antialiased: true))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid pink circle in the center of the screen
    /// by applying the fill method.](fill-style.png)
    ///
    /// - Parameters:
    ///   - content: The color or gradient to use when filling this shape.
    ///   - style: The style options that determine how the fill renders.
    ///
    /// - Returns: A shape filled with the color or gradient you supply.
    @inlinable public func fill<S>(_ content: S, style: FillStyle = FillStyle()) -> some View where S : ShapeStyle { }


    /// Fills this shape with the foreground color.
    ///
    /// Use this method to fill a shape with the foreground color
    /// of the view.
    ///
    /// See ``FillStyle`` for more info on the `style` parameter of this
    /// method.
    ///
    /// ```
    /// struct Circle: View {
    ///     var body: some View {
    ///         Circle()
    ///             .fill(style: FillStyle(eoFill: true, antialiased: true))
    ///             .foregroundColor(.pink)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid pink circle in the center of the screen
    /// by applying the fill method with a style parameter.](fill-style.png)
    ///
    /// - Parameter style: The style options that determine how the fill
    ///   renders.
    /// - Returns: A shape filled with the foreground color.
    @inlinable public func fill(style: FillStyle = FillStyle()) -> some View { }


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// Use this method to add a border to a shape.
    ///
    /// See ``ShapeStyle`` for more info on the stroke content parameter.
    ///
    /// See ``StrokeStyle`` for more info on how to customize the stroke.
    ///
    /// The following example adds a dashed purple stroke to a ``Capsule``:
    ///
    /// ```
    /// struct StrokedCapsuleView: View {
    ///     let style = StrokeStyle(lineWidth: 5,
    ///                             lineCap: .round,
    ///                             lineJoin: .miter,
    ///                             miterLimit: 0,
    ///                             dash: [5, 10],
    ///                             dashPhase: 0)
    ///     var body: some View {
    ///         Capsule()
    ///             .stroke(Color.purple, style: style)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a dashed purple capsule touching all four
    /// edges of the screen, rendered with dashes by stroke style.](stroke-style.png)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - style: The stroke characteristics --- such as the line's width and
    ///     whether the stroke is dashed --- that determine how to render this
    ///     shape.
    ///
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, style: StrokeStyle) -> some View where S : ShapeStyle { }


    /// Traces the outline of this shape with a color or gradient.
    ///
    /// See ``ShapeStyle`` for more info on the stroke content parameter.
    ///
    /// To customize the stroke style, use
    /// ``Shape/stroke(_:style:)`` instead.
    ///
    /// The following example draws a circle with a purple stroke:
    ///
    /// ```
    /// struct StrokedCircleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .stroke(Color.purple, lineWidth: 5)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a circular purple border in the center of
    /// the screen.](stroke.png)
    ///
    /// - Parameters style: The stroke characteristics --- such as the line's width and
    /// whether the stroke is dashed --- that determine how to render this
    /// shape.
    ///
    /// - Returns: A stroked shape.
    @inlinable public func stroke<S>(_ content: S, lineWidth: CGFloat = 1) -> some View where S : ShapeStyle { }

}

/// A shape acts as view by filling itself with the foreground color and
/// default fill style.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// The content and behavior of the view.
    public var body: _ShapeView<Self, ForegroundStyle> { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Shape {

    /// Traces the outline of this shape with the view's foreground color.
    ///
    /// Use this method to stroke a shape with the foreground color specified
    /// in the view.
    ///
    /// To customize the stroke style, use
    /// ``Shape/stroke(_:style:)`` instead.
    ///
    /// The following example draws a capsule with a purple stroke:
    ///
    /// ```
    /// struct StrokedCapsuleView: View {
    ///     let style = StrokeStyle(lineWidth: 5,
    ///                             lineCap: .round,
    ///                             lineJoin: .miter,
    ///                             miterLimit: 0,
    ///                             dash: [5, 10],
    ///                             dashPhase: 0)
    ///     var body: some View {
    ///         Capsule()
    ///             .stroke(style: style)
    ///             .foregroundColor(.purple)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a dashed purple capsule touching all four
    /// edges of the screen, rendered with dashes by stroke style.](stroke-style.png)
    ///
    /// - Parameters:
    ///   - content: The color or gradient with which to stroke this shape.
    ///   - lineWidth: The width of the stroke that outlines this shape.
    ///
    /// - Returns: A stroked shape.
    @inlinable public func stroke(style: StrokeStyle) -> some Shape { }


    /// Traces the outline of this shape with the view's foreground color.
    ///
    /// Use this method to stroke a shape with the foreground color specified
    /// in the view.
    ///
    /// The following example draws a capsule with a purple stroke:
    ///
    /// ```
    /// struct StrokedCapsuleView: View {
    ///     var body: some View {
    ///         Capsule()
    ///             .stroke(lineWidth: 5)
    ///             .foregroundColor(.purple)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a circular purple border in the center of
    /// the screen.](stroke.png)
    ///
    @inlinable public func stroke(lineWidth: CGFloat = 1) -> some Shape { }

}

