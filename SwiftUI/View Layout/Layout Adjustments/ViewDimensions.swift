/// A view's size and its alignment guides in its own coordinate space.
///
/// Most frequently used when working with alignment guides.
/// See ``View/alignmentGuide(_:computeValue:)-4e1d1``
/// and ``View/alignmentGuide(_:computeValue:)-72c7c`` for more
/// on how to apply `ViewDimensions`.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct ViewDimensions {

    /// The view's width.
    public var width: CGFloat { get }

    /// The view's height.
    public var height: CGFloat { get }

    /// Gets the value of the given horizontal guide.
    ///
    /// It will return the position of the horizontal alignment value you pass
    /// as a parameter. See ``HorizontalAlignment`` for all the potential input values.
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("🍌🍌")
    ///             .alignmentGuide(HorizontalAlignment.leading, computeValue: { ViewDimensions in
    ///                 return ViewDimensions[HorizontalAlignment.leading]
    ///             })
    ///     }
    /// }
    /// ```
    public subscript(guide: HorizontalAlignment) -> CGFloat { get }

    /// Gets the value of the given vertical guide.
    ///
    /// It will return the position of the vertical alignment value you pass
    /// as a parameter. See ``VerticalAlignment`` for all the potential input values.
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("🍌🍌")
    ///             .alignmentGuide(VerticalAlignment.center, computeValue: { ViewDimensions in
    ///                 return ViewDimensions[VerticalAlignment.center]
    ///             })
    ///     }
    /// }
    /// ```
    public subscript(guide: VerticalAlignment) -> CGFloat { get }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("🍌🍌")
    ///             .alignmentGuide(HorizontalAlignment.leading, computeValue: { ViewDimensions in
    ///                 return ViewDimensions[HorizontalAlignment.leading]
    ///             })
    ///     }
    /// }
    /// ```
    ///
    /// See ``HorizontalAlignment`` for all the potential input values.
    public subscript(explicit guide: HorizontalAlignment) -> CGFloat? { get }

    /// Gets the explicit value of the given alignment guide in this view, or
    /// `nil` if no such value exists.
    ///
    /// For example:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Text("🍌🍌")
    ///             .alignmentGuide(VerticalAlignment.leading, computeValue: { ViewDimensions in
    ///                 return ViewDimensions[VerticalAlignment.leading]
    ///             })
    ///     }
    /// }
    /// ```
    ///
    /// See ``VerticalAlignment`` for all the potential input values.
    public subscript(explicit guide: VerticalAlignment) -> CGFloat? { get }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension ViewDimensions : Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: ViewDimensions, rhs: ViewDimensions) -> Bool { }
}

