/// A rectangle shape with rounded corners.
///
/// A RoundedRectangle is a rectangular ``Shape`` with rounded corners that by
/// default, aligns itself inside of the view containing it.
///
/// It must be created with a specific corner radius or size.
/// The example below creates a RoundedRectangle with a corner radius of 20,
/// and uses the ``Shape/fill(_:style:)`` and ``View/frame(width:height:alignment:)`` modifiers
/// to set the color to blue and the frame to 250 by 150.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         RoundedRectangle(cornerRadius: 20)
///             .fill(Color.blue)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A view containing a RoundedRectangle with a corner radius of 20, blue
/// fill, and a frame of width 250 and height 150.](923684A5-EAF0-455B-987B-DD7FAE5B8952.png)
///
/// The example below uses the same modifiers, but defines a corner size
/// rather than a corner radius.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         RoundedRectangle(cornerSize: CGSize(width: 30, height: 10))
///             .fill(Color.blue)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A view containing a RoundedRectangle with a corner size of width 30 and
/// height 10, blue fill, and a frame of width 250 and height 150.](4E1D6264-F9BA-4558-804A-72643AFD2A3B.png)
///
/// The RoundedRectangle initializer includes an optional parameter for
/// specifying the `style`, a ``RoundedCornerStyle`` that can either be `circular`
/// or `continuous`. These styles have subtle but noticeable differences:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         VStack(spacing: 20) {
///             RoundedRectangle(cornerRadius: 50, style: .circular)
///                 .frame(width: 250, height: 150)
///
///             RoundedRectangle(cornerRadius: 50, style: .continuous)
///                 .frame(width: 250, height: 150)
///         }
///     }
/// }
/// ```
///
/// ![A view containing two RoundedRectangles, each with a corner radius of 50
/// and a frame of width 250 and height 150, but with differing corner radius
/// styles: circular and continuous, respectively.](F25C23E2-86B8-42F5-8EB9-19E8D02A5177.png)
///
/// To add a border, use the `Shape/stroke(:lineWidth:)` modifier, and use
/// the ``RoundedRectangle/inset(by:)`` modifier to inset the RoundedRectangle by
/// half of the border width to keep the RoundedRectangle at its original size:
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         RoundedRectangle(cornerRadius: 40)
///             .inset(by: 10)
///             .stroke(Color.blue, lineWidth: 20)
///             .frame(width: 250, height: 150)
///     }
/// }
/// ```
///
/// ![A view containing a RoundedRectangle inset by 10 with a corner radius of
/// 40, a blue stroke with line width 20, and a frame of width 250 and height 150.](97611155-5069-4DFB-808C-7BBA7DD5DBAA.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RoundedRectangle : Shape {

    /// The rounded corner size of the rounded rectangle shape.
    ///
    /// This would be used instead of corner radius when you want your corners
    /// not to be perfect quarter-circles but instead quarter-ellipses.
    /// Basically, this allows you to specify different width and heights of
    /// the corners.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(cornerSize: CGSize(width: 30, height: 20))
    ///                 .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(cornerSize: CGSize(width: 20, height: 40))
    ///                 .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screeenshot displaying two black filled rounded rectangles in a VStack initialized
    /// with cornerSize. The first uses a cornerSize width that is larger than its
    /// height, which produces a smoother rounded corner, whereas the second uses a
    /// height double its width, which produces sharper corners.](roundedrectangle-example-6.png)
    public var cornerSize: CGSize

    /// The rounded corner style of your rounded rectangle's corners.
    ///
    /// These styles have subtle but noticeable differences:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(cornerRadius: 50, style: .circular)
    ///                 .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(cornerRadius: 50, style: .continuous)
    ///                 .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two black filled rounded rectangles in a VStack;
    /// the first uses a circular style which renders with slightly sharper edges,
    /// whereas the second uses a continuous style, which renders as slightly
    /// smoother on all edges.](roundedrectangle-example-3.png)
    ///
    /// - See also: ``RoundedCornerStyle``
    public var style: RoundedCornerStyle

    /// Creates a RoundedRectangle with specified rounded corner width and height.
    ///
    /// - Parameters:
    ///   - cornerSize: The size (width and height) of the rectangle's corners.
    ///   - style: The type of rounded corners. Defaults to circular.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(
    ///                 cornerSize: CGSize(width: 20, height: 10)
    ///             )
    ///             .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(
    ///                 cornerSize: CGSize(width: 20, height: 10),
    ///                 style: .continuous
    ///             )
    ///             .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two black filled rounded rectangles in a VStack
    /// which specify the width and height of their corners in the RoundedRectangle
    /// initializer. The dimensions are the same, but the second also applies a
    /// continuous style, which makes it appear slightly smoother.](roundedrectangle-example-3.png)
    @inlinable public init(cornerSize: CGSize, style: RoundedCornerStyle = .circular) { }

    /// Creates a RoundedRectangle with specified rounded corner radius.
    ///
    /// - Parameters:
    ///   - cornerRadius: The radius of the rectangle's corners.
    ///   - style: The type of rounded corners. Defaults to circular.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack(spacing: 20) {
    ///             RoundedRectangle(cornerRadius: 50) // Style defaults to circular
    ///                 .frame(width: 250, height: 150)
    ///
    ///             RoundedRectangle(cornerRadius: 50, style: .continuous)
    ///                 .frame(width: 250, height: 150)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two black filled rounded rectangles in a VStack
    /// which specify the radii of their corners in the RoundedRectangle
    /// initializer. The dimensions are the same, but the second also applies a
    /// continuous style, which makes it appear slightly smoother.](roundedrectangle-example-3.png)
    @inlinable public init(cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) { }

    /// Used to describe a RoundedRectangle as a path in a `CGRect`.
    ///
    /// A RoundedRectangle can be described as a path within a specific [`CGRect`](https://developer.apple.com/documentation/coregraphics/cgrect)
    /// using the `path(in:)` modifier:
    ///
    /// ![RoundedRectangle path example](roundedrectangle-example-7.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         RoundedRectangle()
    ///             .path(in: CGRect(x: 0, y: 0, width: 75, height: 200))
    ///     }
    /// }
    /// ```
    public func path(in rect: CGRect) -> Path { }

    /// The data to animate.
    public var animatableData: CGSize.AnimatableData

    /// The type defining the data to animate.
    public typealias AnimatableData = CGSize.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RoundedRectangle : InsettableShape {

    /// Returns a RoundedRectangle insetted by the amount specified. For
    /// example, insetting by 10 points returns a Capsule that fills its
    /// container, with 10 points inset on all four side.
    ///
    /// ![RoundedRectangle inset example](roundedrectangle-example-8.png)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         RoundedRectangle(cornerRadius: 20)
    ///             .inset(by: 10)
    ///     }
    /// }
    /// ```
    @inlinable public func inset(by amount: CGFloat) -> some InsettableShape { }


    /// The type of the inset shape.
    public typealias InsetShape = some InsettableShape
}

