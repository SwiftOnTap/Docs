/// An ellipse shape, similar to a circle but with potentially different width
/// and height.
///
/// An Ellipse is a circular ``Shape`` that by default, aligns itself inside of
/// the view containing it. It differs from ``Circle`` in that its width and
/// height are not necessarily equal.
///
/// To define an Ellipse with a specific color and frame, use the ``Shape/fill(_:style:)``
/// and ``View/frame(width:height:alignment:)`` modifiers:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Ellipse()
///             .fill(Color.purple)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A view containing a purple filled ellipse with a frame of width 250 and
/// height 150.](ellipse-example-1.png)
///
/// To add a border, use the ``Shape/stroke(_:lineWidth:)`` modifier, and use
/// the ``Ellipse/inset(by:)`` modifier to inset the Ellipse by half of the
/// border width to keep the Ellipse at its original size:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Ellipse()
///             .inset(by: 10)
///             .stroke(Color.purple, lineWidth: 20)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A view containing an ellipse with an inset of 10, a purple stroke / outline
/// of line width 20, and a frame of width 250 and height 150.](ellipse-example-2.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Ellipse : Shape {

    /// Used to describe an Ellipse as a path in a `CGRect`.
    ///
    /// An Ellipse can be described as a path within a specific [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect) using
    /// the ``Ellipse/path(in:)`` modifier:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Ellipse()
    ///             .path(in: CGRect(x: 0, y: 0, width: 100, height: 150))
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default ellipse.](ellipse-example-3.png)
    ///
    public func path(in rect: CGRect) -> Path { }

    /// Creates an Ellipse that aligns itself inside of the view containing it
    /// by default.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Ellipse()
    ///     }
    /// }
    /// ```
    ///
    /// ![Ellipse init example](ellipse-example-4.png)
    ///
    @inlinable public init() { }

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Ellipse : InsettableShape {

    /// Returns a Ellipse insetted by the amount specified.
    ///
    /// For example, insetting by 10 points returns a Ellipse that fills its
    /// container, with 10 points inset on all four side.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Ellipse()
    ///             .inset(by: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![Ellipse inset example](ellipse-example-5.png)
    ///
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape { }


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

