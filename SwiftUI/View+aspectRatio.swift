@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that constrains this view's dimensions to the specified aspect ratio.
    ///
    /// Use `aspectRatio(_:contentMode:)` to constrain a view's dimensions to an
    /// aspect ratio specified by a [`CGFloat`](https://developer.apple.com/documentation/coregraphics/cgfloat)
    /// using the specified content mode.
    ///
    /// If this view is resizable, the resulting view will have `aspectRatio` as
    /// its aspect ratio. In this example, the purple ellipse has a 3:4
    /// width-to-height ratio, and scales to fit its frame:
    ///
    /// ```
    /// struct EllipseView: View {
    ///     var body: some View {
    ///         Ellipse()
    ///             .fill(Color.purple)
    ///             .aspectRatio(0.75, contentMode: .fit) // 3:4 aspect ratio -> 3/4 = 0.75
    ///             .frame(width: 200, height: 200)
    ///             .border(Color(white: 0.75))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray square border in the center of the screen,
    /// and a purple filled ellipse within it. The ellipse has a 3:4 aspect ratio,
    /// which makes it so that its width is 3/4 of its height, and the height
    /// scales to fit the frame of the square.](aspectratio-2.png)
    ///
    /// - Parameters:
    ///   - aspectRatio: The ratio of width to height to use for the resulting
    ///     view. Use `nil` to maintain the current aspect ratio in the
    ///     resulting view.
    ///   - contentMode: A flag that indicates whether this view fits or fills
    ///     the parent context.
    ///
    /// - Returns: A view that constrains this view's dimensions to the aspect
    ///   ratio of the given size using ``contentMode`` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> some View { }


    /// A view modifier that constrains this view's dimensions to the aspect ratio of the given size.
    ///
    /// Use `aspectRatio(_:contentMode:)` to contstrain a view's dimentsions to
    /// an aspect ratio specified by a [`CGSize`](https://developer.apple.com/documentation/coregraphics/cgsize).
    ///
    /// If this view is resizable, the resulting view uses `aspectRatio` as its
    /// own aspect ratio. In this example, the purple ellipse has a 3:4
    /// width-to-height ratio, and scales to fill its frame:
    ///
    /// ```
    /// struct EllipseView: View {
    ///     var body: some View {
    ///         Ellipse()
    ///             .fill(Color.purple)
    ///             .aspectRatio(CGSize(width: 3, height: 4), contentMode: .fill)
    ///             .frame(width: 200, height: 200)
    ///             .border(Color(white: 0.75))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray square border in the center of the screen,
    /// and a purple filled ellipse within it, extending both above and below it.
    /// The ellipse has a 3:4 aspect ratio, which makes it so that its width is
    /// 3/4 of its height, and the width scales to fit the frame of the square.](aspectratio-1.png)
    ///
    /// - Parameters:
    ///   - aspectRatio: A size that specifies the ratio of width to height to
    ///     use for the resulting view.
    ///   - contentMode: A flag indicating whether this view should fit or fill
    ///     the parent context.
    ///
    /// - Returns: A view that constrains this view's dimensions to
    ///   `aspectRatio`, using ``contentMode`` as its scaling algorithm.
    @inlinable public func aspectRatio(_ aspectRatio: CGSize, contentMode: ContentMode) -> some View { }


    /// A view modifier that scales this view to fit its parent.
    ///
    /// Use `scaledToFit()` to scale this view to fit its parent, while
    /// maintaining the view's aspect ratio as the view scales.
    ///
    /// ```
    /// struct FitView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .fill(Color.pink)
    ///             .scaledToFit()
    ///             .frame(width: 300, height: 150)
    ///             .border(Color(white: 0.75))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray rectangular border in the center of the screen,
    /// with a pink filled circle set within it, which is rendered by the view
    /// modifier to fit directly within the height confines of the rectangle.](scaledtofit.png)
    ///
    /// This method is equivalent to calling
    /// ``View/aspectRatio(_:contentMode:)-6576a`` with a `nil` aspectRatio and
    /// a content mode of ``ContentMode/fit``.
    ///
    /// - Returns: A view that scales this view to fit its parent, maintaining
    ///   this view's aspect ratio.
    @inlinable public func scaledToFit() -> some View { }


    /// A view modifier that scales this view to fill its parent.
    ///
    /// Use `scaledToFill()` to scale this view to fill its parent, while
    /// maintaining the view's aspect ratio as the view scales:
    ///
    /// ```
    /// struct FillView: View {
    ///     var body: some View {
    ///         Circle()
    ///             .fill(Color.pink)
    ///             .scaledToFill()
    ///             .frame(width: 300, height: 150)
    ///             .border(Color(white: 0.75))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray rectangular border in the center of the screen,
    /// with a pink filled circle set within it, which is rendered by the view
    /// modifier to fill the rectangle along its width, extending both above and below
    /// the height confines.](scaledtofill.png)
    ///
    /// This method is equivalent to calling
    /// ``View/aspectRatio(_:contentMode:)-6576a`` with a `nil` aspectRatio and
    /// a content mode of ``ContentMode/fill``.
    ///
    /// - Returns: A view that scales this view to fill its parent, maintaining
    ///   this view's aspect ratio.
    @inlinable public func scaledToFill() -> some View { }

}

