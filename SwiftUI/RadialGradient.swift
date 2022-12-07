/// A radial gradient that applies the color function as the distance from a center point,
/// scaled to fit within the defined start and end radii.
///
/// A Radial Gradient is very similar to a ``LinearGradient``, but instead of defining starting and ending points,
/// it is necessary to define a start radius, an end radius and the center of the gradient.
///
/// The gradient is drawn as circular around the center, moving outwards to the end radius.
/// `RadialGradient` accepts a ``UnitPoint`` for the center of the gradient and
/// [`CGFloat`](https://developer.apple.com/documentation/coregraphics/cgfloat)
/// for radius in points.
///
/// For example,
///
/// ```
/// struct RadialView: View {
///     let gradient = Gradient(colors: [.red, .yellow])
///
///     var body: some View {
///         Rectangle()
///             .fill( RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 100))
///             .frame(width: 200, height: 200)
///     }
/// }
/// ```
///
/// ![A screenshot displaying a large square in the center of the screen with a
/// radial gradient applied at a start radius of 1 and end radius of 100. The
/// gradient uses red and yellow, so at small radii the square appears red, but
/// as it moves out the gradient transitions to yellow.](3CAA9064-F9B5-4B66-92F4-D1402CCB1CC2.png)
///
/// The gradient applies the color function as the distance from a center point,
/// scaled to fit within the defined start and end radii. The gradient maps the
/// unit-space center point into the bounding rectangle of each shape filled
/// with the gradient.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct RadialGradient : ShapeStyle, View {

	/// Creates a new radial gradient from a start and end point.
	///
    /// ```
    /// struct RadialView: View {
    ///     let gradient = Gradient(colors: [.red, .yellow])
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 100))
    ///             .frame(width: 200, height: 200)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a large square in the center of the screen with a
    /// radial gradient applied at a start radius of 1 and end radius of 100. The
    /// gradient uses red and yellow, so at small radii the square appears red, but
    /// as it moves out the gradient transitions to yellow.](radial-gradient-example.png)
    ///
	/// - Parameters:
	///   - gradient: The gradient containing the colors to transition through.
	///   - center: The center of the radial gradient.
	///   - startRadius: How far from the center to start the gradient.
	///   - endRadius:
    public init(gradient: Gradient, center: UnitPoint, startRadius: CGFloat, endRadius: CGFloat) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}
