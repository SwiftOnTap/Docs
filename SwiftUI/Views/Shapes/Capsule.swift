/// A pill-style shape.
///
/// A Capsule is a rectangular ``Shape`` that by default, aligns itself inside of
/// the view containing it. It differs from ``RoundedRectangle`` in that its
/// corner radius is half the length of the retangle's smallest edge. In effect,
/// it creates a "pill" shape.
///
/// To define a Capsule with a specific color and frame, use the ``Shape/fill(style:)``
/// and ``View/frame(width:height:alignment:)`` modifiers:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Capsule()
///             .fill(Color.orange)
///             .frame(width: 250, height: 100)
///     }
/// }
/// ```
///
/// ![A view containing a capsule shape with orange fill and a frame of width
/// 250 and height 100.](capsule-example-1.png)
///
/// To add a border, use the ``Shape/stroke(_:lineWidth:)`` modifier, and use
/// the ``Capsule/inset(by:)`` modifier to inset the Capsule by half of the
/// border width to keep the Capsule at its original size:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         Capsule()
///             .inset(by: 10)
///             .stroke(Color.orange, lineWidth: 20)
///             .frame(width: 250, height: 100)
///     }
/// }
/// ```
///
/// ![A view containing a capsule shape inset by 10 with an orange stroke of lineWidth
/// 20 and a frame of width 250 and height 100.](capsule-example-2.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct Capsule : Shape {

    /// The Capsule's rounded corner style, based on the value passed in its
    /// initializer.
    ///
    /// Look at ``RoundedCornerStyle`` for more information.
    ///
    /// - SeeAlso: RoundedCornerStyle
    public var style: RoundedCornerStyle

    /// Creates an Ellipse that aligns itself inside of the view containing it
    /// by default.
    ///
    /// A style may be optionally passed into the initializer, with the options
    /// `circular` and `continuous`. These styles have subtle but noticeable
    /// differences:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             Capsule(style: .circular)
    ///                 .frame(width: 250, height: 100)
    ///
    ///             Capsule(style: .continuous)
    ///                 .frame(width: 250, height: 100)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing two capsule shapes, both with default black fill and
    /// and a frame of width 250 and height 100; one is of the circular style
    /// while the next is of the continuous style.](18.59.51.png)
    ///
    @inlinable public init(style: RoundedCornerStyle = .circular) { }

    /// Used to describe a Capsule as a path in a `CGRect`.
    ///
    /// A Capsule can be described as a path within a specific [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect) using
    /// the ``Capsule/path(in:)`` modifier:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Capsule()
    ///             .path(in: CGRect(x: 0, y: 0, width: 75, height: 200))
    ///     }
    /// }
    /// ```
    ///
    /// ![](19.02.03.png)
    ///
    public func path(in r: CGRect) -> Path { }

    /// The type defining the data to animate.
    public typealias AnimatableData = EmptyAnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Capsule : InsettableShape {

    /// Returns a Capsule insetted by the amount specified.
    ///
    /// For example, insetting by 10 points returns a Capsule that fills its
    /// container, with 10 points inset on all four side.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Capsule()
    ///             .inset(by: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![Capsule inset example](capsule-example-5.png)
    ///
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape { }


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

