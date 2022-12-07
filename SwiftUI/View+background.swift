@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {

    /// Places a view behind the current view.
    ///
    /// The layout of the original view will be unchanged from this. Its original
    /// size and location will stay the same.
    ///
    /// If you would like to place a view in front of your current view instead,
    /// you can use the ``View/overlay(_:alignment:)`` function.
    ///
    /// ```
    /// struct OverlayView: View {
    ///     var body: some View {
    ///         Text("I have a floral background")
    ///             .background(Text("🌸🌹🌺💐"))
    ///     }
    /// }
    /// ```
    ///
    /// ![A TextView reading "I have a floral background" with the corresponding
    /// background text "🌸🌹🌺💐" aligned beneath it.](background.png)
    ///
    /// Check out ``View/overlay(_:alignment:)``, which is the opposite
    /// modifier.
    ///
    /// - Parameters:
    ///   - background: The view to place behind.
    ///   - alignment: Where to align the behind view relative to the current view. Defaults to center.
    @inlinable public func background<Background>(_ background: Background, alignment: Alignment = .center) -> some View where Background : View { }

}

