@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Sets the transparency of a view.
    ///
    /// Apply opacity to reveal views that are behind another view or to
    /// de-emphasize a view.
    ///
    /// When applying the `opacity(_:)` modifier to a view that has already had
    /// its opacity transformed, the modifier multiplies the effect of the
    /// underlying opacity transformation.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<6) { i in
    ///                 RoundedRectangle(cornerRadius: 10.0)
    ///                     .fill(Color.yellow)
    ///                     .opacity(Double(i) * 0.2)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying six rounded rectangles in a VStack, with
    /// increasing levels of opacity from top to bottom. At the top, the yellow
    /// rectangle is fully transparent, as opacity is set to 0, whereas at the
    /// bottom the rectangle has opacity set to 1, making it fully yellow.](opacity-modifier.png)
    ///
    /// - Parameter opacity: A value between 0 (fully transparent) and 1 (fully
    ///   opaque).
    ///
    /// - Returns: A view that sets the transparency of this view.
    @inlinable public func opacity(_ opacity: Double) -> some View { }

}

