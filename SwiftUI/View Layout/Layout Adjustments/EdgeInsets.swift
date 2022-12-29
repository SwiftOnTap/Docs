/// The inset distances for the sides of a rectangle.
///
/// Use this structure for 3 different modifiers:
///
/// 1. ``View/listRowInsets(_:)``
/// 2. ``View/padding(_:)-9f6b7``
/// 3. ``Image/resizable(capInsets:resizingMode:)``
///
/// This structure represents a point value in all 4 rectangular directions,
/// top, leading, bottom, trailing.
///
/// In the following example, padding is added to a rectangle using
/// edge insets:
///
/// ```
/// struct PaddedRectangleView: View {
///     let insets = EdgeInsets(top: 20, leading: 5, bottom: 30, trailing: 10)
///
///     var body: some View {
///         Rectangle()
///             .padding(insets)
///     }
/// }
/// ```
///
/// ![A view containing a default rectangle with padding insets, a static
/// variable defined by EdgeInsets; the black rectangle fills up most of the
/// frame up until the edges, where a gap remains due to the insets.](20.24.08.png)
///
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@frozen public struct EdgeInsets : Equatable {

    /// How far inset the rectangle is from the top edge.
    ///
    /// This value is normally specified in the initializer, but it can
    /// also be changed directly:
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         var insets = EdgeInsets()
    ///         insets.top = 20
    ///
    ///         return Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the 20 point top edge inset, which creates
    /// gap between the shape and the top edge of the frame.](20.25.10.png)
    ///
    public var top: CGFloat

    /// How far inset the rectangle is from the leading edge.
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         var insets = EdgeInsets()
    ///         insets.leading = 20
    ///
    ///         return Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the 20 point leading edge inset, which creates
    /// gap between the shape and the left edge of the frame.](20.26.11.png)
    ///
    public var leading: CGFloat

    /// How far inset the rectangle is from the bottom edge.
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         var insets = EdgeInsets()
    ///         insets.bottom = 20
    ///
    ///         return Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the 20 point bottom edge inset, which creates
    /// gap between the shape and the bottom edge of the frame.](20.26.55.png)
    ///
    public var bottom: CGFloat

    /// How far inset the rectangle is from the trailing edge.
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         var insets = EdgeInsets()
    ///         insets.trailing = 20
    ///
    ///         return Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the 20 point trailing edge inset, which creates
    /// gap between the shape and the right edge of the frame.](20.27.41.png)
    ///
    public var trailing: CGFloat

    /// Creates a new ``EdgeInsets`` from inset parameters.
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     let insets = EdgeInsets(top: 20, leading: 5, bottom: 30, trailing: 10)
    ///
    ///     var body: some View {
    ///         Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the inset values, which create gaps between the
    /// shape and the edge of the frame.](20.29.02.png)
    ///
    /// - Parameters:
    ///   - top: Inset distance from the top edge.
    ///   - leading: Inset distance from the leading edge.
    ///   - bottom: Inset distance from the bottom edge.
    ///   - trailing: Inset distance from the trailing edge.
    @inlinable public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) { }

    /// Creates a new ``EdgeInsets`` with zero insets on all edges.
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         var insets = EdgeInsets()
    ///         insets.trailing = 20
    ///
    ///         return Rectangle()
    ///             .padding(insets)
    ///     }
    /// }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by EdgeInsets; the black rectangle fills up most of the
    /// frame, limited only by the 20 point trailing edge inset, which creates
    /// gap between the shape and the right edge of the frame.](20.27.41.png)
    ///
    @inlinable public init() { }

}

extension EdgeInsets {

    /// Create edge insets from the equivalent NSDirectionalEdgeInsets.
    ///
    /// To learn more about the parameter, check out the documentation
    /// page on
    /// [`NSDirectionalEdgeInsets`](https://developer.apple.com/documentation/uikit/nsdirectionaledgeinsets).
    ///
    /// ```
    /// struct PaddedRectangleView: View {
    ///     var body: some View {
    ///         let insets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
    ///         let edgeInset = EdgeInsets(insets)
    ///
    ///         return Rectangle()
    ///             .padding(edgeInset)
    ///     }
    // }
    /// ```
    ///
    /// ![A view containing a default rectangle with padding insets, a static
    /// variable defined by the NSDirectionalEdgeInsets within EdgeInsets; the
    /// black rectangle fills up most of the frame, limited only by the edge
    /// insets, which create gaps between the shape and the edges of the frame.](22.00.40.png)
    ///
    /// - Parameter nsEdgeInsets: The NSEdgeInsets to use for creating an
    /// edge inset.
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, *)
    @available(watchOS, unavailable)
    public init(_ nsEdgeInsets: NSDirectionalEdgeInsets) { }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension EdgeInsets : Animatable {

    /// The type defining the data to animate.
    public typealias AnimatableData = AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>

    /// The data to animate.
    public var animatableData: EdgeInsets.AnimatableData
}

