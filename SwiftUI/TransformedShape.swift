/// A shape with an affine transform applied to it.
///
/// A transformed shape has two use cases:
/// 1. Used directly via its initializer ``TransformedShape/init(shape:transform:)``.
/// 2. The return value of ``Shape/transform(_:)``.
///
/// Having an offset shape is helpful because it allows you to translate a shape
/// and then continue to use its shape properties, instead of turning into ``View``.
///
/// A simple example of constructing a `TransformedShape`:
///
/// ```
/// struct TransformedShapeView: View {
///     let transform = CGAffineTransform(rotationAngle: 0.5)
///
///     var body: some View {
///         TransformedShape(shape: Rectangle(), transform: transform)
///             .frame(width: 100, height: 100)
///             .border(Color.orange)
///     }
/// }
/// ```
///
/// ![A screenshot displaying an orange square border in the center of the screen
/// with a black filled square of the same size anchored at its top left corner,
/// rotated by 0.5 radians towards the bottom of the screen.](transformedshape.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct TransformedShape<Content> : Shape where Content : Shape {

    /// The original shape to be affine transformed.
    ///
    /// ```
    /// struct TransformedShapeView: View {
    ///     var body: some View {
    ///         let transform = CGAffineTransform(rotationAngle: 0.5)
    ///         let transformedShape = TransformedShape(shape: Rectangle(), transform: transform)
    ///
    ///         return ZStack {
    ///             transformedShape
    ///                 .frame(width: 100, height: 100)
    ///             transformedShape.shape
    ///                 .fill(Color.red.opacity(0.5))
    ///                 .frame(width: 100, height: 100)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a red transparent square in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. Here, the shape property
    /// is called on the transformedShape to render the original square, modified to red.](transformedshape-shape.png)
    public var shape: Content

    /// The affine transformation to apply to the original shape
    ///
    /// ```
    /// struct TransformedShapeView: View {
    ///     var body: some View {
    ///         let transform = CGAffineTransform(rotationAngle: 0.5)
    ///         let transformedShape = TransformedShape(shape: Rectangle(), transform: transform)
    ///
    ///         return VStack {
    ///             Text("Identity transform? ")
    ///                 + Text(transformedShape.transform.isIdentity ? "Yes" : "No")
    ///             transformedShape
    ///                 .frame(width: 100, height: 100)
    ///                 .border(Color.orange)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen. Text above it reads
    /// "Identity transform? No." The "yes" or "no" in the text is prompted by
    /// the isidentity property of the transform variable.](transformedshape-transform.png)
    public var transform: CGAffineTransform

    /// Creates a new shape from an original shape and an affine transform.
    ///
    /// ```
    /// struct TransformedShapeView: View {
    ///     let transform = CGAffineTransform(rotationAngle: 0.5)
    ///
    ///     var body: some View {
    ///         TransformedShape(shape: Rectangle(), transform: transform)
    ///             .frame(width: 100, height: 100)
    ///             .border(Color.orange)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange square border in the center of the screen
    /// with a black filled square of the same size anchored at its top left corner,
    /// rotated by 0.5 radians towards the bottom of the screen.](transformedshape.png)
    ///
    /// - Parameters:
    ///   - shape: The original shape to be affine transformed.
    ///   - transform: The affine transform to apply to the original shape.
    @inlinable public init(shape: Content, transform: CGAffineTransform) { }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path { }

    /// The type defining the data to animate.
    public typealias AnimatableData = Content.AnimatableData

    /// The data to animate.
    public var animatableData: TransformedShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

