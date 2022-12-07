/// A shape with a rotation transform applied to it.
///
/// A rotated shape has two use cases:
/// 1. Used directly via its initializer, ``RotatedShape/init(shape:angle:anchor:)``.
/// 2. The return value of ``Shape/rotation(_:anchor:)``.
///
/// Having a rotated shape is helpful because it allows you to rotate a shape
/// and then continue to use its shape properties, instead of turning into ``View``.
///
/// A simple example of constructing a ``RotatedShape``:
///
/// ```
/// struct RotatedShapeView: View {
///     var body: some View {
///         let shape = Rectangle().scale(0.5)
///         let angle = Angle(degrees: 30)
///         let rotatedShape = RotatedShape(shape: shape, angle: angle)
///
///         return rotatedShape
///             .border(Color.orange)
///             .padding()
///     }
/// }
/// ```
///
/// ![A screenshot displaying a large orange rectangular border surrounding
/// a smaller black filled rectangle which is rotated 30 degrees by the
/// rotatedShape initializer.](rotatedshape.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RotatedShape<Content> : Shape where Content : Shape {

    /// The original shape to be rotated.
    ///
    /// ```
    /// struct RotatedShapeView: View {
    ///     var body: some View {
    ///         let shape = Rectangle().scale(0.5)
    ///         let angle = Angle(degrees: 30)
    ///         let rotatedShape = RotatedShape(shape: shape, angle: angle)
    ///
    ///         return ZStack {
    ///             rotatedShape
    ///             rotatedShape.shape
    ///                 .fill(Color.orange.opacity(0.5))
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a ZStack containing two rectangles. The bottom
    /// layer is a rotated black filled rectangle, rendered by the rotatedShape
    /// initializer. The top layer calls on the shape property to reproduce the
    /// original shape before it was rotated, with an added opacity and color view
    /// modifier to make it appear a light orange. ](rotatedshape-shape.png)
    public var shape: Content

    /// The amount to rotate the original shape.
    ///
    /// ```
    /// struct RotatedShapeView: View {
    ///     var body: some View {
    ///         let shape = Rectangle().scale(0.5)
    ///         let angle = Angle(degrees: 30)
    ///         let rotatedShape = RotatedShape(shape: shape, angle: angle)
    ///
    ///         return VStack {
    ///             Text("🎡 Rotated: \(rotatedShape.angle.degrees)º")
    ///             rotatedShape
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black rectangle rotated by 30 degrees using
    /// the rotatedShape initializer, with text at the top of the screen that reads
    /// "Rotated: 30.000000 degrees." The text view uses the angle property to
    /// pull the value from the rotatedShape object.](rotatedshape-angle.png)
    public var angle: Angle

    /// The anchor point to rotate the shape around.
    ///
    /// ```
    /// struct RotatedShapeView: View {
    ///     var body: some View {
    ///         let shape = Rectangle().scale(0.5)
    ///         let angle = Angle(degrees: 30)
    ///         let rotatedShape = RotatedShape(shape: shape, angle: angle)
    ///         let anchor = rotatedShape.anchor
    ///
    ///         return VStack {
    ///             Text("Anchored at (\(anchor.x), \(anchor.y)) ⚓️")
    ///             rotatedShape
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black rectangle rotated by 30 degrees using
    /// the rotatedShape initializer, with text at the top of the screen that reads
    /// "Anchored at (0.500000, 0.500000)." The text view uses the anchor property to
    /// pull the location of the anchor from the rotatedShape object.](rotatedshape-anchor.png)
    public var anchor: UnitPoint

    /// Creates a rotated shape from an original shape, an angle, and an anchor point.
    ///
    /// ```
    /// struct RotatedShapeView: View {
    ///     var body: some View {
    ///         RotatedShape(shape: Rectangle(),
    ///                      angle: .degrees(30),
    ///                      anchor: .bottomLeading)
    ///             .border(Color.orange)
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange rectangular border around the screen,
    /// with an identically sized black filled rectangle anchored at its bottom left
    /// corner. The initializer renders the black rectangle at a 30 degree rotation
    /// from its anchor, which is specified as bottomLeading in its initialization.](rotatedshape-fixed.png)
    ///
    /// - Parameters:
    ///   - shape: The original shape to rotate.
    ///   - angle: The angle to rotate the original shape.
    ///   - anchor: The unit point to rotate the shape around.
    @inlinable public init(shape: Content, angle: Angle, anchor: UnitPoint = .center) { }

    /// Describes this shape as a path within a rectangular frame of reference.
    ///
    /// - Parameter rect: The frame of reference for describing this shape.
    ///
    /// - Returns: A path that describes this shape.
    public func path(in rect: CGRect) -> Path { }
    
    /// An indication of how to style a shape.
    ///
    /// SwiftUI looks at a shape's role when deciding how to apply a
    /// ``ShapeStyle`` at render time. The ``Shape`` protocol provides a
    /// default implementation with a value of ``ShapeRole/fill``. If you
    /// create a composite shape, you can provide an override of this property
    /// to return another value, if appropriate.
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    public static var role: ShapeRole { get }

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<Angle.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to animate.
    public var animatableData: RotatedShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension RotatedShape : InsettableShape where Content : InsettableShape {

    /// Returns `self` inset by `amount`.
    @inlinable public func inset(by amount: CGFloat) -> RotatedShape<Content.InsetShape> { }

    /// The type of the inset shape.
    public typealias InsetShape = RotatedShape<Content.InsetShape>
}

