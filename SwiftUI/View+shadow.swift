@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that adds a shadow to this view.
    ///
    /// Shadow has four possible arguments.
    ///
    /// Create a shadow with just a radius:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(Color.white)
    ///             .frame(width: 100, height: 100)
    ///             .shadow(radius: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a white square in the center of the screen
    /// with a light gray shadow surrounding it, as rendered by the shadow view
    /// modifier with only the radius specified.](shadow-1.png)
    ///
    /// Modify the color:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(Color.white)
    ///             .frame(width: 100, height: 100)
    ///             .shadow(color: .red, radius: 10)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a white square in the center of the screen
    /// with a red shadow surrounding it, as rendered by the shadow view
    /// modifier with both the radius and color specified.](shadow-2.png)
    ///
    /// Modify the x offset:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(Color.white)
    ///             .frame(width: 100, height: 100)
    ///             .shadow(color: .red, radius: 10, x: 20)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a white square in the center of the screen
    /// with a red shadow offset to the right hand side, as rendered by the shadow view
    /// modifier with radius, color, and x offset specified.](shadow-3.png)
    ///
    /// Modify the x & y offset:
    ///
    /// ```
    /// struct ContentView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(Color.white)
    ///             .frame(width: 100, height: 100)
    ///             .shadow(color: .red, radius: 10, x: 20, y: 20)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a white square in the center of the screen
    /// with a red shadow offset to its lower right hand side, as rendered by the shadow view
    /// modifier with radius, color, x, and y offset specified.](shadow-4.png)
    ///
    /// - Parameters:
    ///   - color: The shadow's color.
    ///   - radius: The shadow's size.
    ///   - x: A horizontal offset you use to position the shadow relative to
    ///     this view.
    ///   - y: A vertical offset you use to position the shadow relative to this
    ///     view.
    ///
    /// - Returns: A view that adds a shadow to this view.
    @inlinable public func shadow(color: Color = Color(.sRGBLinear, white: 0, opacity: 0.33), radius: CGFloat, x: CGFloat = 0, y: CGFloat = 0) -> some View { }

}

