/// A circle shape.
///
/// A Circle is centered on the frame of the view containing it. The circle's
/// radius equals half the length of the frame rectangle's smallest edge.
///
/// By default, a Circle is black, and takes up the space of its container:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Circle()
///     }
/// }
/// ```
///
/// ![A view containing a circle with default black fill.](Circle-example-1.png)
///
/// Define a Circle with a specific color and frame with the ``Shape/fill()``
/// and ``View/frame(width:height:)`` modifiers. For example:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Circle()
///             .fill(Color.blue)
///             .frame(width: 200, height: 200)
///     }
/// }
/// ```
///
/// ![A view containing a blue filled circle with a frame of width 200 and
/// height 200.](Circle-example-2.png)
///
/// To add a border, use the ``Shape/stroke(:lineWidth:)`` modifier, and use
/// the ``Circle/inset(by:)`` modifier to inset the circle by half of the border
/// width to keep the circle at its original size:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Circle()
///             .inset(by: 10)
///             .stroke(Color.blue, lineWidth: 20)
///     }
/// }
/// ```
///
/// ![A view containing a circle inset by 10 with a blue strok of lineWidth 20.](Circle-example-3.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Circle : Shape {

    /// Used to describe a Circle as a path in a `CGRect`.
    ///
    /// A Circle can be described as a path within a specific
    /// [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// using the ``Circle/path(in:)`` modifier:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .path(in: CGRect(x: 0, y: 0, width: 100, height: 100))
    ///     }
    /// }
    /// ```
    ///
    /// ![Circle path example](Circle-example-4.png)
    ///
    public func path(in rect: CGRect) -> Path { }

    /// Creates a Circle that aligns itself inside of the view containing it
    /// by default.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Circle()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a circle with default black fill.](Circle-example-1.png)
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
extension Circle : InsettableShape {

    /// Returns a Circle insetted by the amount specified.
    ///
    /// Returns a Circle insetted by the amount specified. For example,
    /// insetting by 10 points returns a Circle that fills its container, with
    /// 10 points inset on all four side.
    ///
    /// For example, insetting by 10 points returns a Circle that fills its
    /// container, with 10 points inset on all four side.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .inset(by: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![Circle inset example](Circle-example-5.png)
    ///
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape { }


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

