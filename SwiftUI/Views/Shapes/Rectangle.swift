/// A rectangle shape.
///
/// A Rectangle is a four-sided ``Shape`` with 90 degree angle corners that automatically
/// aligns itself inside of the view containing it. By default, a `Rectangle` has
/// black fill and takes up the space of it's container:
///
/// ```
/// struct ContentView: View {
///     var body: some View {
///         Rectangle()
///     }
/// }
/// ```
///
/// ![A default rectangle filling the screen.](rectangle-default.png)
///
/// To define a `Rectangle` with a specific color and frame, use the ``Shape/fill(_:style:)``
/// and ``View/frame(width:height:alignment:)`` modifiers:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Rectangle()
///             .fill(Color.blue)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a filled blue rectangle at the center of the screen
/// which renders with width of 250 and height of 150 given the frame applied. ](1663CD41-6656-4213-8758-CDBA336DFD50.png)
///
/// To add a border, use the ``Shape/stroke(_:lineWidth:)`` modifier, and use
/// the ``Rectangle/inset(by:)`` modifier to inset the rectangle by half of the
/// border width to keep the rectangle at its original size:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Rectangle()
///             .inset(by: 10)
///             .stroke(Color.blue, lineWidth: 20)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a rectangle which renders as a blue rectangular border by applying
/// an inset to the original rectangle and increasing the lineWidth of the stroke
/// to keep it at its original size.](F421C7B6-8DF5-4A8C-8DA0-2DD4799C9759.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Rectangle : Shape {

    /// Used to describe a Rectangle as a path in a `CGRect`.
    ///
    /// A Rectangle can be described as a path within a specific [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect) using
    /// the ``Rectangle/path(in:)`` modifier:
    ///
    /// ![Rectangle path example](rectangle-example-3.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .path(in: CGRect(x: 0, y: 0, width: 100, height: 100))
    ///     }
    /// }
    /// ```
    public func path(in rect: CGRect) -> Path { }

    /// Creates a Rectangle that aligns itself inside of the view containing it
    /// by default.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black filled rectangle that occupies the
    /// entire screen; since no frame is set, the rectangle aligns itself inside
    /// of its containing view by default, which renders as a black screen.](rectangle-example-4.png)
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
extension Rectangle : InsettableShape {

    /// Returns a Rectangle insetted by the amount specified.
    ///
    /// For example, insetting by 10 points returns a Rectangle that fills its
    /// container, with 10 points inset on all four side.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .inset(by: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![Rectangle inset example](rectangle-example-5.png)
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape { }


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}
