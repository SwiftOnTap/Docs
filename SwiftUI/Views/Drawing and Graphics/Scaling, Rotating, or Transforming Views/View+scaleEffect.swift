@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that scales this view's rendered output by the given vertical and horizontal
    /// size amounts, relative to an anchor point.
    ///
    /// Use `scaleEffect(_:anchor:)` to scale a view by applying a scaling
    /// transform of a specific size, specified by `scale`.
    ///
    /// ```
    /// struct ScaleView: View {
    ///     var body: some View {
    ///         Image(systemName: "envelope.badge.fill")
    ///             .resizable()
    ///             .frame(width: 100, height: 100, alignment: .center)
    ///             .foregroundColor(Color.red)
    ///             .scaleEffect(CGSize(width: 0.9, height: 1.3), anchor: .leading)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray rectangular frame in the center of the screen
    /// and a red envelope icon set within it. The icon is anchored on the leading
    /// edge so it pushes up against the left hand side, but its width and height scales
    /// are set to 0.9 and 1.3, respectively, so it doesn't fill out the whole width
    /// of the frame, but it extends both above and below its height.](scaleeffect-3.png)
    ///
    /// - Parameters:
    ///   - scale: A [`CGSize`](https://developer.apple.com/documentation/CoreGraphics/CGSize) that
    ///     represents the horizontal and vertical amount to scale the view.
    ///   - anchor: The point with a default of ``UnitPoint/center`` that
    ///     defines the location within the view from which to apply the
    ///     transformation.
    @inlinable public func scaleEffect(_ scale: CGSize, anchor: UnitPoint = .center) -> some View { }


    /// A view modifier that this view's rendered output by the given amount in both the
    /// horizontal and vertical directions, relative to an anchor point.
    ///
    /// Use `scaleEffect(_:anchor:)` to apply a horizontally and vertically
    /// scaling transform to a view.
    ///
    /// ```
    /// struct ScaleView: View {
    ///     var body: some View {
    ///         Image(systemName: "envelope.badge.fill")
    ///             .resizable()
    ///             .frame(width: 100, height: 100, alignment: .center)
    ///             .foregroundColor(Color.red)
    ///             .scaleEffect(2, anchor: .leading)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with a gray rectangular frame in the center of the screen
    /// and a red envelope icon set over it. The icon is anchored on the leading
    /// edge so it pushes up against the left hand side, but its width and height are
    /// scaled by 2, so it extends from the left beyond the confines of the right
    /// side of the border as well as above and below it.](scaleeffect-2.png)
    ///
    /// - Parameters:
    ///   - s: The amount to scale the view in the view in both the horizontal
    ///     and vertical directions.
    ///   - anchor: The anchor point with a default of ``UnitPoint/center`` that
    ///     indicates the starting position for the scale operation.
    @inlinable public func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some View { }


    /// A view modifier that scales this view's rendered output by the given horizontal and vertical
    /// amounts, relative to an anchor point.
    ///
    /// Use `scaleEffect(x:y:anchor:)` to apply a scaling transform to a view by
    /// a specific horizontal and vertical amount.
    ///
    /// ```
    /// struct ScaleView: View {
    ///     var body: some View {
    ///         Image(systemName: "envelope.badge.fill")
    ///             .resizable()
    ///             .frame(width: 100, height: 100, alignment: .center)
    ///             .foregroundColor(Color.red)
    ///             .scaleEffect(x: 0.5, y: 0.5, anchor: .bottomTrailing)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a gray rectangular frame in the center of the screen
    /// and a red envelope icon set within it in the bottom right hand corner.
    /// The icon is anchored on the trailing bottom edge, but both it's vertical and
    /// horizontal dimensions are scaled down half. The scaleEffect view modifier
    /// renders the icon as taking up a quarter of its original frame.](scaleeffect.png)
    ///
    /// - Parameters:
    ///   - x: An amount that represents the horizontal amount to scale the
    ///     view. The default value is `1.0`.
    ///   - y: An amount that represents the vertical amount to scale the view.
    ///     The default value is `1.0`.
    ///   - anchor: The anchor point that indicates the starting position for
    ///     the scale operation.
    @inlinable public func scaleEffect(x: CGFloat = 1.0, y: CGFloat = 1.0, anchor: UnitPoint = .center) -> some View { }

}

