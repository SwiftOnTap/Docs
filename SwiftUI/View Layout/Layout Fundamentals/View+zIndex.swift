@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that controls the display order of overlapping views.
    ///
    /// Use `zIndex(_:)` when you want to control the front-to-back ordering of
    /// views.
    ///
    /// In this example there are two overlapping rotated rectangles. The
    /// frontmost is represented by the larger index value.
    ///
    /// ```
    /// struct ZIndexView: View {
    ///     var body: some View {
    ///         VStack {
    ///             Rectangle()
    ///                 .fill(Color.yellow)
    ///                 .frame(width: 100, height: 100, alignment: .center)
    ///                 .zIndex(1) // Top layer.
    ///
    ///             Rectangle()
    ///                 .fill(Color.red)
    ///                 .frame(width: 100, height: 100, alignment: .center)
    ///                 .rotationEffect(.degrees(45))
    ///                 // Here a zIndex of 0 is the default making
    ///                 // this the bottom layer.
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot with two rectangles in a VStack, the top one yellow and
    /// the bottom orange. The orange rectangle is rotated 45 degrees such that
    /// it overlaps with the yellow rectangle above it. However, since the value
    /// 1 is passed to the zIndex view modifier for the yellow rectangle, it
    /// has priority in the order and is thus the top layer.](zindex.png)
    ///
    /// - Parameter value: A relative front-to-back ordering for this view; the
    ///   default is `0`.
    @inlinable public func zIndex(_ value: Double) -> some View { }

}

