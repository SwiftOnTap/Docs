/// A shape with a scale transform applied to it.
///
/// A scaled shape has two use cases:
/// 1. Used directly via its initializer, ``ScaledShape/init(shape:scale:anchor:)``.
/// 2. As the return value of the ``Shape/scale(x:y:anchor:)`` and
/// ``Shape/scale(_:anchor:)``.
///
/// Having a scaled shape is helpful because it allows you to scale a shape
/// and then continue to use its shape properties, instead of turning into ``View``.
///
/// A simple example of constructing a ``ScaledShape``:
///
/// ```
/// struct ContentView: View {
///     let scale = CGSize(width: 0.5, height: 0.5)
///
///     var body: some View {
///         ScaledShape(shape: Rectangle(), scale: scale)
///             .border(Color.orange)
///             .padding()
///     }
/// }
/// ```
///
/// ![A screenshot displaying an orange rectangular border near the edges of
/// the screen. Inset within this border is a black filled rectangle that is
/// scaled down to half the size of its surrounding border by applying a 0.5 scale
/// in the scaledShape initializer.](scaledshape.png)
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct ScaledShape<Content> : Shape where Content : Shape {

    /// The original shape, before the scale.
    ///
    /// ```
    /// struct DiskView: View {
    ///     var body: some View {
    ///         let scale = CGSize(width: 0.5, height: 0.5)
    ///         let scaledShape = ScaledShape(shape: Circle(), scale: scale)
    ///
    ///         return ZStack {
    ///             scaledShape
    ///                 .shape.fill(Color.red)
    ///             scaledShape
    ///                 .opacity(0.7)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a large red circle in the center of the screen
    /// with a smaller darker circle overlaid. The smaller circle is a scaled down
    /// version of the larger one, rendered by the scaledShape initializer. By
    /// calling on the shape property of the scaledShape, the original sized circle is
    /// accessible in the ZStack.](scaledshape-2.png)
    public var shape: Content

    /// The scale factor.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         let scale = CGSize(width: 0.5, height: 0.5)
    ///         let scaledShape = ScaledShape(shape: Circle(), scale: scale)
    ///
    ///         return VStack {
    ///             Text("↔️ scaled by \(scaledShape.scale.width)")
    ///             Text("↕️ scaled by \(scaledShape.scale.height)")
    ///             scaledShape
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black filled circle in the center of the
    /// screen with text at the top of the screen that describes the scale
    /// factors in both dimensions. The scale factors are retrieved by the
    /// scale property of the scaledShape object.](scaledshape-scale.png)
    public var scale: CGSize

    /// The unit point to scale the view from.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         let scale = CGSize(width: 0.5, height: 0.5)
    ///         let scaledShape = ScaledShape(shape: Circle(), scale: scale)
    ///         let anchor = scaledShape.anchor
    ///
    ///         return VStack {
    ///             Text("Anchored at (\(anchor.x), \(anchor.y)) ⚓️")
    ///             scaledShape
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a black filled circle in the center of the
    /// screen with text at the top of the screen that describes the location of
    /// anchor in both dimensions. The anchor location is retrieved by the
    /// anchor property of the scaledShape object. In this case the anchor is
  /// located at the center of the screen, so the reading is (0.500000,0.500000).](scaledshape-anchor.png)
    ///
    public var anchor: UnitPoint

    /// Creates a scaled shape from an original shape, a scale factor, and an anchor point.
    ///
    /// ```
    /// struct HugeShapeView: View {
    ///     var body: some View {
    ///         ScaledShape(shape: Rectangle(),
    ///                     scale: CGSize(width: 0.5, height: 0.5),
    ///                     anchor: .center)
    ///         .border(Color.orange)
    ///         .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying an orange rectangular border near the edges of
    /// the screen. Inset within this border is a black filled rectangle that is
    /// scaled down to half the size of its surrounding border by applying a 0.5 scale
    /// in the scaledShape initializer. The anchor is also specified by the initializer
    /// to ensure the shape is scaled from the center of the screen.](scaledshape-init.png)
    ///
    /// - Parameters:
    ///   - shape: The shape to be scaled.
    ///   - scale: The factor to scale the shape.
    ///   - anchor: The unit point to scale the shape from. Defaults to the center.
    @inlinable public init(shape: Content, scale: CGSize, anchor: UnitPoint = .center) { }

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
    public typealias AnimatableData = AnimatablePair<Content.AnimatableData, AnimatablePair<CGSize.AnimatableData, UnitPoint.AnimatableData>>

    /// The data to animate.
    public var animatableData: ScaledShape<Content>.AnimatableData

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

