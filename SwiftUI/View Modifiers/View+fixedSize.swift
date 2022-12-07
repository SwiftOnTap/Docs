@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that fixes this view at its ideal size in the specified dimensions.
    ///
    /// This function behaves like ``View/fixedSize()``, except with
    /// `fixedSize(horizontal:vertical:)` the fixing of the axes can be
    /// optionally specified in one or both dimensions. For example, if you
    /// horizontally fix a text view before wrapping it in the frame view,
    /// you're telling the text view to maintain its ideal _width_. The view
    /// calculates this to be the space needed to represent the entire string.
    ///
    /// ```
    /// struct FixedSizeView: View {
    ///     var body: some View {
    ///         Text("A single line of text, too long to fit in a box.")
    ///             .fixedSize(horizontal: true, vertical: false)
    ///             .frame(width: 200, height: 200)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a square frame in the center and text that reads
    /// "A single line of text, too long to fit in a box." The text extends outside
    /// the confines of the box on either side, as rendered by fixing the horizontal
    /// dimension so that its ideal width is maintained.](fixedsize-2.png)
    ///
    /// This can result in the view exceeding the parent's bounds, which may or
    /// may not be the effect you want.
    ///
    /// - Parameters:
    ///   - horizontal: A Boolean value that indicates whether to fix the width
    ///     of the view.
    ///   - vertical: A Boolean value that indicates whether to fix the height
    ///     of the view.
    ///
    /// - Returns: A view that fixes this view at its ideal size in the
    ///   dimensions specified by `horizontal` and `vertical`.
    @inlinable public func fixedSize(horizontal: Bool, vertical: Bool) -> some View { }


    /// A view modifier that fixes this view at its ideal size.
    ///
    /// During the layout of the view hierarchy, each view proposes a size to
    /// each child view it contains. If the child view doesn't need a fixed size
    /// it can accept and conform to the size offered by the parent.
    ///
    /// For example, a ``Text`` view placed in an explicitly sized frame wraps
    /// and truncates its string to remain within its parent's bounds:
    ///
    /// ```
    /// struct FixedSizeView: View {
    ///     var body: some View {
    ///         Text("A single line of text, too long to fit in a box.")
    ///             .frame(width: 200, height: 200)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a square frame in the center, with text fit within it
    /// on two lines that reads "A single line of text, too long to fit in a box."
    /// Without the fixedSize modifier, the text adjusts to fit.](fixedsize-1.png)
    ///
    /// The `fixedSize()` modifier can be used to create a view that maintains
    /// the *ideal size* of its children both dimensions:
    ///
    /// ```
    /// struct FixedSizeView: View {
    ///     var body: some View {
    ///         Text("A single line of text, too long to fit in a box.")
    ///             .fixedSize()
    ///             .frame(width: 200, height: 200)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a square frame in the center and text that reads
    /// "A single line of text, too long to fit in a box." The text extends outside
    /// the confines of the box on either side, as rendered by fixing the horizontal
    /// dimension so that its ideal width is maintained.](fixedsize-2.png)
    ///
    /// This can result in the view exceeding the parent's bounds, which may or
    /// may not be the effect you want.
    ///
    /// You can think of `fixedSize()` as the creation of a *counter proposal*
    /// to the view size proposed to a view by its parent. The ideal size of a
    /// view, and the specific effects of `fixedSize()` depends on the
    /// particular view and how you have configured it.
    ///
    /// To create a view that fixes the view's size in either the horizontal or
    /// vertical dimensions, see ``View/fixedSize(horizontal:vertical:)``.
    ///
    /// - Returns: A view that fixes this view at its ideal size.
    @inlinable public func fixedSize() -> some View { }

}

