/// A shape type that is able to inset itself to produce another shape.
///
/// This is the protocol that allows you to inset and stroke shapes.
///
/// Types conforming to this protocol include:
/// - ``Capsule``
/// - ``Circle``
/// - ``Ellipse``
/// - ``Rectangle``
/// - ``RoundedRectangle``
///
/// Any type conforming to this protocol automatically gets implementations
/// of the ``InsettableShape/strokeBorder(_:style:antialiased:)``
/// modifier. This allows you to add a border to a shape without increasing
/// its total size at all.
///
/// To conform to this protocol, there is only one requirement:
/// the ``InsettableShape/inset(by:)`` function.
/// Implement this function to describe how to inset a custom shape.
///
/// The following example shows how to conform a custom shape to this
/// protocol, and then use it to stroke the border. (See
/// ``Shape`` and ``Shape/path(in:)`` for more on creating cutom shapes.)
///
/// ```
/// struct ArcView: View {
///     var body: some View {
///         Arc(endAngle: Angle(degrees: 270))
///             .strokeBorder(Color.green)
///     }
/// }
///
/// struct Arc: InsettableShape {
///     var endAngle: Angle
///     var insetAmount: CGFloat = 0
///
///     func path(in rect: CGRect) -> Path {
///         Path { p in
///             p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
///                      radius: rect.width / 2 - insetAmount,
///                      startAngle: .zero,
///                      endAngle: endAngle,
///                      clockwise: false)
///         }
///     }
///
///     func inset(by amount: CGFloat) -> some InsettableShape {
///         var arc = self
///         arc.insetAmount += amount
///         return arc
///     }
/// }
/// ```
///
/// ![A screenshot displaying a thin green arc covering 270 degrees counterclockwise
/// from the top of the screen.](insettableshape.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public protocol InsettableShape : Shape { }
extension InsettableShape : Shape {

    /// The type of the inset shape.
    associatedtype InsetShape : InsettableShape

    /// Returns `self` inset by `amount`.
    ///
    /// This is the one required method for conforming to the
    /// ``InsettableShape`` protocol. Shapes that already conform to
    /// the protocol implement this function. To create your own custom
    /// insettable shape, you must implement this function yourself.
    ///
    /// The following example shows a custom shape, called an `Arc`,
    /// which implements this function to become insettable.
    ///
    /// ```
    /// struct ArcView: View {
    ///     var body: some View {
    ///         Arc(endAngle: Angle(.degrees(270)))
    ///             .strokeBorder(Color.green)
    ///     }
    /// }
    ///
    /// struct Arc: InsettableShape {
    ///     var endAngle: Angle
    ///     var insetAmount: CGFloat = 0
    ///
    ///     func path(in rect: CGRect) -> Path {
    ///         Path { p in
    ///             p.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
    ///                      radius: rect.width / 2 - insetAmount,
    ///                      startAngle: .zero,
    ///                      endAngle: endAngle,
    ///                      clockwise: false)
    ///         }
    ///     }
    ///
    ///     func inset(by amount: CGFloat) -> some InsettableShape {
    ///         var arc = self
    ///         arc.insetAmount += amount
    ///         return arc
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a thin green arc covering 270 degrees counterclockwise
    /// from the top of the screen.](insettableshape.png)
    ///
    func inset(by amount: CGFloat) -> Self.InsetShape { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension InsettableShape {

    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with `content`.
    ///
    /// This modifier is available for ``InsettableShape``. To learn more
    /// about the requirements of an insettable shape, see ``InsettableShape``.
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         let gradient = Gradient(colors: [.green, .blue])
    ///         let linearGradient = LinearGradient(gradient: gradient,
    ///                                             startPoint: .leading,
    ///                                             endPoint: .trailing)
    ///         let style = StrokeStyle(lineWidth: 15,
    ///                                 lineCap: .butt,
    ///                                 lineJoin: .round,
    ///                                 miterLimit: 1,
    ///                                 dash: [],
    ///                                 dashPhase: 0)
    ///
    ///         return Circle()
    ///             .strokeBorder(linearGradient, style: style)
    ///             .border(Color.primary)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue/green circular gradient border inset within
    /// a thin black rectangular border hugging the edges of the screen.](strokeborder-style.png)
    ///
    /// - Parameters:
    ///   - content: The ``ShapeStyle`` to fill the border with.
    ///   - style: The ``StrokeStyle`` for filling the border.
    ///   - antialiased: Whether the border is antialiased.
    @inlinable public func strokeBorder<S>(_ content: S, style: StrokeStyle, antialiased: Bool = true) -> some View where S : ShapeStyle { }


    /// Returns a view that is the result of insetting `self` by
    /// `style.lineWidth / 2`, stroking the resulting shape with
    /// `style`, and then filling with the foreground color.
    ///
    /// This modifier is available for ``InsettableShape``. To learn more
    /// about the requirements of an insettable shape, see ``InsettableShape``.
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         let style = StrokeStyle(lineWidth: 15,
    ///                                 lineCap: .butt,
    ///                                 lineJoin: .round,
    ///                                 miterLimit: 1,
    ///                                 dash: [],
    ///                                 dashPhase: 0)
    ///
    ///         return Circle()
    ///             .strokeBorder(style: style)
    ///             .border(Color.primary)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black circular border inset within
    /// a thin black rectangular border hugging the edges of the screen.](insettableshape-strokeborder.png)
    ///
    /// - Parameters:
    ///   - style: The ``StrokeStyle`` for filling the border.
    ///   - antialiased: Whether the border is antialiased.
    @inlinable public func strokeBorder(style: StrokeStyle, antialiased: Bool = true) -> some View { }


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with `content`. This is
    /// equivalent to insetting `self` by `width / 2` and stroking the
    /// resulting shape with `width` as the line-width.
    ///
    /// This modifier is available for ``InsettableShape``. To learn more
    /// about the requirements of an insettable shape, see ``InsettableShape``.
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         let gradient = Gradient(colors: [.green, .blue])
    ///         let linearGradient = LinearGradient(gradient: gradient,
    ///                                             startPoint: .leading,
    ///                                             endPoint: .trailing)
    ///
    ///         return Circle()
    ///             .strokeBorder(linearGradient, lineWidth: 15)
    ///             .border(Color.primary)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a blue/green circular gradient border inset within
    /// a thin black rectangular border hugging the edges of the screen.](strokeborder-style.png)
    ///
    /// - Parameters:
    ///   - content: The ``ShapeStyle`` to fill the border with.
    ///   - lineWidth: The border width.
    ///   - antialiased: Whether the border is antialiased.
    @inlinable public func strokeBorder<S>(_ content: S, lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View where S : ShapeStyle { }


    /// Returns a view that is the result of filling the `width`-sized
    /// border (aka inner stroke) of `self` with the foreground color.
    /// This is equivalent to insetting `self` by `width / 2` and
    /// stroking the resulting shape with `width` as the line-width.
    ///
    /// This modifier is available for ``InsettableShape``. To learn more
    /// about the requirements of an insettable shape, see ``InsettableShape``.
    ///
    /// ```
    /// struct CircleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .strokeBorder(lineWidth: 15)
    ///             .border(Color.primary)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a solid black circular border inset within
    /// a thin black rectangular border hugging the edges of the screen.](insettableshape-strokeborder.png)
    ///
    /// - Parameters:
    ///   - lineWidth: The border width.
    ///   - antialiased: Whether the border is antialiased.
    @inlinable public func strokeBorder(lineWidth: CGFloat = 1, antialiased: Bool = true) -> some View { }

}

