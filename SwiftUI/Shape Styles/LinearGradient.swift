/// A linear gradient.
///
/// ```
/// struct ExampleView: View {
///     var body: some View {
///         RoundedRectangle(cornerRadius: 10)
///             .fill(LinearGradient(
///                     gradient: Gradient(colors: [.green, .blue, .purple]),
///                     startPoint: .leading,
///                     endPoint: .trailing))
///             .padding()
///     }
/// }
/// ```
///
/// ![A view containing a rounded rectangle with a 10 point corner, padding, and a
/// linear gradient fill; the linear gradient goes from green to blue to purple
/// with a leading startPoint and trailing endPoint.](390A2D8E-6ABA-4FDD-A9F0-12EF6EEE7414.png)
///
/// The gradient applies the color function along an axis, as defined by its
/// start and end points. The gradient maps the unit-space points into the
/// bounding rectangle of each shape filled with the gradient.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct LinearGradient : ShapeStyle, View {

    /// Creates a new linear gradient from the Gradient colors, the start, and the end.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         RoundedRectangle(cornerRadius: 10)
    ///             .fill(LinearGradient(
    ///                 gradient: Gradient(colors: [.green, .blue, .purple]),
    ///                 startPoint: .leading,
    ///                 endPoint: .trailing))
    ///             .padding()
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a rounded rectangle with a 10 point corner, padding, and a
    /// linear gradient fill; the linear gradient goes from green to blue to purple
    /// with a leading startPoint and trailing endPoint.](390A2D8E-6ABA-4FDD-A9F0-12EF6EEE7414.png)
    ///
    /// - Parameters:
    ///   - gradient: The gradient containing the ordered colors to be used.
    ///   - startPoint: The unit point where the gradient starts.
    ///   - endPoint: The unit point where the gradient ends.
    public init(gradient: Gradient, startPoint: UnitPoint, endPoint: UnitPoint) { }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body
}

