@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adjusts the color saturation of the view.
    ///
    /// Use color saturation to increase or decrease the intensity of colors in
    /// a view.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<6) { i in
    ///                 RoundedRectangle(cornerRadius: 10.0)
    ///                     .fill(Color.yellow)
    ///                     .saturation(Double(i) * 0.2)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying six rounded rectangles in a VStack, with
    /// increasing levels of saturation applied from top to bottom. At full
    /// saturation, the yellow fill is fully visible, whereas the yello rectangle
    /// appears gray at its least saturated in the top rectangle.](saturation-modifier.png)
    ///
    /// See related symbol ``View/contrast(_:)``.
    ///
    /// - Parameter amount: The amount of saturation to apply to this view.
    ///
    /// - Returns: A view that adjusts the saturation of this view.
    @inlinable public func saturation(_ amount: Double) -> some View { }

}

