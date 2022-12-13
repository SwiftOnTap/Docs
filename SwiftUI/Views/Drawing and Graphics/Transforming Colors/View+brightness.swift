@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Brighten the view by the specified amount.
    ///
    /// Use `brightness(_:)` to brighten the intensity of the colors in a view.
    /// The example below shows a series of yellow squares, with their brightness
    /// increasing from 0 (fully yellow) to 100% (white) in 20% increments.
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<6) { i in
    ///                 RoundedRectangle(cornerRadius: 10.0)
    ///                     .fill(Color.yellow)
    ///                     .brightness(Double(i) * 0.2)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a series of six rectangles arranged in a
    /// VStack with increasing brightness from top to bottom in 20% increments.
    /// The colors change from pure yellow on top to white on bottom.](brightness.png)
    ///
    /// - Parameter amount: A value between 0 (no effect) and 1 (full white
    ///   brightening) that represents the intensity of the brightness effect.
    ///
    /// - Returns: A view that brightens this view by the specified amount.
    @inlinable public func brightness(_ amount: Double) -> some View { }

}

