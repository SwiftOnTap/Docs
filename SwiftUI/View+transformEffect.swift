@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that applies an affine transformation to this view's rendered output.
    ///
    /// Use `transformEffect(_:)` to rotate, scale, translate, or skew the
    /// output of the view according to the provided
    /// [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform).
    ///
    /// In the example below, the text is rotated at -30˚ on the `y` axis.
    ///
    /// ```
    /// struct TransformView: View {
    ///     let transform = CGAffineTransform(rotationAngle: -30 * (.pi / 180))
    ///
    ///     var body: some View {
    ///         Text("Projection effect using transforms")
    ///             .transformEffect(transform)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot displaying a rectangular border in the center of the
    /// screen, with text that reads "Projection effects using transforms"
    /// extending at a 30 degree angle from its left side towards the top of
    /// the screen.](transformeffect.png)
    ///
    /// - Parameter transform: A
    /// [`CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgaffinetransform).
    @inlinable public func transformEffect(_ transform: CGAffineTransform) -> some View { }

}

