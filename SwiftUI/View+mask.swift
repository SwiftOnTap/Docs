@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Mask one view on top of another.
    ///
    /// Applying the `mask(_:)` modifier will make the modified view fully transparent, except for those pixels which overlap with the masked view.
    ///
    /// For example, without a mask, the following view renders as a normal rectangle:
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(LinearGradient(
    ///                     gradient: Gradient(colors: [.green, .blue, .purple]),
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot that displays a rectangle that takes up the whole screen,
    /// with a gradient of green to purple from left to right.](linear-gradient.png)
    ///
    /// Now if we apply a mask on a text view, we get the following result:
    ///
    /// ```
    /// struct TextView: View {
    ///     var body: some View {
    ///         Text("Bananas are some of the best fruit")
    ///             .font(.title)
    ///             .fontWeight(.bold)
    ///     }
    /// }
    ///
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         Rectangle()
    ///             .fill(LinearGradient(
    ///                     gradient: Gradient(colors: [.green, .blue, .purple]),
    ///                     startPoint: .leading,
    ///                     endPoint: .trailing))
    ///             .mask(TextView())
    ///     }
    /// }
    /// ```
    ///
    /// ![A screen shot that displays bold text "Bananas are some of the best
    /// fruit" aligned to the left in the center of the screen. The mask modifier
    /// on the gradient rectangle renders the text in the same gradient pattern
    /// color as the rectangle behind it, while keeping the rest of the screen
    /// white.](mask-example-1.png)
    ///
    /// This page was inspired by work from @philipcdavis on Github.
    ///
    /// - Parameter mask: The view whose alpha the rendering system applies to
    ///   the specified view.
    @inlinable public func mask<Mask>(_ mask: Mask) -> some View where Mask : View { }

}

