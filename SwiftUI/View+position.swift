@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that positions the center of this view at the specified point in its parent's
    /// coordinate space.
    ///
    /// Use the `position(_:)` modifier to place the center of a view at a
    /// specific coordinate in the parent view using a [`CGPoint`](https://developer.apple.com/documentation/coregraphics/cgpoint)
    /// to specify the `x`
    /// and `y` offset.
    ///
    /// ```
    /// struct PositionView: View {
    ///     var body: some View {
    ///         Text("Position by passing a CGPoint()")
    ///             .position(CGPoint(x: 175, y: 100))
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text near the top of the screen that reads
    /// "Position by passing a CGPoint()" which is rendered at the new center
    /// of the view using the position modifier.](position-2.png)
    ///
    /// - Parameter position: The point at which to place the center of this
    ///   view.
    ///
    /// - Returns: A view that fixes the center of this view at `position`.
    @inlinable public func position(_ position: CGPoint) -> some View { }


    /// A view modifier that positions the center of this view at the specified coordinates in its
    /// parent's coordinate space.
    ///
    /// Use the `position(x:y:)` modifier to place the center of a view at a
    /// specific coordinate in the parent view using an `x` and `y` offset.
    ///
    /// ```
    /// struct PositionView: View {
    ///     var body: some View {
    ///         Text("Position by passing the x and y coordinates")
    ///             .position(x: 175, y: 100)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with text near the top of the screen that reads
    /// "Position by passing the x and y coordinates" which is rendered at the new center
    /// of the view using the position modifier.](position.png)
    ///
    /// - Parameters:
    ///   - x: The x-coordinate at which to place the center of this view.
    ///   - y: The y-coordinate at which to place the center of this view.
    ///
    /// - Returns: A view that fixes the center of this view at `x` and `y`.
    @inlinable public func position(x: CGFloat = 0, y: CGFloat = 0) -> some View { }

}

