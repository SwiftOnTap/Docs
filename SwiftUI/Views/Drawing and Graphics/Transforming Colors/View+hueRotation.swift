@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Applies a hue rotation effect.
    ///
    /// Use hue rotation effect to shift all of the colors in a view according
    /// to the angle you specify.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<6) { i in
    ///                 RoundedRectangle(cornerRadius: 10.0)
    ///                     .fill(Color.yellow)
    ///                     .hueRotation(Angle(degrees: Double(i) * 360/12))
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying six rectangles in a VStack, beginning with a
    /// fully yellow filled rectangle, and applying the hueRotation view modifier to rotate
    /// the hue with each succeeding rectangle. The colors shift from yellow to
    /// green to blue from top to bottom.](huerotation.png)
    ///
    /// - Parameter angle: The hue rotation angle to apply to the colors in this
    ///   view.
    ///
    /// - Returns: A view that applies a hue rotation effect to this view.
    @inlinable public func hueRotation(_ angle: Angle) -> some View { }

}

