/// A shape with a translation offset transform applied to it.
///
/// An offset shape has two use cases:
///
///
///
/// 1. Used directly via its initializer ``RotatedShape/init(shape:offset:)``.
/// 2. The return value of ``Shape/offset(_:)`` and ``Shape/offset(x:y:)``.
///
///
///
/// Having an offset shape is helpful because it allows you to translate a shape
/// and then continue to use its shape properties, instead of turning into ``View``.
///
/// A simple example of constructing an ``OffsetShape``:
///
/// ```
/// struct OffsetShapeView: View {
///     var body: some View {
///         OffsetShape(shape: Circle(),
///                     offset: CGSize(width: 20, height: 20))
///     }
/// }
/// ```
///
/// ![A screenshot displaying a large black circle which is slightly offset
/// to the right side and lower half of the screen.](20B2CBEC-08BB-4349-B451-C6DE14BD68A3.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct OffsetShape<Content> : Shape where Content : Shape {

    /// The original shape that you want to move up, sideways, or both.
    ///
    /// ```
    /// struct OffsetShapeView: View {
    ///     let offsetShape =  OffsetShape(shape: Circle(),
    ///                                    offset: CGSize(width: 20, height: 20))
    ///     var body: some View {
    ///         ZStack {
    ///             offsetShape
    ///             offsetShape.shape
    ///                 .opacity(0.2)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying two large circles in a ZStack; the bottom applies
    /// the shape property and a low opacity to display where the shape originally was
    /// in the center of the screen, while the top layer is a large black circle
    /// which is slightly offset to the right side and lower half of the screen.](offset-shape-shape.png)
    ///
    public var shape: Content

    /// The amount the shape is offset.
    ///
    /// ```
    /// struct OffsetShapeView: View {
    ///     let offsetShape =  OffsetShape(shape: Circle(),
    ///                                    offset: CGSize(width: 20, height: 20))
    ///     var body: some View {
    ///         offsetShape
    ///             .onAppear {
    ///                 print(offsetShape.offset.width) //20
    ///             }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a large black circle which is slightly offset
    /// to the right side and lower half of the screen by applying the offset
    /// instance property with a specified width and height.](offset-shape-offset.png)
    ///
    public var offset: CGSize

    /// Use this to take an original shape and move it to a new place on the screen.
    ///
    /// ```
    /// struct OffsetShapeView: View {
    ///     var body: some View {
    ///         OffsetShape(shape: Circle(),
    ///                     offset: CGSize(width: 20, height: 20))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a large black circle which is slightly offset
    /// to the right side and lower half of the screen by specifying an offset
    /// in the initializer.](offset-shape-init.png)
    ///
    /// - Parameters:
    ///   - shape: The original shape that you want to move.
    ///   - offset: The amount that you want to move the shape.
    @inlinable public init(shape: Content, offset: CGSize) { }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path { }

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, CGSize.AnimatableData>

    /// The data to animate.
    public var animatableData: OffsetShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension OffsetShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> OffsetShape<Content.InsetShape> { }

    /// The type of the inset shape.
    public typealias InsetShape = OffsetShape<Content.InsetShape>
}

