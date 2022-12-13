@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adds a grayscale effect to this view.
    ///
    /// A grayscale effect reduces the intensity of colors in this view.
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         VStack {
    ///             ForEach(0..<6) { i in
    ///                 RoundedRectangle(cornerRadius: 10.0)
    ///                     .fill(Color.yellow)
    ///                     .grayscale(Double(i) *0 .2 - 0.01)
    ///             }
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying six rectangles in a VStack, with increasing
    /// grayscale amounts from top to bottom. The first rectangle appears fully
    /// yellow, and the color is gradually reduced in intensity until it appears
    /// as fully gray in the bottom rectangle.](grayscale.png)
    ///
    /// - Parameter amount: The intensity of grayscale to apply from 0.0 to less
    ///   than 1.0. Values closer to 0.0 are more colorful, and values closer to
    ///   1.0 are less colorful.
    ///
    /// - Returns: A view that adds a grayscale effect to this view.
    @inlinable public func grayscale(_ amount: Double) -> some View { }

}

