@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// A view modifier that sets the blend mode for compositing this view with
    /// overlapping views.
    ///
    /// Use `blendMode(_:)` to combine overlapping views and use a different
    /// visual effect to produce the result. The ``BlendMode`` enumeration
    /// defines many possible effects.
    ///
    /// Test `blendMode(_:)` with images. To use the following example, drag in
    /// the following two photos and label them "ocean" and "space".
    ///
    /// ![An image of the ocean](ocean.jpg)
    ///
    /// ![An image of space](space.jpg)
    ///
    /// ```
    /// struct ExampleView: View {
    ///     var body: some View {
    ///         ZStack {
    ///             Image("ocean")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///
    ///             Image("space")
    ///                 .resizable()
    ///                 .scaledToFit()
    ///                 .blendMode(.softLight)
    ///         }
    ///     }
    /// }
    /// ```
    ///
    /// ![A screenshot of the "ocean" and "space" images blended together, where
    /// the "space" photo has a softLight blendMode](view-blend-mode.png)
    ///
    /// - Parameter blendMode: The ``BlendMode`` for compositing this view.
    ///
    /// - Returns: A view that applies ``blendMode`` to this view.
    @inlinable public func blendMode(_ blendMode: BlendMode) -> some View { }

}

