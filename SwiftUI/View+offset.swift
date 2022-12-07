@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that translates this view horizontally and vertically by a CGSize.
    ///
    /// Use `offset(_:)` to to shift the displayed contents by the amount
    /// specified in the `offset` parameter.
    ///
    /// The original dimensions of the view aren't changed by offsetting the
    /// contents; in the example below the gray border drawn by this view
    /// surrounds the original position of the text:
    ///
    /// ```
    /// struct OffsetView: View {
    ///     var body: some View {
    ///         Text("Offset by passing CGSize()")
    ///             .border(Color.green)
    ///             .offset(CGSize(width: 20, height: 25))
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    /// ![A screenshot with a gray rectangular frame in the center of the screen,
    /// underneath which the actual text is offset below and to the right by CGSize
    /// and confined within a green rectangle.](offset-2.png)
    ///
    /// - Parameter offset: The distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by `offset`.
    @inlinable public func offset(_ offset: CGSize) -> some View { }


    /// A view modifier this view by the specified horizontal and vertical CGFloats.
    ///
    /// Use ``View/offset(x:y:)`` to to shift the displayed contents by the amount
    /// specified in the `x` and `y` parameters.
    ///
    /// The original dimensions of the view aren't changed by offsetting the
    /// contents; in the example below the gray border drawn by this view
    /// surrounds the original position of the text:
    ///
    /// ```
    /// struct OffsetView: View {
    ///     var body: some View {
    ///         Text("Offset by passing horizontal & vertical distance")
    ///             .border(Color.green)
    ///             .offset(x: 20, y: 50)
    ///             .border(Color.gray)
    ///     }
    /// }
    /// ```
    ///
    /// ![A text view with a green border reading "Offset by passing horizontal
    /// & vertical distance" thatt ahs been offsett by an x value of 20 and y
    /// value of 50, as shown by a gray border in the pre-offset location.](17.14.12.png)
    ///
    /// - Parameters:
    ///   - x: The horizontal distance to offset this view.
    ///   - y: The vertical distance to offset this view.
    ///
    /// - Returns: A view that offsets this view by `x` and `y`.
    @inlinable public func offset(x: CGFloat = 0, y: CGFloat = 0) -> some View { }

}

